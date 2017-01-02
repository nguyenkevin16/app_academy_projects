import React from 'react';
import ReactDOM from 'react-dom';

import configureStore from './store/store';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  const root = document.getElementById("content");
  ReactDOM.render(<Root store={store}/>, root);

  // TODO: REMOVE LATER
  window.store = store;
});

// TODO: FOR TESTING
// const newTodos = [
//   {
//     id: 1,
//     title: "don't wash car",
//     body: "not with soap",
//     done: false
//   },
//   {
//     id: 2,
//     title: "don't wash dog",
//     body: "not with shampoo",
//     done: true
//   },
// ];
