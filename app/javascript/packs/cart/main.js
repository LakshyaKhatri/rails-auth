const BASE_URL = 'http://127.0.0.1:3000/';

$('.decrease-qty-btn').click(function() {
  const btn = $(this);
  const cartItemID = btn.parent().next().text();
  const url = `${BASE_URL}api/v1/cart/cart_items/${cartItemID}`;

  $.ajax({
    url: url,
    type: 'PATCH',
    data: {
      qty: -1
    },
    success: function(data){
      btn.next().text(data.qty);
    },
    error: function(){
      if (confirm('Remove this item form cart?')) {
        removeItemFromCart(cartItemID);
        btn.parents('tr').remove();
      }
    },
  });
});

$('.increase-qty-btn').click(function() {
  const btn = $(this);
  const cartItemID = btn.parent().next().text();
  const url = `${BASE_URL}api/v1/cart/cart_items/${cartItemID}`;
  $.ajax({
    url: url,
    type: 'PATCH',
    data: {
      qty: +1
    },
    success: function(data){
      btn.prev().text(data.qty);
    },
    error: function(){
      alert("Not enough stock");
    }
  });
});

//TODO: Repeating, Could be moved to single file
function removeItemFromCart(cartItemID){
  const url = `${BASE_URL}api/v1/cart/cart_items/${cartItemID}`
  $.ajax({
    url: url,
    type: 'DELETE',
  });
}

$('#checkout-btn').click(function() {
  const url = `${BASE_URL}api/v1/order/`;
  $.post(url,{}, function(data){
    window.location.href = `${BASE_URL}order/${data.id}`;
  }).fail(function(){
    window.location.href = `${BASE_URL}order/${data.id}`;
  });
});
