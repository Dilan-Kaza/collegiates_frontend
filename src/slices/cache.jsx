import { createSlice } from '@reduxjs/toolkit'

export const cacheSlice = createSlice({
  name: 'cache',
  initialState: {},
  reducers: {
    setCache: (state, action) => {
      const { key, data } = action.payload;
      state[key] = data;
    },
    clearCache: (state, action) => {
      delete state[action.payload];
    },
    clearAllCache: () => ({}),
  },
})

export const { setCache, clearCache, clearAllCache } = cacheSlice.actions

export default cacheSlice.reducer
