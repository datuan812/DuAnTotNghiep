<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<%@ page import="com.laptrinhjavaweb.security.utils.SecurityUtils" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Giỏ hàng</title>
</head>
<body>
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 180px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping Cart</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Shopping Cart</p>
        </div>
    </div>
</div>
<div class="container-fluid pt-5" id="cart-checked">
    <div class="px-xl-5">
        <div class="khung mb-3">
            <div class="row ">
                <div class="col-5">
                    <div class="form-check mb-3">
                        <input class="form-check-input checked-product checked-all" type="checkbox">
                        <label class="form-check-label">
                            Sản phẩm
                        </label>
                    </div>
                </div>
                <div class="col-2">
                    <span>Đơn giá</span>
                </div>
                <div class="col-2">
                    <span>Số lượng</span>
                </div>
                <div class="col-2">
                    <span>Tổng tiền</span>
                </div>
                <div class="col-1">
                    <span>Thao tác</span>
                </div>
            </div>
        </div>

        <div class="khung mb-5">
            <div id="cart">

            </div>
        </div>

        <div class="khung mb-5 " id="cart-disable">
            <span class="fs-4">Danh Sách Sản Phẩm Không Hoạt Động</span>
            <div id="cart-not-working">

            </div>
            <div id="cart-inactive">

            </div>
        </div>

        <div class="khung mb-3">
            <div class="row mt-4">
                <div class="col-2 mt-2">
                    <div class="form-check mb-3">
                        <input class="form-check-input checked-product checked-all" type="checkbox">
                        <label class="form-check-label">
                            Sản phẩm
                        </label>
                    </div>
                </div>
                <div class="col-1 mt-2">
                    <a>Xóa</a>
                </div>
                <div class="col-3 mt-2">
                </div>
                <div class="col-6">
                    <div class="row">
                        <div class="col-6">
                            Tổng thanh toán (<span class="total-checked">0</span> sản phẩm):
                            <div class="btn-group">
                                <span class="dropdown-toggle text-danger total-buy product-price-custom-vnd" style="font-size: 25px"
                                      data-bs-toggle="dropdown" data-bs-auto-close="false" aria-expanded="false">
                                    0
                                </span>
                                <ul class="dropdown-menu p-3" style="width: 500px">
                                    <li>
                                        <div class="fs-5" style="border-bottom: 1px solid #dedede; padding: 10px">
                                            <span>Chi tiết khuyến mãi:</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="d-flex justify-content-between mt-2"
                                             style="border-bottom: 1px solid #dedede; padding: 10px">
                                            <span>Tổng tiền hàng:</span>
                                            <span class="total-cart product-price-custom-vnd">0</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="d-flex justify-content-between mt-2"
                                             style="border-bottom: 1px solid #dedede; padding: 10px">
                                            <span>Số tiền giảm:</span>
                                            <span class="total-discount product-price-custom-vnd">0</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="d-flex justify-content-between mt-2"
                                             style="border-bottom: 1px solid #dedede; padding: 10px">
                                            <span>Tổng số tiền:</span>
                                            <span class="total-buy product-price-custom-vnd">0</span>
                                        </div>
                                    </li>
                                </ul>

                            </div>
                        </div>
                        <div class="col-6 text-right">
                            <button id="buy-product" class="btn text-light w-75" style="background-color: #C3817B">
                                Mua hàng
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var idkh = <%=SecurityUtils.getPrincipal().getId()%>;
    async function muaHang() {
        if (!(await checkSoLanMua())) {
            return;
        }
        var listsp = getValByCheckbox();
        var listspAsNumbers = listsp.map(str => Number(str));

        var data = JSON.stringify({
            dsghct: listspAsNumbers,
        });
        $.ajax({
            url: '/api/user/giohang/dathang/' + idkh,
            method: 'POST',
            contentType: 'application/json',
            data: data,
            success: async function (req) {
                //     console.log(req)
                window.location.href = "/checkout";
            },
            error: function (xhr, status, error) {
                console.log(error)
                showError("Có lỗi xảy ra");
            }
        });
    }
    async function checkSoLanMua(){
        let flag = true;
        await $.ajax({
            url: '/api/user/giohang/checklanmua?idkh=' + idkh,
            method: 'GET',
            contentType: 'application/json',
            success: async function (req) {
                if (req==true){
                    showModalError("Bạn chỉ có thể đặt hàng 5 lần trong 1 ngày")
                    flag = false;
                }
            },
            error: function (xhr, status, error) {
                console.log(error)
                showError("Có lỗi xảy ra");
            }
        });
        return flag;
    }

    function getValByCheckbox() {
        return $("input[name='idghct']:checked").map(function () {
            return this.value;
        }).get();
    }
</script>
<script src="<c:url value='/assets/api/web/cart.js'/>"></script>
</body>
</html>