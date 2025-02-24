from rest_framework import serializers
from .models import *
from member.serializers import MemberSerializer
from django.utils.translation import gettext as _

class TagSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tag
        fields = ['id', 'name']

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'name']

class ImageSerializer(serializers.ModelSerializer):
    image_url = serializers.SerializerMethodField()

    class Meta:
        model = Image
        fields = ['id', 'image_url']
        read_only_fields = ['hash', 'work']

    def get_image_url(self, obj):
        request = self.context.get('request')
        if obj.image and request:
            return request.build_absolute_uri(obj.image.url)
        return None

    def validate_image(self, value):
        """
        Validate that the image is less than 5MB and is either PNG or JPG.
        """
        # Maximum file size: 5MB (5 * 1024 * 1024 bytes)
        max_size = 5 * 1024 * 1024  # 5MB
        if value.size > max_size:
            raise serializers.ValidationError(_("Image size cannot exceed 5MB."))

        # Validate file format (PNG and JPG only)
        if not value.name.lower().endswith(('.png', '.jpg', '.jpeg')):
            raise serializers.ValidationError(_("Only PNG and JPG images are allowed."))

        # Generate hash to check for uniqueness
        image_hash = self.generate_image_hash(value)
        # if Image.objects.filter(hash=image_hash).exists():
        #     raise serializers.ValidationError("Image already exists in the system.")

        return value

    def generate_image_hash(self, image):
        """Generate a hash for the image file content."""
        import hashlib
        image_content = image.read()
        return hashlib.sha256(image_content).hexdigest()

    def create(self, validated_data):
        image = validated_data['image']
        image_hash = self.generate_image_hash(image)
        validated_data['hash'] = image_hash
        return super().create(validated_data)


class WorkSerializer(serializers.ModelSerializer):
    images = serializers.ListField(
        child=serializers.ImageField(), write_only=True, required=True
    )
    images_data = ImageSerializer(many=True, read_only=True, source='images')
    is_liked_by_user = serializers.SerializerMethodField()
    likes_count = serializers.IntegerField(source='likes.count', read_only=True)
    member = MemberSerializer(read_only=True)
    category = serializers.PrimaryKeyRelatedField(queryset=Category.objects.all(), required=True)
    tags = serializers.PrimaryKeyRelatedField(queryset=Tag.objects.all(), many=True, required=True)

    class Meta:
        model = Work
        fields = ['id', 'title', 'description', 'member', 'is_public', 'price', 'tags', 'category', 'images', 'images_data',
                  'likes_count', 'is_liked_by_user']
        read_only_fields = ['member', 'images_data', 'tags', 'category']

    def get_is_liked_by_user(self, obj):
        """
        Check if the current authenticated user has liked this work.
        """
        request = self.context.get('request')
        if request and request.user.is_authenticated:
            return obj.likes.filter(member=request.user).exists()
        return False

    def validate_images(self, value):
        """
        Validate that the number of images does not exceed 5.
        """
        if len(value) > 5:
            raise serializers.ValidationError(_("You can upload a maximum of 5 images for an artwork."))
        return value

    def create(self, validated_data):
        # Extract images data before creating artwork
        print(f"iamges: {validated_data}")
        images_data = validated_data.pop('images', [])
        tags_data = validated_data.pop('tags', [])
        artwork = Work.objects.create(**validated_data)
        
        try:
            if artwork.member.parent.is_approved:
                artwork.is_approved = True
                artwork.save()
        except:
            pass

        artwork.tags.set(tags_data)

        # Validate the number of images
        if len(images_data) > 5:
            raise serializers.ValidationError(_("You can upload a maximum of 5 images for an artwork."))

        # Create images and link them to the artwork
        for image in images_data:
            Image.objects.create(work=artwork, image=image)

        return artwork
    
    def update(self, instance, validated_data):
        images_data = validated_data.pop('images', None)
        tags_data = validated_data.pop('tags', None)

        # Update the other fields normally
        instance = super().update(instance, validated_data)

        # Handle tags update if provided
        if tags_data is not None:
            instance.tags.set(tags_data)

        # Handle images update
        if images_data is not None:
            # Delete old images before adding new ones
            instance.images.all().delete()

            # Add the new images
            for image in images_data:
                Image.objects.create(work=instance, image=image)

        return instance

    def to_representation(self, instance):
        """
        Customize the representation to include tag and category details with id and name.
        """
        representation = super().to_representation(instance)
        representation['tags'] = TagSerializer(instance.tags.all(), many=True).data
        representation['category'] = CategorySerializer(instance.category).data

        return representation
