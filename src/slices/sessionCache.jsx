import { createSlice } from '@reduxjs/toolkit'

export const sessionCacheSlice = createSlice({
  name: 'sessionCache',
  initialState: {},
  reducers: {
    setSessionCache: (state, action) => {
      const { key, data } = action.payload;
      state[key] = data;
    },
    clearSessionCache: (state, action) => {
      delete state[action.payload];
    },
    clearAllSessionCache: () => ({}),
  },
})

export const { setSessionCache, clearSessionCache, clearAllSessionCache } = sessionCacheSlice.actions

export default sessionCacheSlice.reducer
