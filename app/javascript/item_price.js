window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price")
  const addTaxDom = document.getElementById("add-tax-price")
  const profitNum = document.getElementById("profit")

  addTaxDom.innerHTML = 0
  profit.innerHTML = 0

  priceInput.addEventListener("input", () => {
    let inputValue = priceInput.value;
    if (inputValue >= 10){
      tax = Math.floor(inputValue * 0.1)
      addTaxDom.innerHTML = tax.toLocaleString();
      profit = Math.floor(inputValue - inputValue * 0.1)
      profitNum.innerHTML = profit.toLocaleString();
    }else{
      addTaxDom.innerHTML = 0
      profit.innerHTML = 0
    }
  })
  
});