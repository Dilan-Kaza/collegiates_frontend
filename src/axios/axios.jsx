import axios from "axios";
import store from '@/store'
import { clearJwt, setJwt, applyLoginStatus } from "@slices";

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
let lastRefreshTime = 0;

axiosAuth.interceptors.response.use(
  (response) => response, // Pass successful responses straight through
  async (error) => {
    const originalRequest = error.config;

    if ((error.response?.status === 401 || error.response?.status === 403) && !originalRequest._retry) {

      const now = Date.now();
      if (isRefreshing || now - lastRefreshTime < 1000) {
        return;
      }

      isRefreshing = true;
      lastRefreshTime = now;

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
          store.dispatch(applyLoginStatus(false));
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

const axiosSheets = axios.create({
    baseURL: `https://sheets.googleapis.com/v4/spreadsheets`,
});

axiosSheets.interceptors.request.use((config) => {
    config.params = { ...config.params, key: import.meta.env.VITE_GOOGLE_API_KEY };
    return config;
});

export { axiosApi, axiosAuth, axiosSheets };