const Router = require('./router.js');

document.addEventListener("DOMContentLoaded", (e) => {
  const sidebarLi = Array.from(document.querySelectorAll('.sidebar-nav li'));

  sidebarLi.forEach((li) => {
    li.addEventListener("click", (e2) => {
      window.location.hash = li.innerText.toLowerCase();

      const content = document.querySelector('.content');
      const router = new Router(content);
      router.start();
    });
  });
});
