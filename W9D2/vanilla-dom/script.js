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


  const sf-places = document.querySelector("#sf-places");
  const firstLi = sf-places.children[0];
  const lastPlace = document.querySelector("div > li");
  firstLi.append("input");
  ul.append("input");



  
  // adding new photos

  // Your code here
});