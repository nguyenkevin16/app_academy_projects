const DOMNodeCollection = require('./dom_node_collection.js');

window.$l = function(selector) {
  let nodeListArr = [];

  if (typeof selector === 'string') {
    const nodeList = document.querySelectorAll(selector);
    nodeListArr = Array.prototype.slice.call(nodeList);
  } else if (selector instanceof HTMLElement) {
    nodeListArr.push(selector);
  }

  return new DOMNodeCollection(nodeListArr);
};
