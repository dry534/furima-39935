const pay = () => {
  const payjp = Payjp('pk_test_***********************')// PAY.JPテスト公開鍵
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');
  const form = document.getElementById('charge-form')
  form.addEventListener("submit", (e) => {
    console.log("フォーム送信時にイベント発火")
    e.preventDefault();
  });
};

window.addEventListener("load", pay);