import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

// TODO: testing; remove later
import { login,
         logout,
         signup } from './actions/session_actions';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  const store = configureStore();
  ReactDOM.render(<Root store={ store }/>, root);

  // TODO: testing; remove later
  window.store = store;
  window.login = login;
  window.logout = logout;
  window.signup = signup;
});
