import { createSlice } from '@reduxjs/toolkit'

export const loginStatusSlice = createSlice({
  name: 'loginStatus',
  initialState: {
    loading: true,
    loggedIn: false,
  },
  reducers: {
    clearLoginStaus: state => {
      state.loading = true;
      state.loggedIn = false;
    },
    setLoginStatus: (state, status) => {
      state.loading = false;
      state.loggedIn = status.payload;
    }
  }
})

export const { clearLoginStaus, setLoginStatus } = loginStatusSlice.actions

export default loginStatusSlice.reducer