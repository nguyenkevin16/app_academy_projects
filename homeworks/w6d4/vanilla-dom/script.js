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


  // adding new photos

  const showPhotoButton = document.querySelector('.photo-show-button');

  showPhotoButton.addEventListener("click", (e) => {
    e.preventDefault();

    const togglePhotoForm = document.querySelector('.photo-form-container');

    if (togglePhotoForm.className.includes("hidden")) {
      togglePhotoForm.className = "photo-form-container";
    } else {
      togglePhotoForm.className = "photo-form-container hidden";
    }
  });

  const dogPhotoButton = document.querySelector(".photo-url-submit");

  dogPhotoButton.addEventListener("click", (e) => {
    e.preventDefault();

    const dogPhotoInputEl = document.querySelector(".photo-url-input");
    const dogPhotoUrl = dogPhotoInputEl.value;
    dogPhotoInputEl.value = "";

    const img = document.createElement('IMG');
    img.src = dogPhotoUrl;

    const li = document.createElement('li');
    li.appendChild(img);

    const ul = document.querySelector('.dog-photos');
    ul.appendChild(li);
  });
});
