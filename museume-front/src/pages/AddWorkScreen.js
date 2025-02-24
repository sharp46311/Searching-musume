import React, { useState, useEffect } from 'react';
import { Upload } from 'lucide-react';
import Navigation from './Navigation';
import { useFormik } from 'formik';
import * as Yup from 'yup';
import { useDispatch, useSelector } from 'react-redux';
import { addWork, getCategories, getTags } from '../redux/slices/workSlice';
import Loader from '../components/Loader';
import { useTranslation } from 'react-i18next'; // Import the useTranslation hook
import { useLocation, useNavigate } from 'react-router-dom';

const RegisterWorkForm = () => {
  const { t } = useTranslation(); // Use the translation function
  const [images, setImages] = useState([]);
  const [selectedTags, setSelectedTags] = useState([]);
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const { isLoading, error, addWorkRes, categories, tags } = useSelector((state) => state.work);

  useEffect(() => {
    dispatch(getCategories());
    dispatch(getTags());
  }, [dispatch]);
  console.log("selected tags", selectedTags)
  // Validation Schema
  const validationSchema = Yup.object({
    tags: Yup.array()
      .min(0, t('At least one tag is required'))
      .required(t('Tag is required')),
    images: Yup.array()
      .min(1, t('At least one image is required'))
      .max(5, t('Maximum 5 images are allowed'))
      .required(t('Image is required')),
  });

  const formik = useFormik({
    initialValues: {
      images: [],
      title: '',
      comments: '',
      category: '',
      tags: [],
      isIndicated: false,
    },
    validationSchema,
    onSubmit: (values) => {
      const formData = new FormData();
      // Only append up to 5 images
      const imagesToUpload = values.images.slice(0, 5);
      imagesToUpload.forEach((image) => {
        formData.append('images', image);
      });
      formData.append('title', values.title);
      formData.append('description', values.comments);
      formData.append('category', values.category);
      values.tags.forEach((tag) => {
        formData.append('tags', tag);
      });
      formData.append('is_public', values.isIndicated);

      dispatch(addWork(formData));
    },
  });

  useEffect(() => {
    if (addWorkRes?.id) {
      formik.resetForm();
      setImages([]);
      setSelectedTags([]);
      // Re-fetch tags and categories after successful submission
      dispatch(getCategories());
      dispatch(getTags());

      navigate('/my-work');
    }
  }, [addWorkRes, navigate]);

  const handleImageUpload = (e) => {
    const files = Array.from(e.target.files);
    if (files.length > 5) {
      alert(t('You can only upload up to 5 images'));
      return;
    }

    // If current images plus new files would exceed 5
    if (images.length + files.length > 5) {
      alert(t('Total number of images cannot exceed 5'));
      return;
    }

    setImages([...images, ...files].slice(0, 5));
    formik.setFieldValue('images', [...images, ...files].slice(0, 5));
  };

  const removeImage = (index) => {
    const newImages = images.filter((_, i) => i !== index);
    setImages(newImages);
    formik.setFieldValue('images', newImages);
  };

  const handleTagSelect = (e) => {
    const tagId = e.target.value;
    if (tagId && !selectedTags.includes(tagId)) {
      const newTags = [...selectedTags, tagId];
      setSelectedTags(newTags);
      formik.setFieldValue('tags', newTags);
    }
  };

  const removeTag = (tagIdToRemove) => {
    const newTags = selectedTags.filter(tagId => tagId !== tagIdToRemove);
    setSelectedTags(newTags);
    formik.setFieldValue('tags', newTags);
  };
  return (
    <>
      <Navigation />
      <form onSubmit={formik.handleSubmit} className="register-work-container">
        <h1 className="form-title-work">{t('Register your work')}</h1>

        <div className="form-section">
          <label className="work-labal-class">{t('Image of the work')}</label>
          <div className="upload-container">
            <input
              type="file"
              multiple
              accept="image/*"
              onChange={handleImageUpload}
              className="file-input"
              id="image-upload"
              disabled={images.length >= 5}
            />
            <label htmlFor="image-upload" className="upload-area">
              <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center' }}>
                <Upload className="upload-icon" />
              </div>
              <span className="upload-text-work">{t('Upload Image')}</span>
              <span className="upload-limit">({t('up to a maximum of 5 pieces')})</span>
            </label>
          </div>
          {formik.touched.images && formik.errors.images && (
            <div className="error-message">{formik.errors.images}</div>
          )}
        </div>

        <div className="uploaded-images">
          {images.map((image, index) => (
            <div key={index} className="image-preview">
              <img src={URL.createObjectURL(image)} alt={`preview-${index}`} className="image-thumbnail" />
              <button type="button" className="image-remove" onClick={() => removeImage(index)}>
                &times;
              </button>
            </div>
          ))}
        </div>

        <div className="form-section">
          <label className="work-labal-class">{t('Title')}</label>
          <input
            type="text"
            placeholder={t('Title of work')}
            {...formik.getFieldProps('title')}
            className={`text-input ${formik.touched.title && formik.errors.title ? 'error-input' : ''}`}
          />
          {formik.touched.title && formik.errors.title && (
            <div className="error-message">{formik.errors.title}</div>
          )}
        </div>

        <div className="form-section">
          <label className="work-labal-class">{t('Comments on the work')}</label>
          <textarea
            placeholder={t('Please write your comments on the artwork.')}
            {...formik.getFieldProps('comments')}
            className={`text-area ${formik.touched.comments && formik.errors.comments ? 'error-input' : ''}`}
          />
          {formik.touched.comments && formik.errors.comments && (
            <div className="error-message">{formik.errors.comments}</div>
          )}
        </div>

        <div className="publish-settings">
          <div className="publish-settings-title">{t('publish settings')}</div>
          <div className="switches-container">
            <div className="switch-group">
              <label className="toggle">
                <input
                  type="checkbox"
                  {...formik.getFieldProps('isIndicated')}
                />
                <span className="slider"></span>
              </label>

            </div>
          </div>
        </div>

        <div className="form-section">
          <label className="work-labal-class">{t('Category Settings')}</label>
          <select
            {...formik.getFieldProps('category')}
            className={`select-input ${formik.touched.category && formik.errors.category ? 'error-input' : ''}`}
          >
            <option value="" disabled>{t('Select a category')}</option>
            {categories.map((category) => (
              <option key={category.id} value={category.id}>
                {category.name}
              </option>
            ))}
          </select>
          {formik.touched.category && formik.errors.category && (
            <div className="error-message">{formik.errors.category}</div>
          )}
        </div>

        {/* <div className="form-section">
          <label className="work-labal-class">{t('Select a tag')}</label>
          <div className={`tags-input-container ${formik.touched.tags && formik.errors.tags ? 'error' : ''}`}>
            <div className="tags-list">
              {selectedTags.map((tagId) => {
                const tag = tags.find(t => t.id === +tagId);
                return (
                  <span key={tagId} className="tag-badge">
                    {tag?.name}
                    <button
                      type="button"
                      className="tag-remove-btn"
                      onClick={() => removeTag(tagId)}
                    >
                      ×
                    </button>
                  </span>
                );
              })}
            </div>
            <select
              value=""
              onChange={handleTagSelect}
              className="tags-dropdown"
            >
              <option value="">{t('Select Tag')}</option>
              {tags
                .filter(tag => !selectedTags.includes(tag.id))
                .map((tag) => (
                  <option key={tag.id} value={tag.id}>
                    {tag.name}
                  </option>
                ))}
            </select>
          </div>
          {formik.touched.tags && formik.errors.tags && (
            <div className="error-message">{formik.errors.tags}</div>
          )}
        </div> */}

        <div className="button-group">
          <button type="submit" className="submit-button" disabled={isLoading}>
            {t('Register your work with this content')}
          </button>
        </div>
      </form>
    </>
  );
};

export default RegisterWorkForm;
