import { createSlice } from '@reduxjs/toolkit'

export const jwtSlice = createSlice({
  name: 'jwt',
  initialState: {
    access:""
  },
  reducers: {
    clearJwt: state => {
      state.access=''
    },
    setJwt: (state, newAccess) => {
      state.access = newAccess.payload
    }
  }
})

export const { clearJwt, setJwt } = jwtSlice.actions

export default jwtSlice.reducer