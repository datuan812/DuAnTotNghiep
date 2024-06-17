<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 10/10/2023
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@include file="/common/taglib.jsp" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Shop Us</title>
</head>
<body>
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 180px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3"><s:message code="web.navbar.shopus" /></h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href=""><s:message code="web.navbar.home" /></a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0"><s:message code="web.navbar.shopus" /></p>
        </div>
    </div>
</div>
<div class="container-fluid pt-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2"><s:message code="web.shop.thongtin" /></span></h2>
        <h5 class="text-uppercase my-5"><s:message code="web.shop.thongtin1" />
        </h5>
    </div>
    <div class="row px-xl-5">
        <div class="col-12 pb-1">
            <img src="/template/web/img/banner1.jpg" width="100%" alt="">
        </div>
    </div>
    <div class="container">

        <div class="row px-xl-5 mt-4">
            <div class="col-lg-6 col-md-12 pb-1 ">
                <h3><s:message code="web.shop.thongtin2" /></h3>
                <p><s:message code="web.shop.thongtin3" /></p>
            </div>
            <div class="col-lg-6 col-md-12 ">
                <div class="row">
                    <div class="col-12">
                        <img src="/template/web/img/anh1.png" class="w-100" alt="">
                    </div>
                </div>
            </div>
        </div>
        <div class="row px-xl-5 mt-5">
            <div class="col-lg-6 col-md-12 ">
                <div class="row">
                    <div class="col-12">
                        <img src="/template/web/img/anh2.png" class="w-100" alt="">
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-12 pb-1 ">
                <h3><s:message code="web.shop.thongtin4" /></h3>
                <p><s:message code="web.shop.thongtin5" /></p>
            </div>
        </div>
        <div class="row px-xl-5 mt-5">
            <div class="col-lg-6 col-md-12 pb-1 ">
                <h3><s:message code="web.shop.thongtin6" /></h3>
                <p><s:message code="web.shop.thongtin7" /></p>
            </div>
            <div class="col-lg-6 col-md-12 ">
                <div class="row">
                    <div class="col-12">
                        <img src="/template/web/img/anh3.png" class="w-100" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid pt-5">
    <div class="text-center my-5">
        <h2 class="section-title px-5"><span class="px-2"><s:message code="web.shop.thongtin8" /></span></h2>
    </div>
    <div class="row px-xl-5">
        <div class="col-lg-3 col-md-6 col-sm-12 p-2">
            <div class="card p-3" style="background-color: #C99691">
                <div class="single-choose ">
                    <div class="choose-icon pos-rltv text-center">
                        <h1 class='bx bx-cart-add'></h1>
                    </div>
                    <div class="choose-title text-center">
                        <h5><s:message code="web.homepage.qualityProduct" /></h5>
                    </div>
                    <div class="choose-des">
                        <p>It is a long established fact that a reader will be distracted by the readable content of a
                            page when looking at its layout.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-3 col-md-6 col-sm-12 p-2">
            <div class="card p-3" style="background-color: #C99691">
                <div class="single-choose ">
                    <div class="choose-icon pos-rltv text-center">
                        <h1 class='bx bx-headphone'></h1>
                    </div>
                    <div class="choose-title text-center">
                        <h5><s:message code="web.homepage.freeship" /></h5>
                    </div>
                    <div class="choose-des">
                        <p>It is a long established fact that a reader will be distracted by the readable content of a
                            page when looking at its layout.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-3 col-md-6 col-sm-12 p-2">
            <div class="card p-3" style="background-color: #C99691">
                <div class="single-choose ">
                    <div class="choose-icon pos-rltv text-center">
                        <h1 class='bx bx-strikethrough'></h1>
                    </div>
                    <div class="choose-title text-center">
                        <h5><s:message code="web.homepage.DayReturn" /></h5>
                    </div>
                    <div class="choose-des">
                        <p>It is a long established fact that a reader will be distracted by the readable content of a
                            page when looking at its layout.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-3 col-md-6 col-sm-12 p-2">
            <div class="card p-3" style="background-color: #C99691">
                <div class="single-choose ">
                    <div class="choose-icon pos-rltv text-center">
                        <h1 class='bx bx-trending-up'></h1>
                    </div>
                    <div class="choose-title text-center">
                        <h5><s:message code="web.homepage.support" /></h5>
                    </div>
                    <div class="choose-des">
                        <p>It is a long established fact that a reader will be distracted by the readable content of a
                            page when looking at its layout.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid py-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2"><s:message code="web.shop.thongtin9" /></span></h2>
    </div>
    <div class="row px-xl-5">
        <div class="col">
            <div class="owl-carousel related-carousel">
                <div class="card product-item border-0">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="<c:url value='/template/web/img/product-1.jpg'/>" alt="">
                    </div>
                    <div class="card-footer bg-light border border-left border-right text-center p-0 pt-4 pb-3">
                        <h5 class="text-truncate mb-3">Nguyễn Thị Khánh Linh</h5>
                    </div>
                </div>
                <div class="card product-item border-0">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="<c:url value='/template/web/img/product-2.jpg'/>" alt="">
                    </div>
                    <div class="card-footer bg-light border border-left border-right text-center p-0 pt-4 pb-3">
                        <h5 class="text-truncate mb-3">Đặng Ngọc Thanh</h5>
                    </div>
                </div>
                <div class="card product-item border-0">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="<c:url value='/template/web/img/product-3.jpg'/>" alt="">
                    </div>
                    <div class="card-footer bg-light border border-left border-right text-center p-0 pt-4 pb-3">
                        <h5 class="text-truncate mb-3">Đinh Tuấn Anh</h5>
                    </div>
                </div>
                <div class="card product-item border-0">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="<c:url value='/template/web/img/product-4.jpg'/>" alt="">
                    </div>
                    <div class="card-footer bg-light border border-left border-right text-center p-0 pt-4 pb-3">
                        <h5 class="text-truncate mb-3">Đỗ Quốc Huy</h5>
                    </div>
                </div>
                <div class="card product-item border-0">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="<c:url value='/template/web/img/product-5.jpg'/>" alt="">
                    </div>
                    <div class="card-footer bg-light border border-left border-right text-center p-0 pt-4 pb-3">
                        <h5 class="text-truncate mb-3">Đinh Anh Tuấn</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="container-fluid pt-5">
    <div class="text-center my-5">
        <h2 class="section-title px-5"><span class="px-2"><s:message code="web.shop.thongtin10" /></span></h2>
    </div>
    <div class="row px-xl-5">
        <div class="col-6">
            <div class="card">
                <div class="form-check">
                    <input class="form-check-input my-4 ms-3" type="radio" name="flexRadioDefault" id="paypalRadio" checked>
                    <label class="form-check-label ms-5" for="paypalRadio">
                        <img src="/template/web/img/paypal.png" alt="">
                    </label>
                </div>
            </div>
            <div class="paypal">
                <p>Please click the "Checkout" button below to pay with Paypal</p>
                <button class="btn btn-primary">Checkout</button>
            </div>

            <div class="card mt-3">
                <div class="form-check">
                    <input class="form-check-input my-4 ms-3" type="radio" name="flexRadioDefault" id="bankTransferRadio">
                    <label class="form-check-label ms-5" for="bankTransferRadio">
                        <img src="/template/web/img/banktransfer.png" alt="">
                    </label>
                </div>
            </div>
            <div class="banktransfer" style="display: none;">
                <p>Please transfer according to the bank information below:</p>
                <p>Recipient Bank Account:</p>
                <p>Bank: MB BANK</p>
                <p>Account number: 0987654321</p>
                <p>Account holder name: KOC Shop</p>
            </div>
        </div>

        <div class="col-6">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d12525.381622199584!2d105.74598925796502!3d21.03995763828852!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31345544688c13a3%3A0x598a29eb40c7e5bb!2zVGjGocyAaSBUcmFuZyBWZW51cw!5e0!3m2!1sen!2s!4v1696573970081!5m2!1sen!2s"
                    style="border:0; width: 100%; height: 500px" allowfullscreen="" loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const paypalRadio = document.getElementById('paypalRadio');
        const bankTransferRadio = document.getElementById('bankTransferRadio');
        const paypalDiv = document.querySelector('.paypal');
        const bankTransferDiv = document.querySelector('.banktransfer');

        paypalRadio.checked = true;
        paypalDiv.style.display = 'block';

        bankTransferRadio.addEventListener('change', function () {
            if (bankTransferRadio.checked) {
                bankTransferDiv.style.display = 'block';
                paypalDiv.style.display = 'none';
            } else {
                bankTransferDiv.style.display = 'none';
            }
        });

        paypalRadio.addEventListener('change', function () {
            if (paypalRadio.checked) {
                paypalDiv.style.display = 'block';
                bankTransferDiv.style.display = 'none';
            } else {
                paypalDiv.style.display = 'none';
            }
        });
    });

</script>
</body>
</html>