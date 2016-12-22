class DOMNodeCollection {
  constructor(HTMLElements) {
    this.elements = HTMLElements;
  }

  html(string = null) {
    if (string !== null) {
      this.elements.forEach((el) => { el.innerHTML = string; });
    } else {
      return this.elements[0].innerHTML;
    }
  }

  empty() {
    this.elements.forEach((el) => { el.innerHTML = ""; });
  }

  append(args) {
    if (typeof args === 'string' || args instanceof HTMLElement) {
      this.elements.forEach((el) => {
        el.innerHTML += args;
      });
    } else {
      args.elements.forEach((outer) => {
        this.elements.forEach((inner) => {
          inner.innerHTML += outer.outerHTML;
        });
      });
    }
  }

  attr(attribute, value = "") {
    if (value === "") {
      return this.elements[0].getAttribute(attribute);
    } else if (value === null) {
      this.elements.forEach(el => {
        el.removeAttribute(attribute);
      });
    } else {
      this.elements.forEach((el) => {
        el.setAttribute(attribute, value);
      });
    }
  }

  addClass(className) {
    this.elements.forEach((el) => { el.className = className; });
  }

  removeClass() {
    this.attr('class', null);
  }

  children() {
    let allChildren = [];

    this.elements.forEach((el) => {
      Array.from(el.children).forEach((child) => allChildren.push(child));
    });

    return new DOMNodeCollection(allChildren);
  }

  parent() {
    return new DOMNodeCollection(this.elements[0].parentNode);
  }

  find(selector) {
    const els = Array.from(document.querySelectorAll(selector));
    return new DOMNodeCollection(els);
  }

  remove(selector) {
    this.elements.forEach((el) => {
      el.innerHTML = "";
      el.outerHTML = "";
    });

    this.elements = [];
  }

  on(type, callback) {
    this.elements.forEach((el) => {
      el.addEventListener(type, callback);
      el.callback = callback;
    });
  }

  off(type) {
    this.elements.forEach((el) => {
      el.removeEventListener(type, el.callback);
    });
  }
}

module.exports = DOMNodeCollection;
