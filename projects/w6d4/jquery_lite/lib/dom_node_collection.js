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
}

module.exports = DOMNodeCollection;
