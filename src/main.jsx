
import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { BrowserRouter, Routes, Route } from "react-router";
import { Provider } from 'react-redux'
import './index.css'
import store from './store.jsx';
import App from './App.jsx';

const root = createRoot(document.getElementById('root'));

root.render(
  
  <StrictMode>
    <Provider store={store}>
      <App/>
    </Provider>
  </StrictMode>
)
