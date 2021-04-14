const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);

  const form = document.getElementById("card-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("card-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order[number]"),
      cvc: formData.get("order[cvc]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year: `20${formData.get("order[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("card-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      } else {
        alert(`カード登録に失敗しました。もう一度入力してください。`)
      }

      document.getElementById("order_number").removeAttribute("name");
      document.getElementById("order_cvc").removeAttribute("name");
      document.getElementById("order_exp_month").removeAttribute("name");
      document.getElementById("order_exp_year").removeAttribute("name");

      document.getElementById("card-form").submit();
    });
  });
};

window.addEventListener("load", pay);