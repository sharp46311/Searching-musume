import { toast } from 'react-toastify';
import { fetchData } from './fetchHelpers';
import { BASE_URL } from '../constants';

const WORK_URL = `${BASE_URL}`;

export const getContestsApi = async ({ page = 1, search = '', filter = '' }) => {
  try {
    const response = await fetchData({
      apiUrl: `${WORK_URL}/contests?page=${page}&search=${search}&status=${filter}`,
      method: 'GET'
    });
    return response;
  } catch (error) {
    toast.error(error.message, { className: 'toast-error', autoClose: 3000 });
    throw new Error(error.message);
  }
};

export const getContestDetailApi = async (contestId) => {
  try {
    const response = await fetchData({
      apiUrl: `${WORK_URL}/contests/${contestId}`,
      method: 'GET'
    });
    return response;
  } catch (error) {
    toast.error(error.message, { className: 'toast-error', autoClose: 3000 });
    throw new Error(error.message);
  }
};

export const getMyContestsApi = async ({ page = 1, search = '', filter = '' }) => {
  try {
    const response = await fetchData({
      apiUrl: `${WORK_URL}/contests/my-contests?page=${page}&search=${search}&status=${filter}`,
      method: 'GET'
    });
    return response;
  } catch (error) {
    toast.error(error.message, { className: 'toast-error', autoClose: 3000 });
    throw new Error(error.message);
  }
};

export const submitContestWorkApi = async (body) => {
  try {
    const response = await fetchData({
      apiUrl: `${WORK_URL}/contests/submit-work/`,
      method: 'POST',
      body
    });
    toast.success(response?.message || 'Contest work submitted successfully', { className: 'toast-success', autoClose: 3000 });
    return response;
  } catch (error) {
    toast.error(error.message, { className: 'toast-error', autoClose: 3000 });
    throw new Error(error.message);
  }
};

export const getArtistClassesApi = async ({ page = 1, search = '', is_free = undefined, class_type = '' }) => {
  try {
    const response = await fetchData({
      apiUrl: `${BASE_URL}/artist-classes?page=${page}&search=${search}&is_free=${is_free}&class_type=${class_type}`,
      method: 'GET'
    });
    return response;
  } catch (error) {
    // toast.error(error.message, { className: 'toast-error', autoClose: 3000 });
    throw new Error(error.message);
  }
};

export const getMyArtistClassesApi = async ({ page = 1, search = '', is_free = undefined, class_type = '' }) => {
  try {
    const response = await fetchData({
      apiUrl: `${BASE_URL}/artist-classes/my-classes?page=${page}&search=${search}&is_free=${is_free}&class_type=${class_type}`,
      method: 'GET'
    });
    return response;
  } catch (error) {
    // toast.error(error.message, { className: 'toast-error', autoClose: 3000 });
    throw new Error(error.message);
  }
};


export const getArtistClassDetailApi = async (id) => {
  try {
    const response = await fetchData({
      apiUrl: `${BASE_URL}/artist-classes/${id}`,
      method: 'GET'
    });
    return response;
  } catch (error) {
    toast.error(error.message, { className: 'toast-error', autoClose: 3000 });
    throw new Error(error.message);
  }
};

export const artistClassSignUpApi = async (body) => {
  try {
    const response = await fetchData({
      apiUrl: `${BASE_URL}/artist-classes/signup/`,
      method: 'POST',
      body
    });
    toast.success(response?.message || 'Artist class signup successful', { className: 'toast-success', autoClose: 3000 });
    return response;
  } catch (error) {
    toast.error(error.message, { className: 'toast-error', autoClose: 3000 });
    throw new Error(error.message);
  }
};

export const getArtistClassVideoUrlApi = async (classId) => {
  try {
    const response = await fetchData({
      apiUrl: `${BASE_URL}/artist-classes/${classId}/video-url/`,
      method: 'POST'
    });
    toast.success(response?.message || 'Artist class video URL sent to your email', { className: 'toast-success', autoClose: 3000 });
    return response;
  } catch (error) {
    toast.error(error.message, { className: 'toast-error', autoClose: 3000 });
    throw new Error(error.message);
  }
};

export const confirmPaymentApi = async (paymentIntent) => {
  try {
    const response = await fetchData({
      apiUrl: `${BASE_URL}/artist-classes/confirm-payment/`,
      method: 'POST',
      body: { payment_intent: paymentIntent }
    });
    console.log("responsee of confirm payment", response);
    toast.success(response?.message || 'Payment confirmed successfully', { className: 'toast-success', autoClose: 3000 });
    return response;
  } catch (error) {
    toast.error(error.message, { className: 'toast-error', autoClose: 3000 });
    throw new Error(error.message);
  }
};
