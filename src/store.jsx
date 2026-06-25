import { configureStore } from '@reduxjs/toolkit'
import jwtReducer from '@slices/jwt'
import successReducer from '@slices/success'
import errorReducer from '@slices/error'
import loginStatusReducer from '@slices/loginStatus'


const store = configureStore({
    reducer: {
      jwt: jwtReducer,
      success: successReducer,
      error: errorReducer,
      loginStatus: loginStatusReducer
    }
})

export default store;