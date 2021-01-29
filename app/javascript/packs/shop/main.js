const BASE_URL = 'http://127.0.0.1:3000/';

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
    const addRemove = (item.in_cart ? 'Remove' : 'Add');
    currentRow.insertCell(-1).innerHTML = `<button type="button" class="add-to-cart-btn">${addRemove}</button>`;

    const hiddenCell = currentRow.insertCell(-1);
    hiddenCell.innerHTML = item.id;
    hiddenCell.style.display = 'none';
  });

  configAddToCartBtns();
}

function configAddToCartBtns(){
  $('.add-to-cart-btn').click(function() {
    const button = $(this);
    const itemID = button.parent().next().text();

    if (button.text() === 'Add') {
      addItemToCart(itemID, button);
    }
    else {
      removeItemFromCart(itemID, button);
    }
  });
}

//TODO: Merge these two in one
function addItemToCart(itemID, elem){
  const url = `${BASE_URL}api/v1/cart/add-item/`
  $.post(url,
    {
      item_id: itemID,
    },
    function(data){
      elem.html('Remove');
  });
}

function removeItemFromCart(itemID, elem){
  const url = `${BASE_URL}api/v1/cart/remove-item/`
  $.post(url,
    {
      item_id: itemID,
    },
    function(data){
      elem.html('Add');
  });
}

function checkout(){
  const url = `${BASE_URL}api/v1/checkout/`
  $.post(url,{}, function(){
    window.location.replace(`${BASE_URL}checkout/`);
  });
}
