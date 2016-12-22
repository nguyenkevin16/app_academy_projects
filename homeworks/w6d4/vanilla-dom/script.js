document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  const sfPlacesForm = document.getElementById("favorite-places");

  sfPlacesForm.addEventListener("submit", (e) => {
    e.preventDefault();

    const sfPlacesInputEl = document.querySelector(".favorite-input");
    const sfPlaceToAdd = sfPlacesInputEl.value;
    sfPlacesInputEl.value = "";

    const sfPlacesUl = document.getElementById("sf-places");
    const li = document.createElement("li");
    li.textContent = sfPlaceToAdd;

    sfPlacesUl.appendChild(li);
  });


  // --- your code here!



  // adding new photos

  // --- your code here!



});
