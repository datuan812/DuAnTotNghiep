const lenOfAttribute = parseInt($('#len-attribute').val());
let variantId = null;

$("#product").on("change", "input[type='radio']", function () {
    const lenChecked = $('#product input[type="radio"]:checked').length;
    if (lenChecked === lenOfAttribute) {
        let attributeId = [];
        $('#product input[type="radio"]:checked').each(function () {
            attributeId.push(parseInt($(this).val()));
        })
        $.ajax({
            url: "/api/bien-the",
            method: "POST",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: JSON.stringify(attributeId),
            success: (response) => {
                console.log(response)
                variantId = response.id;
                $('.product-origin').text(response.gia);
                $('.product-buy').text(response.giaBan)
                if (response.hinhAnh !== null) {
                    $('.product-image-primary').attr('src', '/repository/' + response.hinhAnh);
                }
                if (response.soLuong !== null) {
                    $('.product-quantity').text(response.soLuong + " sản phẩm có sẵn")
                }

                $('.product-price-custom-vnd').each(function (index, item) {
                    let res = $(item).html();
                    if (res.indexOf("đ") === -1) {
                        let numericValue = parseInt(res.replace(/[^\d]/g, ''));
                        let formattedValue = new Intl.NumberFormat('vi-VN', {
                            style: 'currency',
                            currency: 'VND'
                        }).format(numericValue);
                        $(item).html(formattedValue);
                    }
                });

            },
            error: (error) => {
                console.log(error);
            }
        });
    }
});

$("#buy-product-now").on('click', function () {
    actionWhenClick($(this));
});

$('#add-cart').on('click', function () {
   actionWhenClick($(this));
});

function createCart(successCallback, errorCallback) {
    let data = {};
    data['maKhachHang'] = customerCodeWhenLogin;
    $.ajax({
        url: "/api/gio-hang",
        method: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: JSON.stringify(data),
        success: (response) => {
            successCallback(response);
        },
        error: (error) => {
            errorCallback(error);
        }
    })
}

function addProduct(data, successCallback, errorCallback) {
    $.ajax({
        url: "/api/gio-hang-chi-tiet",
        method: "POST",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(data),
        success: (response) => {
            successCallback();
        },
        error: (error) => {
            errorCallback(error);
        }
    })
}

function actionWhenClick(buttonClick){
    if (customerCodeWhenLogin === "null") {
        window.location.href = '/login?is_not_login';
    }
    else if (variantId === null) {
        showError("Vui lòng chọn sản phẩm")
    } else {
        createCart(
            function (response) {
                let data = {};
                data['idGioHang'] = response;
                data['idBienThe'] = variantId;
                data['soLuong'] = parseInt($('#quantity').val());
                data['idSanPham'] = parseInt($('#product-id').val());

                addProduct(data,
                    function () {
                        $.ajax({
                            url: "/api/gio-hang/" + customerCodeWhenLogin + "/ACTIVE",
                            method: "GET",
                            dataType: "json",
                            success: (response) => {
                                const size = response.gioHang.length;
                                $('.quantity-cart').text(size);
                            },
                            error: (error) => {
                            }
                        });

                        if (buttonClick.prop('id') === "add-cart") {
                            showSuccess("Thêm sản phẩm vào giỏ hàng thành công");
                            variantId = null;
                            $('#product').find('input[type=radio]').prop('checked', false);
                            $('#quantity').val(1);
                        } else {
                            $('#product').find('input[type=radio]').prop('checked', false);
                            $('#quantity').val(1);
                            window.location.href = "/cart"
                        }
                    }
                    ,
                    function (error) {
                        if(Object.keys(error.responseJSON.details).length > 0){
                            $('#quantity').val(error.responseJSON.details.quantity);
                        }else{
                            $('#quantity').val(1)
                            $('#product').find('input[type=radio]').prop('checked', false);
                        }
                        showError(error.responseJSON.error)
                    }
                )
            }, function (error) {
                console.log(error)
            })
    }
}