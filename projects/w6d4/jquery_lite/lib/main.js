const DOMNodeCollection = require('./dom_node_collection.js');

window.$l = function(arg) {
  const nodeListArr = [];
  const funcQueue = [];

  if (typeof arg === 'string') {
    const nodeList = document.querySelectorAll(arg);
    nodeListArr = Array.prototype.slice.call(nodeList);
  } else if (arg instanceof HTMLElement) {
    nodeListArr.push(arg);
  } else if (typeof arg === 'function') {
    funcQueue.push(arg);
  }

  document.addEventListener("DOMContentLoaded", () => {
    funcQueue.forEach((func) => {
      func();
    });
  });

  return new DOMNodeCollection(nodeListArr);
};
