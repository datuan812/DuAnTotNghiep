let page = 1;
let limit = 8;
loadProduct();
let pageDiscount = 1;
let limitDiscount = 4;
loadProductDiscount();

$('#load-more-product').on('click', (e) => {
    page = page + 1;
    loadProduct();
});

function loadProduct() {
    $.ajax({
        url: "/api/san-pham/pagination?page=" + page + "&limit=" + limit,
        method: "GET",
        dataType: "json",
        success: (response) => {
            if (page == response.meta.totalPage) {
                $('#load-more-product').attr('disabled', true);
            }
            let html = '';
            $.each(response.data, (index, item) => {
                let htmlCoupon = '';
                let coupon = item.khuyenMaiHienThiResponse;
                if(coupon !== null){
                    if(coupon.trangThai === "UPCOMING"){
                        htmlCoupon = `
                                  <h4 class="text-danger product-price-custom-vnd ms-2">${item.gia}</h4>`;
                    }else{
                        htmlCoupon = `<h6><del class="product-price-custom-vnd product-buy">${item.gia}</del></h6>
                                  <h4 class="text-danger product-price-custom-vnd ms-2">${item.giaBan}</h4>`;
                    }

                }else{
                    htmlCoupon = `<h4 class="text-danger product-price-custom-vnd ms-2">${item.giaBan}</h4>`;
                }
                html += `<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                            <a href="/san-pham/${item.slug}" class="text-decoration-none">
                                <div class="card product-item border-0 mb-4 hovers">
                                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                        <img class="img-fluid w-100" src="/repository/${item.anh[0].hinhAnh}" style="height:350px"  alt="">
                                    </div>
                                    <div class="card-body border border-left border-right text-center p-0 pt-4 pb-3">
                                        <h6 class="text-truncate mb-3">${item.ten}</h6>
                                        <div class="d-flex justify-content-center">
                                              ${htmlCoupon}
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>`;
            })
            $('#product-home-page').append(html);

            $('.product-price-custom-vnd').each(function(index, item) {
                let res = $(item).html();
                if(res.indexOf("đ") === -1){
                    let numericValue = parseInt(res.replace(/[^\d]/g, ''));
                    let formattedValue = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(numericValue);
                    $(item).html(formattedValue);
                }
            });
        },
        error: (error) => {
            console.log(error);
        }
    });
};



$('#load-more-product-discount').on('click', (e) => {
    pageDiscount = pageDiscount + 1;
    loadProductDiscount();
})

function loadProductDiscount() {
    $.ajax({
        url: "/api/san-pham/discount?page=" + pageDiscount + "&limit=" + limitDiscount,
        method: "GET",
        dataType: "json",
        success: (response) => {
            console.log(response)
            if (pageDiscount == response.meta.totalPage) {
                $('#load-more-product-discount').attr('disabled', true);
            }
            let html = '';
            $.each(response.data, (index, item) => {
                let htmlCoupon = '';
                let coupon = item.khuyenMaiHienThiResponse;
                if(coupon !== null){
                    if(coupon.trangThai === "UPCOMING"){
                        htmlCoupon = `
                                  <h4 class="text-danger product-price-custom-vnd ms-2">${item.gia}</h4>`;
                    }else{
                        htmlCoupon = `<h6><del class="product-price-custom-vnd product-buy">${item.gia}</del></h6>
                                  <h4 class="text-danger product-price-custom-vnd ms-2">${item.giaBan}</h4>`;
                    }
                    html += `<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                            <a href="/san-pham/${item.slug}" class="text-decoration-none">
                                <div class="card product-item border-0 mb-4 hovers">
                                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                        <img class="img-fluid w-100" src="/repository/${item.anh[0].hinhAnh}" style="height:350px"  alt="">
                                    </div>
                                    <div class="card-body border border-left border-right text-center p-0 pt-4 pb-3">
                                        <h6 class="text-truncate mb-3">${item.ten}</h6>
                                        <div class="d-flex justify-content-center">
                                              ${htmlCoupon}
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>`;
                }
            })
            $('#product-home-page-discount').append(html);

            $('.product-price-custom-vnd').each(function(index, item) {
                let res = $(item).html();
                if(res.indexOf("đ") === -1){
                    let numericValue = parseInt(res.replace(/[^\d]/g, ''));
                    let formattedValue = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(numericValue);
                    $(item).html(formattedValue);
                }
            });
        },
        error: (error) => {
            console.log(error);
        }
    });
}