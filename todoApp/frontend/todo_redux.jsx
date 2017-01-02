import React from 'react';
import ReactDOM from 'react-dom';

import configureStore from './store/store';

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  const root = document.getElementById("content");
  ReactDOM.render(<h1>Todos App</h1>, root);

  // TODO: REMOVE LATER
  window.store = store;
});
