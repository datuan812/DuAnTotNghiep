$('.product-price-custom-vnd').each(function(index, item) {
    let res = $(item).html().slice(0, -2);
    res = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(res);
    $(item).html(res);
});

$('.product-price-custom-percent').each(function(index, item) {
    let res = $(item).html().slice(0, -2);
    $(item).html(res);
});