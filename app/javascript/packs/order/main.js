const BASE_URL = 'http://127.0.0.1:3000/';
const ORDER_ID = $("#place-order-btn").next().text();

$("#place-order-btn").click(function(){
  const url = `${BASE_URL}/api/v1/orders/${ORDER_ID}/place`;
  btn = $(this);
  $.post(url, function(){
    btn.parent.html("<p>Order Placed.<p>")
  });
});
