import { createSlice } from '@reduxjs/toolkit'

export const errorSlice = createSlice({
  name: 'error',
  initialState: {
    message:""
  },
  reducers: {
    clearErrorMsg: state => {
      state.message = "";
    },
    setErrorMsg: (state, message) => {
      state.message = message.payload;
    }
  }
})

export const { clearErrorMsg, setErrorMsg } = errorSlice.actions

export default errorSlice.reducer