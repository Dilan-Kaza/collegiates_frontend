import axios from "axios";
import store from '../store'
import { setJwt } from "../slices/jwt";

const apiUrl = (import.meta.env.VITE_API_URL || 'http://localhost:8000') + '/collegiates_app';

const axiosApi = axios.create({
    baseURL: apiUrl,
    withCredentials: true,
    xsrfCookieName: 'csrftoken',
    xsrfHeaderName: 'X-CSRFToken'
});

axiosApi.defaults.xsrfCookieName = 'csrftoken';
axiosApi.defaults.xsrfHeaderName = 'X-CSRFToken';
axiosApi.defaults.withXSRFToken = true;
axiosApi.defaults.headers.common['Accept'] = '*/*';

let isRefreshing = false;

// Helper to process the queued requests after a successful token refresh

function getCookie(name) {
  const value = `; ${document.cookie}`;
  const parts = value.split(`; ${name}=`);
  if (parts.length === 2) return parts.pop().split(';').shift();
}

axiosApi.interceptors.response.use(
  (response) => response, // Pass successful responses straight through
  async (error) => {
    const originalRequest = error.config;

    // Check if error is 401 and the request hasn't been retried yet
    if ((error.response?.status === 401 || error.response?.status === 403) && !originalRequest._retry) {
      
      // If a refresh is already in progress, queue this request
      if (isRefreshing) {
        return new Promise((resolve, reject) => {
          failedQueue.push({ resolve, reject });
        })
          .then((token) => {
            originalRequest.headers['Authorization'] = `Bearer ${token}`;
            return axiosApi(originalRequest); // Retry original request
          })
          .catch((err) => Promise.reject(err));
      }

      // Mark this request as a retry to prevent infinite loops if the refresh fails
      originalRequest._retry = true;
      isRefreshing = true;

      return new Promise((resolve, reject) => {
        // Use standard axios or a clean instance to avoid using the interceptor on the refresh call
        axiosApi.post('/auth/jwt/refresh/', {
          refresh: getCookie('refresh'),
        })
        .then(({ data }) => {
          // Store the new tokens
          if (data.access) {
            store.dispatch(setJwt(data.access));
          }
        })
        .catch((err) => {
          reject(err);
        })
        .finally(() => {
          isRefreshing = false;
        });
      });
    }

    return Promise.reject(error);
  }
);

export default axiosApi;