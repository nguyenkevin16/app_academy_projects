const Router = require('./router.js');
const Inbox = require('./inbox.js');
const Sent = require('./sent.js');
const Compose = require('./compose.js');

document.addEventListener("DOMContentLoaded", (e) => {
  const sidebarLi = Array.from(document.querySelectorAll('.sidebar-nav li'));

  sidebarLi.forEach((li) => {
    li.addEventListener("click", (e2) => {
      window.location.hash = li.innerText.toLowerCase();
    });
  });

  const content = document.querySelector('.content');
  const router = new Router(content, routes);
  router.start();
  location.hash = "inbox";
});

const routes = {
  inbox: Inbox,
  sent: Sent,
  compose: Compose
};
