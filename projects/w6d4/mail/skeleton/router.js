function Router(node) {
  this.node = node;
}

Router.prototype.start = function() {
  this.render();
  document.addEventListener("hashchange", this.render.bind(this));
};

Router.prototype.activeRoute = function() {
  return (window.location.hash.replace('#', ''));
};

Router.prototype.render = function() {
  this.node.innerHTML = "";
  let newEl = document.createElement('p');
  newEl.innerHTML = this.activeRoute();
  this.node.appendChild(newEl);
};

module.exports = Router;
