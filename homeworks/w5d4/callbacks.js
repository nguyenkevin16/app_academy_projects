function mySetTimeout() {
  setTimeout(function() {
    alert("HAMMERTIME");
  }, 5000);
}

function hammerTime(time) {
  setTimeout(function() {
    alert(`${time} is hammertime!`);
  }, 3000);
}
