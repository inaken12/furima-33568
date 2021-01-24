function itemPrice () {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = String(Math.floor(inputValue * 0.1)).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = String(inputValue - Math.floor(inputValue * 0.1)).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
  });
}

window.addEventListener ('load', itemPrice);