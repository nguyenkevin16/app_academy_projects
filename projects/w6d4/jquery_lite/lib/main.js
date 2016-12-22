window.$l = function(selector) {
  let nodeListArr = null;

  if (typeof selector === 'string') {
    const nodeList = document.querySelectorAll(selector);
    nodeListArr = Array.prototype.slice.call(nodeList);
  }

  return nodeListArr;
};
