window.addEventListener('load', function(){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener('keyup', function(){
    //要素の取得
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    //入力値取得
    const price = itemPrice.value;
    //表示する値の計算
    const tax = Math.round(price * 0.1);
    const benefit = Math.round(price - tax);
    //HTMLへ挿入
    addTaxPrice.innerHTML = tax;
    profit.innerHTML = benefit;
  })
})