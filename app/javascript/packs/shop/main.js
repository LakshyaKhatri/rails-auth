const BASE_URL = 'http://127.0.0.1:3000/';

createCart();

// Loads items for the very first time
loadItems($('#item-category-select').val());

// set respective listeners' callbacks
$('#item-category-select').change(function() {
  loadItems(this.value);
});

// Fetches items for given category and loads them using populate_table
function loadItems(category){
  const url = `${BASE_URL}api/v1/items?category=${category}`;
  $.get(url, function(data){
    populateTable(data);
  });
}

// takes the input items data and creates table rows for them
function populateTable(items){
  const importTag = '<p class="import-tag">Imported</p>';

  const itemsTableBody = document.getElementsByClassName('items-table')[0].children[1];
  itemsTableBody.innerHTML = '';

  items.forEach((item, index) => {
    const currentRow = itemsTableBody.insertRow(-1);

    currentRow.insertCell(-1).innerHTML = item.name;
    currentRow.insertCell(-1).innerHTML = item.taxed_price;
    currentRow.insertCell(-1).innerHTML = item.is_imported ? importTag : '';
    const addRemove = (item.cart_item_id ? 'Remove' : 'Add');
    currentRow.insertCell(-1).innerHTML = `<button type="button" class="add-to-cart-btn">${addRemove}</button>`;

    const itemID = currentRow.insertCell(-1);
    itemID.innerHTML = item.id;
    itemID.style.display = 'none';

    const cartItemID = currentRow.insertCell(-1);
    cartItemID.innerHTML = item.cart_item_id;
    cartItemID.style.display = 'none';
  });

  configAddToCartBtns();
}

function configAddToCartBtns(){
  $('.add-to-cart-btn').click(function() {
    const button = $(this);
    const itemID = button.parent().next().text();
    const cartItemID = button.parent().next().next().text();

    if (button.text() === 'Add') {
      addItemToCart(itemID, button);
    }
    else {
      removeItemFromCart(cartItemID, button);
    }
  });
}

//TODO: Merge these two in one
function addItemToCart(itemID, elem){
  const url = `${BASE_URL}api/v1/cart/cart_items/`
  $.post(url,
    {
      item_id: itemID,
    },
    function(data){
      elem.html('Remove');
      elem.parent().next().next().text(data.id);
  });
}

function removeItemFromCart(cartItemID, elem){
  const url = `${BASE_URL}api/v1/cart/cart_items/${cartItemID}`
  $.ajax({
    url: url,
    type: 'DELETE',
    success: function(data){
      elem.html('Add');
    }
  });
}

function createCart(){
  const url = `${BASE_URL}api/v1/cart/`
  $.post(url, {});
}
