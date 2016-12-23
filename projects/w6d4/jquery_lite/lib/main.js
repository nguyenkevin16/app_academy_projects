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

window.$l.extend = function(...objs) {
  return Object.assign(...objs);
};

window.$l.ajax = function(options) {
  const params = window.$l.extend(ajaxDefaults, options);

  const xhr = new XMLHttpRequest();
  xhr.open(params.method, params.url);

  xhr.onload = function () {
    if (xhr.status === 200) {
      params.success(JSON.parse(xhr.response));
    } else {
      params.error(JSON.parse(xhr.response));
    }
  };

  xhr.send(params);
};

const ajaxDefaults = {
  method: "GET",
  url: "",
  dataType: "json",
  data: {},
  success: function() { alert("success"); },
  error: function() { alert("fail"); }
};


//  AJAX IMPLEMENTATION TESTING


// window.$l.ajax({
//   type: 'GET',
//   url: "http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=bcb83c4b54aee8418983c2aff3073b3b",
//   success(data) {
//     console.log("We have your weather!");
//     console.log(data);
//   },
//   error() {
//     console.error("An error occurred.");
//   },
// });
//
// $.ajax({
//   type: 'GET',
//   url: "http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=bcb83c4b54aee8418983c2aff3073b3b",
//   success(data) {
//     console.log("We have your weather!");
//     console.log(data);
//   },
//   error() {
//     console.error("An error occurred.");
//   },
// });
