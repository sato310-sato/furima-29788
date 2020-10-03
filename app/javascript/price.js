function price (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", (e) => {
    const tax = itemPrice.value * 0.1 ;
    const salesProfit = itemPrice.value * 0.9 ;
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");

    addTaxPrice.innerHTML = `${tax}`;
    profit.innerHTML = `${salesProfit}`;
    
    e.preventDefault();
  });
}
// setInterval(price, 1000);
window.addEventListener('load', price);
