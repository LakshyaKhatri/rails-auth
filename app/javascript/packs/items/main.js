const BASE_URL = 'http://127.0.0.1:3000/';

// Fetches items for given category and loads them using populate_table
function loadItems(category){
  $.get(BASE_URL + 'api/v1/items?category=' + category, function(data){
    populateTable(data);
  });
}

// takes the input items data and creates table rows for them
function populateTable(items){
  const importTag = '<p class="import-tag">Imported</p>';
  const addBtn = '<button type="button" class="add-to-cart-btn">Add</button>';

  const itemsTableBody = document.getElementsByClassName('items-table')[0].children[1];
  itemsTableBody.innerHTML = ''

  items.forEach((item, index) => {
    const currentRow = itemsTableBody.insertRow(-1);

    currentRow.insertCell(-1).innerHTML = item.name;
    currentRow.insertCell(-1).innerHTML = item.taxed_price;
    currentRow.insertCell(-1).innerHTML = item.is_imported ? importTag : '';
    currentRow.insertCell(-1).innerHTML = addBtn;
  });
}

// Loads items for the very first time
loadItems(1);
$('#item-category-select').change(function() {
  loadItems(this.value);
});
