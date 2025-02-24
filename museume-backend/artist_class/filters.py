import django_filters
from .models import ArtistClass
from django.utils import timezone

class ArtistClassFilter(django_filters.FilterSet):
    class_type = django_filters.ChoiceFilter(
        choices=[('real_time', 'Real Time'), ('recorded', 'Recorded')],
        method='filter_class_type'
    )
    is_free = django_filters.BooleanFilter(field_name='is_free')
    search = django_filters.CharFilter(field_name='name', lookup_expr='icontains')

    class Meta:
        model = ArtistClass
        fields = ['class_type', 'is_free', 'search']

    def filter_class_type(self, queryset, name, value):
        """
        Custom filtering logic for class type.
        """
        return queryset.filter(class_type=value)
