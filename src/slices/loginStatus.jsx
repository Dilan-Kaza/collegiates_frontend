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
      state.loggedIn = action.payload;
      if (!action.payload) {
        state.isOrganizer = false;
      }
    },
    setLoadingDone: state => {
      state.loading = false;
    },
    setOrganizerStatus: (state, action) => {
      state.isOrganizer = action.payload;
    }
  }
})

export const { clearLoginStaus, setLoginStatus, setLoadingDone, setOrganizerStatus } = loginStatusSlice.actions

export const applyLoginStatus = (value) => (dispatch) => {
  dispatch(setLoginStatus(value));
  setTimeout(() => dispatch(setLoadingDone()), 500);
  
};

export default loginStatusSlice.reducer
