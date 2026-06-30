import { createSlice } from '@reduxjs/toolkit'

export const loginStatusSlice = createSlice({
  name: 'loginStatus',
  initialState: {
    loading: true,
    loggedIn: false,
    isOrganizer: false,
  },
  reducers: {
    clearLoginStaus: state => {
      state.loading = true;
      state.loggedIn = false;
      state.isOrganizer = false;
    },
    setLoginStatus: (state, action) => {
      state.loading = false;
      state.loggedIn = action.payload;
      if (!action.payload) state.isOrganizer = false;
    },
    setOrganizerStatus: (state, action) => {
      state.isOrganizer = action.payload;
    }
  }
})

export const { clearLoginStaus, setLoginStatus, setOrganizerStatus } = loginStatusSlice.actions

export default loginStatusSlice.reducer