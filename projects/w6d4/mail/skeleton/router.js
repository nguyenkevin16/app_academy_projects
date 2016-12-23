function Router(node, routes) {
  this.node = node;
  this.routes = routes;
}

Router.prototype.start = function() {
  this.render();
  document.addEventListener("hashchange", this.render.bind(this));
};

Router.prototype.activeRoute = function() {
  return this.routes[window.location.hash.replace('#', '')];
};

Router.prototype.render = function() {
  const component = this.activeRoute();

  if (component) {
    this.node.innerHTML = "";
    this.node.appendChild(component.render());
  } else {
    this.node.innerHTML = "";
  }
};

module.exports = Router;
