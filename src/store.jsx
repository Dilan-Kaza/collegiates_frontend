import { configureStore } from '@reduxjs/toolkit'
import jwtReducer from '@slices/jwt'
import successReducer from '@slices/success'
import errorReducer from '@slices/error'
import loginStatusReducer from '@slices/loginStatus'
import cacheReducer from '@slices/cache'
import sessionCacheReducer from '@slices/sessionCache'


const store = configureStore({
    reducer: {
      jwt: jwtReducer,
      success: successReducer,
      error: errorReducer,
      loginStatus: loginStatusReducer,
      cache: cacheReducer,
      sessionCache: sessionCacheReducer,
    }
})

export default store;