window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;

const addTaxDom = document.getElementById("profit");
    addTaxDom.innerHTML =  Math.floor(inputValue * 0.9)
const addTaxDoma = document.getElementById("add-tax-price");
    addTaxDoma.innerHTML =  Math.floor(inputValue * 0.1)
})
})