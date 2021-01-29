const BASE_URL = 'http://127.0.0.1:3000/';

$('.decrease-qty-btn').click(function() {
  const btn = $(this);
  const url = `${BASE_URL}api/v1/cart/decrease-qty/`;

  $.post(url,
    {
      cart_item_id: btn.parent().next().text(),
    },
    function(){
      btn.next().text(parseInt(btn.next().text()) - 1);
    }
  ).fail(function(){
      if (confirm('Remove this item form cart?')) {
        removeItemFromCart(btn.parent().next().next().text());
        btn.parents('tr').remove();
      }
    });
});

$('.increase-qty-btn').click(function() {
  const btn = $(this);
  const url = `${BASE_URL}api/v1/cart/increase-qty/`;
  $.post(url,
    {
      cart_item_id: btn.parent().next().text(),
    },
    function(){
      btn.prev().text(parseInt(btn.prev().text()) + 1);
    }
  ).fail(function(){
      alert("Not enough stock");
    });
});

//TODO: Repeating, Could be moved to single file
function removeItemFromCart(itemID){
  const url = `${BASE_URL}api/v1/cart/remove-item/`
  $.post(url, { item_id: itemID, });
}

$('#checkout-btn').click(function() {
  const url = `${BASE_URL}api/v1/checkout/`;
  $.post(url,{}, function(){
    window.location.replace(`${BASE_URL}checkout/`);
  });
});
