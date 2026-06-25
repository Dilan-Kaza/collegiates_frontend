import axios from "axios";
import store from '@/store'
import { clearJwt, setJwt, setLoginStatus } from "@slices";

const apiUrl = (import.meta.env.VITE_API_URL || 'http://localhost:8000') + '/collegiates_app';

const axiosApi = axios.create({
    baseURL: apiUrl,
    withCredentials: true,
    withXSRFToken: true,
    xsrfCookieName: 'csrftoken',
    xsrfHeaderName: 'X-CSRFToken',
    
});

const axiosAuth = axios.create({
    baseURL: apiUrl,
    withCredentials: true,
    withXSRFToken: true,
    xsrfCookieName: 'csrftoken',
    xsrfHeaderName: 'X-CSRFToken',
    mode: "cors",

});

axiosAuth.interceptors.request.use(
  (config) => {

    const access = store.getState()?.jwt?.access;

    // If the token exists, inject it into the Authorization header
    if (access) {
      config.headers.Authorization = `Bearer ${access}`;
    }

    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);


let isRefreshing = false;

axiosAuth.interceptors.response.use(
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
        axiosApi.post('/auth/jwt/refresh/')
        .then(({ data }) => {
          // Store the new tokens
          if (data.access) {
            store.dispatch(setJwt(data.access));
          }
        })
        .catch((err) => {
          reject(err);
          store.dispatch(setLoginStatus(false));
        })
        .finally(() => {
          isRefreshing = false;
        });
      });
    }

    return Promise.reject(error);
  }
);

export { axiosApi, axiosAuth };