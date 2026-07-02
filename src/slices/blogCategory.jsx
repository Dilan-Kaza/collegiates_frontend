import { createSlice } from '@reduxjs/toolkit'

export const blogCategorySlice = createSlice({
  name: 'blogCategory',
  initialState: {
    category: null,
  },
  reducers: {
    setBlogCategory: (state, action) => {
      state.category = action.payload;
    },
    clearBlogCategory: state => {
      state.category = null;
    },
  }
})

export const { setBlogCategory, clearBlogCategory } = blogCategorySlice.actions

export default blogCategorySlice.reducer
