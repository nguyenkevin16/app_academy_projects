import React from 'react';
import ReactDOM from 'react-dom';

import configureStore from './store/store';
import { login, logout, signup } from './utils/session_api_util';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  const store = configureStore();
  ReactDOM.render(<h1>hello react</h1>, root);

  // TODO: testing
  window.store = store;
  window.login = login;
  window.logout = logout;
  window.signup = signup;
});
