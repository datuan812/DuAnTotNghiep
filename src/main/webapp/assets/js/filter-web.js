actionPriceFilter();
const q = $('#input-search-product').val();
$("#filter").on("change", "input[type='checkbox']", function(){
    const priceFilter = $('#price-filter').val();
    const brandFilter = $('#brand-filter').val();
    filterAndPageable(1, 9, q, priceFilter, brandFilter);
});

$("#brands").on("click", "button", function(e){
    e.preventDefault();
    const brandFilter = $(this).val();
    $('#brand-filter').val(brandFilter);
    const priceFilter = $('#price-filter').val();
    filterAndPageable(1, 9, q, priceFilter, brandFilter);
});

$("#gia").on("click", "button", function(e){
    e.preventDefault();
    const priceFilter = $(this).val();
    $('#price-filter').val(priceFilter);
    const brandFilter = $('#brand-filter').val();
    filterAndPageable(1, 9, q, priceFilter, brandFilter);
});

function filterAndPageable(page, limit, q, priceFilter, brandFilter){
    $('.value-server').html('');
    let filters = getCheckedWhenFilter();
    if(priceFilter !== 'not-filter'){
        let inputEle = `<input type="hidden" value="${priceFilter}" name="gia"/>`;
        $('.value-server').append(inputEle);
    }
    if(brandFilter !== 'not-filter'){
        let inputEle = `<input type="hidden" value="${brandFilter}" name="thuong-hieu"/>`;
        $('.value-server').append(inputEle);
    }

    Object.keys(filters).map(function(key) {
        let name = key;
        let value = filters[key].join(",");
        let inputEle = `<input type="hidden" value="${value}" name="${name}"/>`;
        $('.value-server').append(inputEle);
    })
    if(q !== null && q !== '' && q !== undefined){
        $('#search-product').val(q);
    }
    $('#page-product').val(page);
    $('#limit-product').val(limit);
    $('#form-submit-product').submit();
}

function getCheckedWhenFilter(){
    let checkboxChecked = $('#filter input[type="checkbox"]:checked');
    let filters = {};
    checkboxChecked.each(function () {
        var name = $(this).attr('name');
        var value = $(this).val();

        if (!(name in filters)) {
            filters[name] = [];
        }
        filters[name].push(value);
    });
    return filters;
}

function actionPriceFilter(){
    const priceFilter = $('#price-filter').val();
    const brandFilter = $('#brand-filter').val();
    if(priceFilter !== 'not-filter'){
        let prices = $('#gia button');
        prices.each(function () {
            var value = $(this).val();
            if(value === priceFilter){
                $(this).addClass('btn-secondary');
                return false;
            }
        });
    }

    if(brandFilter !== 'not-filter'){
        let brands = $('#brands button');
        brands.each(function () {
            var value = $(this).val();
            if(value === brandFilter){
                $(this).addClass('btn-secondary');
                return false;
            }
        });
    }
}