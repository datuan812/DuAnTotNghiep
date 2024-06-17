<%@ page import="com.laptrinhjavaweb.security.utils.SecurityUtils" %><%--
  Created by IntelliJ IDEA.
  User: MMC
  Date: 10/27/2023
  Time: 10:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Thêm Hóa Đơn</title>
</head>
<body>
<div class="offcanvas offcanvas-end w-50" style="border-bottom-left-radius: 30px;border-top-left-radius: 30px "
     data-bs-backdrop="static" tabindex="-1" id="staticBackdrop" aria-labelledby="staticBackdropLabel">
    <div>
        <div class="offcanvas-header mt-3 ms-3">
            <h4 class="offcanvas-title font-weight-bold" id="tenSanPham"></h4>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <div class="row">
                <nav class="mt-3">
                    <div class="nav nav-tabs" id="nav-tab" role="tablist" style="font-size: 20px">
                        <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab"
                                data-bs-target="#nav-home"
                                type="button" role="tab" aria-controls="nav-home" aria-selected="true">Thông tin chung
                        </button>
                        <button class="nav-link ms-3" id="nav-profile-tab" data-bs-toggle="tab"
                                data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile"
                                aria-selected="false">Mô tả sản phẩm
                        </button>
                    </div>
                </nav>
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab"
                         tabindex="0">
                        <div class="row mt-3">
                            <div class="col-md-4">
                                <img src="" id="image" class="img-fluid" alt="...">
                            </div>
                            <div class="col-md-8">
                                <div class="row p-2">
                                    <div class="col-3">
                                        <h5>Giá bán:</h5>
                                    </div>
                                    <div class="col-9">
                                        <span class="text-cyan fs-4" id="gia"></span> <span class="text-cyan">đ</span>
                                    </div>
                                </div>
                                <div class="row mt-3" style="border-bottom: 1px solid #dedede; padding: 10px">
                                    <div class="col-3">
                                        <h5>Số lượng:</h5>
                                    </div>
                                    <div class="col-9">
                                        <span id="soLuong"></span>
                                    </div>

                                </div>
                                <div class="thuoc-tinh">

                                </div>
                                <div class="row mt-3" style="border-bottom: 1px solid #dedede; padding: 10px">
                                    <div class="col-3">
                                        <h5>Thương hiệu:</h5>
                                    </div>
                                    <div class="col-9">
                                        <span id="tenThuongHieu"></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab"
                         tabindex="0">
                            <span class="product-description">
                                <div id="moTa" class="m-4">

                                </div>
                            </span>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<section>
    <div class="content-body" style="background-color: #fff">
        <div class="container-fluid">
            <div class="row">
                <div class="col-8">
                    <a class="btn" href="/admin/giao-dich/hoa-don-off" style="background-color: #dedede">Danh sách hóa
                        đơn chờ thanh toán</a>
                    <button class="btn btn-add-invoice" style="background-color: #dedede">Thêm hóa đơn</button>
                </div>
                <div class="col-4">
                    <button class="btn btn-success float-right" data-bs-toggle="modal" data-bs-target="#exampleModal"> +
                        Chọn sản phẩm
                    </button>

                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog  modal-fullscreen">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4>Chọn sản phẩm</h4>
                                    <div class="group123 ms-5">
                                        <svg id="searchButton" xmlns="http://www.w3.org/2000/svg" class="icon "
                                             aria-hidden="true"
                                             viewBox="0 0 512 512">
                                            <!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                            <style>svg {
                                                fill: #ebeef4
                                            }</style>
                                            <path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/>
                                        </svg>
                                        <input placeholder="Tìm hàng hóa" type="search" id="searchAll"
                                               class="inputghichu" style="width: 500px">
                                    </div>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>

                                </div>
                                <div class="modal-body" style="height: 700px; overflow-y: scroll;">
                                    <p class="mt-3" id="iemty"></p>
                                    <div class="row" id="list-products">

                                    </div>
                                    <ul class="pagination d-flex justify-content-center" id="pagination"></ul>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="row mt-3">
                <div class="col-lg-8">
                    <p id="invoice-non">Thêm sản phẩm vào hóa đơn nào!!!</p>
                    <div id="invoice" style="max-height: 410px; overflow-y: scroll;">

                    </div>
                    <div id="invoice-money-quantity" class="card card-body mt-3" style="border-radius: 10px">
                        <div class="row">
                            <div class="col-4">
                                <div class="group123">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon" aria-hidden="true"
                                         viewBox="0 0 512 512">
                                        <!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                        <style>svg {
                                            fill: #e3e9f2
                                        }</style>
                                        <path d="M362.7 19.3L314.3 67.7 444.3 197.7l48.4-48.4c25-25 25-65.5 0-90.5L453.3 19.3c-25-25-65.5-25-90.5 0zm-71 71L58.6 323.5c-10.4 10.4-18 23.3-22.2 37.4L1 481.2C-1.5 489.7 .8 498.8 7 505s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L421.7 220.3 291.7 90.3z"/>
                                    </svg>
                                    <input placeholder="Ghi chú đơn hàng" type="search" class="inputghichu w-100">
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="d-flex justify-content-center">
                                    <div>
                                        <h4 class="text-right">
                                            <strong>Tổng số lượng:</strong>
                                            <span id="invoice-quantity">1</span>
                                        </h4>
                                    </div>
                                </div>
                            </div>
                            <div class="col-5">
                                <div class="d-flex justify-content-center">
                                    <div>
                                        <h4 class="text-right">
                                            <strong>Tổng tiền hàng:</strong>
                                            <span class="invoice-total">0</span>
                                        </h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card card-body" style="border-radius: 10px; height: 670px">
                        <div class="row">
                            <div class="col-lg-6">
                                <h5><strong>Nhân viên: </strong> <%=SecurityUtils.getPrincipal().getTen()%>
                                </h5>
                            </div>
                            <div class="col-lg-6 text-right">
                                <h5 id="thoiGian"></h5>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-9">
                                <div class="group123 mt-2">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon" aria-hidden="true"
                                         viewBox="0 0 512 512">
                                        <!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                        <style>svg {
                                            fill: #ebeef4
                                        }</style>
                                        <path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/>
                                    </svg>
                                    <input placeholder="Tìm khách hàng" type="text" class="inputghichu w-100"
                                           id="search-customer">
                                    <input type="hidden" value="" id="code-customer">
                                </div>
                            </div>
                            <div class="col-3">
                                <button type="button" class="btn w-100 mt-2" data-bs-toggle="modal"
                                        data-bs-target="#exampleModal1"
                                        style="background-color: #F3F3F4; border: 1px solid #F3F3F4">
                                    <i class="bi bi-plus-lg"></i>
                                </button>
                                <div class="modal fade" id="exampleModal1" tabindex="-1"
                                     aria-labelledby="exampleModalLabel1" aria-hidden="true">
                                    <div class="modal-dialog modal-xl">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel1">Thêm khách hàng</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="" method="POST" id="form-data-customer">
                                                    <div class="row">
                                                        <div class="col">
                                                            <label>Họ và tên:</label>
                                                            <input name="ten" id="ten" type="text" class="form-control">
                                                        </div>
                                                        <div class="col">
                                                            <label>Số điện thoại:</label>
                                                            <input name="soDienThoai" id="soDienThoai" type="text"
                                                                   class="form-control">
                                                        </div>
                                                        <div class="col">
                                                            <label>Địa chỉ email:</label>
                                                            <input name="email" id="email" type="email"
                                                                   class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="row mt-3">
                                                        <div class="col">
                                                            <label class="form-label">Ngày sinh:</label>
                                                            <input type="date" class="form-control">
                                                        </div>
                                                        <div class="col">
                                                            <label>Giới tính:</label>
                                                            <select class="form-select" name="gioitinh">
                                                                <option value="true" selected>Nam</option>
                                                                <option value="false">Nữ</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-3">
                                                        <div class="col">
                                                            <div class="form-floating">
                                                                <textarea class="form-control"
                                                                          placeholder="Leave a comment here"></textarea>
                                                                <label>Mô tả</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <button class="btn" id="btn-add-customer"
                                                        style="background-color: #A6edab; color: #00852d">
                                                    Add
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col">
                                <div class=" badge bg-success text-wrap">
                                    <span>Điểm: </span>
                                    <strong id="point-customer">Không có</strong>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-6 ">
                                <h5>Tổng tiền hàng:</h5>
                            </div>
                            <div class="col-6 text-right">
                                <span class="invoice-total fs-5">0</span>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-6">
                                <h5>Số điểm khách hàng sử dụng:</h5>
                            </div>
                            <div class="col-2"></div>
                            <div class="col-4 text-right">
                                <div class="input-wrapper1">
                                    <input id="input-point" disabled class="input-box1" type="text"
                                           placeholder="Nhập số điểm">
                                    <span class="underline1"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-6">
                                <h5>Số tiền giảm:</h5>
                            </div>
                            <div class="col-2"></div>
                            <div class="col-4 text-right">
                                <div class="input-wrapper1">
                                    <span id="discount">0</span> đ
                                    <span class="underline1"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-6 ">
                                <h5><strong>Khách cần trả:</strong></h5>
                            </div>
                            <div class="col-6 text-right">
                                <span style="color: #EB8153"><strong id="invoice-after-point"
                                                                     class="invoice-total fs-5">0</strong></span>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-6 ">
                                <h5><strong>Khách thanh toán:</strong></h5>
                                <select class="form-select" aria-label="Default select example">
                                    <option value="1">Tiền mặt</option>
                                </select>
                            </div>
                            <div class="col-2"></div>
                            <div class="col-4 text-right">
                                <div class="input-wrapper1">
                                    <input id="invoice-customer-payment" class="input-box1" type="text"
                                           placeholder="Nhập số tiền">
                                    <span class="underline1"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-5">
                            <div class="col-6 ">
                                <h5>Tiền thừa trả khách:</h5>
                            </div>
                            <div class="col-6 text-right">
                                <span id="money-change" class="fs-5">0</span> đ
                            </div>
                        </div>
                        <div class="row mt-auto">
                            <div class="col-12">
                                <button id="btn-paymant-invoice" class="btn w-100 text-light"
                                        style="background-color: #EB8153;">Thanh toán
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>

<script>
    const currentUrl = window.location.href;
    const results = currentUrl.split('/');
    const maHoaDon = results[results.length - 1];
    let isPayment = true;
    let param = '';
    let pageCurrent = 1;
    let customers = [];

    loadAllProduct();

    loadHoaDon();

    setInterval(time, 1000);

    function time() {
        var currentDate = new Date();
        var formattedTime = ('0' + currentDate.getDate()).slice(-2) + '/'
            + ('0' + (currentDate.getMonth() + 1)).slice(-2) + '/'
            + currentDate.getFullYear() + ' '
            + ('0' + currentDate.getHours()).slice(-2) + ':'
            + ('0' + currentDate.getMinutes()).slice(-2) + ':'
            + ('0' + currentDate.getSeconds()).slice(-2);
        $('#thoiGian').text(formattedTime);
    }

    function formatNumber(number) {
        return new Intl.NumberFormat('vi-VN').format(number);
    }

    $('.btn-add-invoice').on('click', function (e) {
        e.preventDefault();

        updateInvoiceTreo(
            function () {
                let data = {};
                data['maNhanVien'] = ma;
                data['trangThai'] = "TREO";
                data['loai'] = "OFFLINE";

                console.log(data);

                $.ajax({
                    url: "/api/hoa-don-off",
                    method: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify(data),
                    success: (response) => {
                        showSuccess("Thêm hóa đơn thành công");
                        window.location.href = `/admin/giao-dich/hoa-don-off/create/\${response.ma}`;
                    },
                    error: (error) => {
                        console.log(error);
                    }
                });
            },
            function (error) {
                console.log("Error: " + error);
            }
        );
    })

    function isValidPhoneNumber(soDienThoai) {
        return /^[0-9]{10}$/.test(soDienThoai);
    }

    function isValidEmail(email) {
        return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
    }

    function validateFormKhachHang() {
        let ten = $("#ten").val().trim();
        let soDienThoai = $("#soDienThoai").val().trim();
        let email = $("#email").val().trim();
        if (ten === "") {
            showError("Họ và tên không được để trống");
            return false;
        }
        if (soDienThoai === "") {
            showError("Số điện thoại không được để trống");
            return false;
        } else if (!isValidPhoneNumber(soDienThoai)) {
            showError("Số điện thoại không hợp lệ");
            return false;
        }
        if (email === "") {
            showError("Địa chỉ email không được để trống");
            return false;
        } else if (!isValidEmail(email)) {
            showError("Địa chỉ email không hợp lệ");
            return false;
        }
        return true;
    }

    $('#btn-add-customer').on('click', () => {
        if (validateFormKhachHang()) {
            let dataForm = $('#form-data-customer').serializeArray();
            let data = {};
            $.each(dataForm, (index, value) => {
                let propertyName = value.name;
                let propertyValue = value.value;
                data[propertyName] = propertyValue;
            });
            $.ajax({
                url: "/api/khach-hang",
                method: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify(data),
                success: (response) => {
                    showSuccess("Thêm khách hàng thành công!")
                    $('#exampleModal1').removeClass('show');
                    $('.modal-backdrop').addClass('d-none');
                    $('#search-customer').val(response.soDienThoai + " - " + response.ten);
                    $('#code-customer').val(response.ma);
                },
                error: (error) => {
                    showError(error.responseJSON.error)
                }
            });
        }
    })

    $('#btn-paymant-invoice').on('click', function () {
        showConfirm("Bạn có chắc chắn muốn thanh toán hóa đơn?")
            .then((confirmed) => {
                if (confirmed) {
                    paymentInvoice();
                    if ($('#code-customer').val() !== "") {
                        tienQuyDiem(
                            function (response) {
                                let data = {};
                                data['maKhachHang'] = $('#code-customer').val();
                                data['soDiemDung'] = $('#input-point').val() === "" ? 0 : parseInt($('#input-point').val().trim())
                                data['soDiemTichDuoc'] = response;
                                data['maHoaDon'] = maHoaDon;
                                tichDiem(data);

                                luuLichSu(data);
                            },
                            function (error) {
                                console.log(error);
                            });
                    }

                }
            });
    });

    $("#input-point").keyup(function () {
        if ($(this).val() !== '') {
            diemQuyTien(parseInt($(this).val()));
        } else {
            $('#discount').text("0");
            $('#invoice-after-point').text($('.invoice-total:first').text());

        }
    });

    function loadAllProduct() {
        $.ajax({
            url: "/api/san-pham/pagination?page=" + pageCurrent + "&limit=12",
            method: "GET",
            dataType: "json",
            success: (response) => {
                let html = '';
                $.each(response.data, (index, item) => {
                    const lenAttrbute = item.thuocTinh.length;
                    let htmlcoupon = '';
                    if (item.khuyenMaiHienThiResponse !== null) {

                        if(item.khuyenMaiHienThiResponse.trangThai=="ACTIVE"){
                            htmlcoupon = ` <h6><del class="card-text product-price product-origin" style="color: #000">\${item.gia}</del></h6>
                                        <h4 class="card-text product-price product-buy" style="color: #EB8153">\${item.giaBan}</h4>`;
                        }else {
                            htmlcoupon = `<h4 class="card-text product-price product-buy" style="color: #EB8153">\${item.gia}</h4>`;
                        }
                    } else {
                        htmlcoupon = `<h4 class="card-text product-price product-buy" style="color: #EB8153">\${item.giaBan}</h4>`;
                    }
                    html += `<div class="col-lg-6">
                        <div class="card card-item-product mb-3" style=" height: 390px">
                            <div class="row g-0">
                                <div class="col-md-4">
                                    <img src="/repository/\${item.anh[0].hinhAnh}"
                                         class="img-fluid rounded-start w-100 product-image-primary" style="height: 180px"  alt="...">
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h5 class="card-title line-clamp-2">\${item.ten}</h5>`;
                    html += htmlcoupon + `<p>
                                            Sản phẩm có sẵn: <span class="product-quantity">\${item.soLuong}</span>
                                        </p>`;
                    html += `</div></div></div><input type="hidden" value="\${lenAttrbute}" class="len-attribute">`;

                    let htmlThuocTinh = `<div class="row mt-2">`;
                    $.each(item.thuocTinh, (indexThuocTinh, itemThuocTinh) => {
                        htmlThuocTinh += `<div class="col-3">
                                            <label class="ms-3">\${itemThuocTinh.ten} :</label>
                                          </div>
                                          <div class="col-9 d-flex">`;

                        $.each(itemThuocTinh.giaTriThuocTinh, (indexGiaTriThuocTinh, itemGiaTriThuocTinh) => {
                            htmlThuocTinh += `<div class="form-check mr-3 mb-2">
                                                <input name="giatrithuoctinh-thuoctinh-\${itemThuocTinh.id}" id="\${itemGiaTriThuocTinh.id}" type="radio" class="form-check-input"
                                                       value="\${itemGiaTriThuocTinh.id}">
                                                <label for="\${itemGiaTriThuocTinh.id}" class="form-check-label">\${itemGiaTriThuocTinh.giaTri}</label>
                                               </div>`;
                        })
                        htmlThuocTinh += `</div>`;
                    })
                    htmlThuocTinh += `</div>
                                        <div class="text-right mt-auto mb-2">
                                             <button class="btn me-4 btn-buy-product" style="background-color: #EB8153; color: #fff">Mua ngay</button>
                                        </div>
                                        <div class="data-server">
                                             <input type="hidden" id="product-id" value="\${item.id}">
                                        </div>
                                    </div></div>`;

                    html += htmlThuocTinh;
                })
                $('#list-products').html(html);

                $('.product-price').each(function (index, item) {
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

                $('#pagination').twbsPagination('destroy');
                $('#pagination').twbsPagination({
                    visiblePages: 5,
                    totalPages: response.meta.totalPage,
                    startPage: response.meta.pageCurrent,
                    onPageClick: function (event, page) {
                        if (page !== pageCurrent) {
                            event.preventDefault();
                            pageCurrent = page;
                            if (param != '') {
                                searchSanPham(param)
                            } else {
                                loadAllProduct();
                            }
                        }
                    },
                });
            },
            error: (error) => {
                console.log(error);
            }
        });
    }

    let variantId = null;
    let couponId = null;

    $("#list-products").on("change", "input[type='radio']", function () {
        let lenOfAttribute = parseInt($(this).closest('.card-item-product').find('.len-attribute').val());
        const lenChecked = $(this).closest('.card-item-product').find('input[type="radio"]:checked').length;

        if (lenChecked === lenOfAttribute) {
            let attributeId = [];
            $(this).closest('.card-item-product').find('input[type="radio"]:checked').each(function () {
                attributeId.push(parseInt($(this).val()));
            })
            $.ajax({
                url: "/api/bien-the",
                method: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify(attributeId),
                success: (response) => {
                    variantId = response.id;
                    if (response.khuyenMaiHienThiResponse !== null) {
                        couponId = response.khuyenMaiHienThiResponse.id;
                    }
                    $(this).closest('.card-item-product').find('.product-origin').text(response.gia);
                    $(this).closest('.card-item-product').find('.product-quantity').text(response.soLuong)
                    $(this).closest('.card-item-product').find('.product-buy').text(response.giaBan)


                    if (response.hinhAnh !== null) {
                        $(this).closest('.card-item-product').find('.product-image-primary').attr('src', '/repository/' + response.hinhAnh);
                    }

                    $(this).closest('.card-item-product').find('.product-price').each(function (index, item) {
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

    $('#list-products').on('click', function (e) {
        const eleClick = $(e.target);
        if (eleClick.hasClass('btn-buy-product')) {
            const eleParent = eleClick.closest('.card-item-product');
            const lenChecked = eleParent.find('input[type="radio"]:checked').length;
            const lenOfAttribute = eleParent.find('.len-attribute').val();

            if (parseInt(lenChecked) !== parseInt(lenOfAttribute)) {
                showError("Vui lòng chọn sản phẩm");
            } else {
                let productBuyVND = eleParent.find('.product-buy').text();
                let productBuy = parseInt(productBuyVND.replace(/[^\d.]/g, '').replace('.', ''));
                let productId = eleParent.find('#product-id').val();
                let productQuantity = parseInt(eleParent.find('.product-quantity').text());

                if (productQuantity === 0) {
                    showError("Sản phẩm đã hết hàng");
                } else {
                    let data = {};
                    data['maHoaDon'] = maHoaDon;
                    data['soLuong'] = 1;
                    data['idSanPham'] = parseInt(productId);
                    data['idBienThe'] = variantId;
                    data['idKhuyenMai'] = couponId;
                    data['gia'] = productBuy;
                    data['thanhTien'] = productBuy;

                    console.log(data);

                    addProductInvoice(data,
                        function (response) {
                            variantId = null;
                            couponId = null;
                            $('#list-products').find('input[type=radio]').prop('checked', false);
                            showSuccess("Thêm sản phẩm vào hóa đơn thành công");
                            loadHoaDon();
                        },
                        function (error) {
                            console.log(error);
                        }
                    );
                }
            }
        }
    });

    function searchSanPham(param) {
        $.ajax({
            url: '/api/san-pham/search?q=' + param + "&page=" + pageCurrent + "&limit=12",
            method: "GET",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: (response) => {
                if (response.data.length === 0) {
                    $('#iemty').removeClass('d-none')
                    $('#iemty').text("Không tìm thấy sản phẩm nào như thế !")
                    $('#list-products').addClass('d-none');
                    $('#pagination').addClass('d-none');
                } else {
                    $('#iemty').addClass('d-none')
                    $('#list-products').removeClass('d-none');
                    $('#pagination').removeClass('d-none');
                    let html = '';
                    $.each(response.data, (index, item) => {
                        const lenAttrbute = item.thuocTinh.length;
                        let htmlcoupon = '';
                        if (item.khuyenMaiHienThiResponse !== null) {

                            if(item.khuyenMaiHienThiResponse.trangThai=="ACTIVE"){
                                htmlcoupon = ` <h6><del class="card-text product-price product-origin" style="color: #000">\${item.gia}</del></h6>
                                        <h4 class="card-text product-price product-buy" style="color: #EB8153">\${item.giaBan}</h4>`;
                            }else {
                                htmlcoupon = `<h4 class="card-text product-price product-buy" style="color: #EB8153">\${item.gia}</h4>`;
                            }
                        } else {
                            htmlcoupon = `<h4 class="card-text product-price product-buy" style="color: #EB8153">\${item.giaBan}</h4>`;
                        }
                        html += `<div class="col-lg-6">
                        <div class="card card-item-product mb-3" style=" height: 375px">
                            <div class="row g-0">
                                <div class="col-md-4">
                                    <img src="/repository/\${item.anh[0].hinhAnh}"
                                         class="img-fluid rounded-start w-100 product-image-primary" style="height: 180px"  alt="...">
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                       <h5 class="card-title line-clamp-2">\${item.ten}</h5>`;
                        html += htmlcoupon + `<p>
                                            Sản phẩm có sẵn: <span class="product-quantity">\${item.soLuong}</span>
                                        </p>`;
                        html += `</div></div></div><input type="hidden" value="\${lenAttrbute}" class="len-attribute">`;

                        let htmlThuocTinh = `<div class="row mt-2">`;
                        $.each(item.thuocTinh, (indexThuocTinh, itemThuocTinh) => {
                            htmlThuocTinh += `<div class="col-3">
                                            <label class="ms-3">\${itemThuocTinh.ten} :</label>
                                          </div>
                                          <div class="col-9 d-flex">`;

                            $.each(itemThuocTinh.giaTriThuocTinh, (indexGiaTriThuocTinh, itemGiaTriThuocTinh) => {
                                htmlThuocTinh += `<div class="form-check mr-3 mb-2">
                                                <input name="giatrithuoctinh-thuoctinh-\${itemThuocTinh.id}" id="\${itemGiaTriThuocTinh.id}" type="radio" class="form-check-input"
                                                       value="\${itemGiaTriThuocTinh.id}">
                                                <label for="\${itemGiaTriThuocTinh.id}" class="form-check-label">\${itemGiaTriThuocTinh.giaTri}</label>
                                               </div>`;
                            })
                            htmlThuocTinh += `</div>`;
                        })
                        htmlThuocTinh += `</div>
                                        <div class="text-right mt-auto mb-2">
                                             <button class="btn me-4 btn-buy-product" style="background-color: #EB8153; color: #fff">Mua ngay</button>
                                        </div>
                                        <div class="data-server">
                                             <input type="hidden" id="product-id" value="\${item.id}">
                                        </div>
                                    </div></div>`;

                        html += htmlThuocTinh;
                    })

                    $('#list-products').html(html);

                    $('.product-price').each(function (index, item) {
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
                    $('#pagination').twbsPagination('destroy');
                    $('#pagination').twbsPagination({
                        visiblePages: 5,
                        totalPages: response.meta.totalPage,
                        startPage: response.meta.pageCurrent,
                        onPageClick: function (event, page) {
                            if (page !== pageCurrent) {
                                event.preventDefault();
                                pageCurrent = page;
                                if (param != '') {
                                    searchSanPham(param)
                                } else {
                                    loadAllProduct();
                                }
                            }
                        },
                    });
                }
            },
            error: (error) => {
                console.log(error);
            }
        });
    }

    $(document).ready(function () {
        var searchButton = $('#searchAll');
        pageCurrent = 1;
        searchButton.on('keydown', function (event) {
            if (event.which === 13) {
                param = searchButton.val().trim();
                if (pageCurrent > 1) {
                    pageCurrent = 1;
                }
                searchSanPham(param);
            }
        });
    });

    $.ajax({
        url: '/api/khach-hang/all',
        method: "GET",
        dataType: "json",
        success: function (response) {
            $.each(response.data, function (index, item) {
                let customer = {
                    "value": item.soDienThoai + " - " + item.ten,
                    "ma": item.ma
                };
                customers.push(customer);
            });
            loadSuggestions(customers);
        },
        error: function (error) {
            console.log(error);
        }
    });

    function loadSuggestions(options) {
        let searchCustomerInput = $('#search-customer');

        $('#search-customer').autocomplete({
            lookup: options,
            minChars: 0,
            onSelect: function (suggestion) {
                $('#code-customer').val(suggestion.ma);
                searchCustomerInput.val(suggestion.value);
                $('#input-point').attr('disabled', false);
                loadSoDiem(suggestion.ma);
            }
        });

        searchCustomerInput.on('input', function () {
            if (!searchCustomerInput.val().trim()) {
                $('#code-customer').val('');
                $('#point-customer').text("Không có");
            }
        });
    }

    function loadHoaDon() {
        $.ajax({
            url: "/api/hoa-don-off/" + maHoaDon,
            method: "GET",
            dataType: "json",
            success: (response) => {
                if(response.hoaDonChiTiet.length === 0){
                    $('#invoice').html('');
                    $('.invoice-total').text(0);
                    $('#invoice-quantity').text(0);
                    $('#invoice-non').show();
                }else {
                    let totalInvoice = 0;
                    let toatlQuantity = 0;
                    let html = ``;
                    if (response.tienThua === null) {
                        $('#money-change').text(0);
                    } else {
                        $('#money-change').text(response.tienThua);
                    }
                    $.each(response.hoaDonChiTiet, (index, item) => {
                        totalInvoice += item.thanhTien;
                        toatlQuantity += item.soLuong;
                        var nameVariant = [];
                        $.each(item.thuocTinh, (indexThuocTinh, itemThuocTinh) => {
                            $.each(itemThuocTinh.giaTriThuocTinh, (indexGiaTriThuocTinh, itemGiaTriThuocTinh) => {
                                $.each(item.giaTriThuocTinhChecked, (indexGiaTriThuocTinhChecked, itemGiaTriThuocTinhChecked) => {
                                    if (itemGiaTriThuocTinhChecked === itemGiaTriThuocTinh.id) {
                                        nameVariant.push(itemGiaTriThuocTinh.giaTri);
                                    }
                                })
                            });
                        });
                        html += `<div class="card card-body mb-2 card-body-invoice-detail" style="border-radius: 10px;">
                                    <div class="row">
                                        <div class="col-xl-1 my-2 col-lg-4 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>\${++index}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-4 my-2 col-lg-4 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Tên sản phẩm</span>
                                                    <h5 class="mb-0 pt-1 font-w500 text-black" style="max-width: 300px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">\${item.tenSanPham}</h5>
                                                    <div class="name-variant mb-0 pt-1 text-success">\${nameVariant.join(", ")}</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Số lượng</span>
                                                    <div class="input-group w-100 action">
                                                        <button class="btn text-light btn-remove-product" style="background-color: #EB8153"><i class="fa fa-minus"></i></button>
                                                        <input type="text" class="form-control invoice-detail-quantity" style="text-align: center" value="\${item.soLuong}"/>
                                                        <button class="btn text-light btn-add-product" style="background-color: #EB8153"><i class="fa fa-plus"></i></button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex  align-items-center">
                                                <div class="ml-2">
                                                    <span>Đơn giá</span><br>
                                                    <span class="mb-0 pt-1 fs-5 font-w500 text-black">\${formatNumber(item.gia)}</span> đ
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex project-status align-items-center">
                                                <div class="ml-2">
                                                    <span>Tổng tiền</span><br>
                                                    <span class="mb-0 pt-1 font-w500 fs-5 text-black">\${formatNumber(item.thanhTien)}</span> đ
                                                </div>

                                            </div>
                                        </div>
                                        <div class="col-xl-1 my-2 col-lg-6 col-sm-6">
                                             <div class="dropdown">
                                                <a href="javascript:void(0);" data-toggle="dropdown" aria-expanded="false">
                                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M12 13C12.5523 13 13 12.5523 13 12C13 11.4477 12.5523 11 12 11C11.4477 11 11 11.4477 11 12C11 12.5523 11.4477 13 12 13Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                                        <path d="M12 6C12.5523 6 13 5.55228 13 5C13 4.44772 12.5523 4 12 4C11.4477 4 11 4.44772 11 5C11 5.55228 11.4477 6 12 6Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                                        <path d="M12 20C12.5523 20 13 19.5523 13 19C13 18.4477 12.5523 18 12 18C11.4477 18 11 18.4477 11 19C11 19.5523 11.4477 20 12 20Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                                    </svg>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right">
                                                    <a class="dropdown-item invoice-detail-delete" href="">Xóa</a>
                                                    <a class="dropdown-item invoice-detail-seen" href="" data-bs-toggle="offcanvas" data-bs-target="#staticBackdrop" aria-controls="staticBackdrop">Xem chi tiết</a>
                                                </div>
                                             </div>
                                        </div>
                                    </div>
                                    <input type="hidden" name="" class="invoice-detail" value="\${item.id}">
                                </div>
                                `;
                        $('#invoice').html(html);

                        $('#invoice-non').hide();

                        $('#invoice-money-quantity').show();

                        $('.invoice-total').text(totalInvoice);

                        $('#invoice-quantity').text(toatlQuantity);

                        $('.invoice-detail-seen').on('click', function () {
                            let invoiceDetailId = parseInt($(this).closest('.card-body-invoice-detail').find('.invoice-detail').val());
                            $.ajax({
                                url: "/api/hoa-don-chi-tiet/" + invoiceDetailId,
                                method: "GET",
                                dataType: "json",
                                success: (response) => {
                                    $("#tenSanPham").text(response.tenSanPham);
                                    $("#gia").text(formatNumber(response.gia));
                                    $("#soLuong").text(response.soLuong);
                                    $("#tenThuongHieu").text(response.tenThuongHieu);
                                    var moTaElement = document.getElementById("moTa");
                                    moTaElement.innerHTML = response.moTa;
                                    $("#image").attr('src', '/repository/' + response.image);
                                    const giaTriThuocTinhChecked = response.giaTriThuocTinhChecked;
                                    let htmlThuocTinh = '';
                                    $.each(response.thuocTinh, (index, item) => {
                                        htmlThuocTinh += `<div class="row mt-3" style="border-bottom: 1px solid #dedede; padding: 10px"><div class="col-3"><h5>\${item.ten}:</h5></div>
                                                                    <div class="col-9 d-flex"> `

                                        let htmlGiaTriThuocTinh = '';
                                        $.each(item.giaTriThuocTinh, (index, item1) => {
                                            let checked = giaTriThuocTinhChecked.includes(item1.id) ? "checked" : "";
                                            htmlGiaTriThuocTinh += `<div class="form-check mr-3 mb-2">
                                                                        <input type="radio" class="form-check-input"
                                                                               value="\${item1.id}"  \${checked}>
                                                                        <label class="form-check-label">\${item1.giaTri}</label>
                                                                    </div>`

                                        })
                                        htmlThuocTinh = htmlThuocTinh + htmlGiaTriThuocTinh + `</div></div>`;
                                    })
                                    $(".thuoc-tinh").html(htmlThuocTinh);
                                },
                                error: (error) => {
                                }
                            })

                        })

                        $('.btn-add-product').on('click', function () {
                            let quantity = parseInt($(this).closest('.action').find('.invoice-detail-quantity').val());
                            quantity += 1;
                            let invoiceDetailId = parseInt($(this).closest('.card-body-invoice-detail').find('.invoice-detail').val());
                            console.log(invoiceDetailId)
                            updateQuantity(invoiceDetailId, quantity)
                        })

                        $('.btn-remove-product').on('click', function () {
                            let quantityElement = $(this).closest('.action').find('.invoice-detail-quantity');
                            let quantity = parseInt(quantityElement.val());
                            if (quantity === 1) {
                                showError("Không thể giảm thêm nữa nhé.")
                                return;
                            }
                            quantity -= 1;
                            let invoiceDetailId = parseInt($(this).closest('.card-body-invoice-detail').find('.invoice-detail').val());
                            updateQuantity(invoiceDetailId, quantity);
                        });

                        $('.invoice-detail-quantity').on('input', function () {
                            let inputValue = $(this).val();
                            if (!(/^\d+$/.test(inputValue))) {
                                inputValue = inputValue.replace(/[^\d]/g, '');
                                $(this).val(inputValue);
                            }
                            let quantity = parseInt(inputValue);
                            if (isNaN(quantity) || quantity === 0) {
                                quantity = 1;
                                $(this).val(quantity);
                            }

                            let invoiceDetailId = parseInt($(this).closest('.card-body-invoice-detail').find('.invoice-detail').val());
                            updateQuantity(invoiceDetailId, quantity);
                        });

                        $('.invoice-detail-delete').on('click', function (e) {
                            e.preventDefault()
                            showConfirm("Bạn có muốn xóa sản phẩm này không?")
                                .then((confirmed) => {
                                    if (confirmed) {
                                        let invoiceDetailId = parseInt($(this).closest('.card-body-invoice-detail').find('.invoice-detail').val());
                                        $.ajax({
                                            url: "/api/hoa-don-chi-tiet/" + invoiceDetailId,
                                            method: "DELETE",
                                            contentType: "application/json; charset=utf-8",
                                            data: JSON.stringify(invoiceDetailId),
                                            success: (response) => {
                                                showSuccess("Xóa sản phẩm thành công");
                                                loadHoaDon()
                                            },
                                            error: (error) => {
                                            }
                                        })
                                    }
                                })
                        })
                    })
                }
                $('#invoice').append(`<input type="hidden" name="" class="invoice-id" value="\${response.id}">`);
            },
            error: (error) => {
                console.log(error);
            }
        });
    }

    function addProductInvoice(data, successCallback, errorCallback) {
        $.ajax({
            url: "/api/hoa-don-chi-tiet",
            method: "POST",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            success: (response) => {
                successCallback(response);
            },
            error: (error) => {
                errorCallback(error);
            }
        });
    }

    function updateQuantity(id, quantity) {
        $.ajax({
            url: "/api/hoa-don-chi-tiet/" + id,
            method: "PUT",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(quantity),
            success: (response) => {
                isPayment = true;
                showSuccess("Cập nhật số lượng hóa đơn thành công")
                loadHoaDon()

            },
            error: (error) => {
                isPayment = false;
                showError(error.responseJSON.error)
            }
        });
    }

    function loadSoDiem(ma) {
        if (ma === null) {
            $('#point-customer').text("Không có");
        } else {
            $.ajax({
                url: "/api/tich-diem/" + ma,
                method: "GET",
                dataType: "json",
                success: (response) => {
                    $('#point-customer').text(response);
                },
                error: (error) => {
                    console.log(error);
                }
            });
        }
    }

    function validateForm() {
        let tienKhachTra = parseFloat($("#invoice-customer-payment").val());
        let tongTienHang = parseFloat($('.invoice-total:first').text());
        let tienGiamGia = parseFloat($('#discount').text());

        if (isNaN(tienKhachTra)) {
            tienKhachTra = 0;
        }

        let tienThua = tienKhachTra - (tongTienHang - tienGiamGia);
        tienThua = Math.max(0, tienThua);

        $('#money-change').text(formatNumber(tienThua));
    }

    $('#invoice-customer-payment').on('input', validateForm);

    function paymentInvoice() {
        if (isPayment === false) {
            showError("Số lượng không hợp lệ. Xin kiểm tra lại");
            return false;
        }

        let tienKhachTra = parseFloat($("#invoice-customer-payment").val());
        let tongTienHang = parseFloat($('.invoice-total:first').text());
        let tienGiamGia = parseFloat($('#discount').text());

        if (isNaN(tienKhachTra) || tienKhachTra < (tongTienHang - tienGiamGia)) {
            showError("Số tiền khách thanh toán chưa đủ");
            return false;
        } else if (parseInt($('#input-point').val()) > parseInt($('#point-customer').text())) {
            showError("Số điểm khách hàng không hợp lệ. Xin kiểm tra lại");
            return false;
        } else {
            let data = {};
            data['id'] = parseInt($('.invoice-id').val());
            data['ma'] = maHoaDon;
            data['loai'] = "OFFLINE";
            data['trangThai'] = "THANHCONG";
            data['phuongThucThanhToan'] = "TIENMAT";
            data['tongTienHang'] = tongTienHang;
            data['tienKhachTra'] = tienKhachTra;
            data['maKhachHang'] = $('#code-customer').val() === "" ? null : $('#code-customer').val();
            data['maNhanVien'] = ma;
            data['tienGiamGia'] = tienGiamGia;

            showConfirm("Bạn có muốn in hóa đơn hay không?")
                .then((confirmedPrint) => {
                    $.ajax({
                        url: "/api/hoa-don-off",
                        method: "PUT",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify(data),
                        success: (response) => {
                            if (confirmedPrint) {
                                window.location.href = "/admin/hoa-don/printf/" + maHoaDon;
                            } else {
                                window.location.href = "/admin/giao-dich/hoa-don-off";
                                showSuccess("Thanh toán hóa đơn thành công");
                            }
                        },
                        error: (error) => {
                            console.log(error);
                        }
                    });
                });
        }
    }

    function tichDiem(data) {
        $.ajax({
            url: "/api/tich-diem",
            method: "POST",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            success: (response) => {
            },
            error: (error) => {
                console.log(error)
            }
        });
    }

    function luuLichSu(data) {
        $.ajax({
            url: "/api/lich-su-tich-diem",
            method: "POST",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            success: (response) => {

            },
            error: (error) => {
                console.log(error)
            }
        });
    }

    function diemQuyTien(diem) {
        $.ajax({
            url: "/api/quy-doi-diem/diem-to-tien/" + diem,
            method: "GET",
            dataType: "json",
            success: (response) => {
                $('#discount').text(response);

                let total = parseFloat($('.invoice-total:first').text()) - parseFloat($('#discount').text());
                $('#invoice-after-point').text(total);
            },
            error: (error) => {

            }
        })
    }

    function tienQuyDiem(successCallback, errorCallback) {
        $.ajax({
            url: "/api/quy-doi-diem/tien-to-diem/" + parseFloat($('#invoice-after-point').text()),
            method: "GET",
            dataType: "json",
            success: (response) => {
                successCallback(response);
            },
            error: (error) => {
                errorCallback(error)
            }
        })
    }

    function updateInvoiceTreo(successCallback, errorCallback) {
        if($('#invoice').find('.card-body-invoice-detail').length === 0){
            showError("Chưa có sản phẩm nào nên bạn không được tạo hóa đơn mới. Xin lỗi vì sự bất tiện này");
            return false;
        }
        let tienKhachTra = parseFloat($("#invoice-customer-payment").val());
        let tongTienHang = parseFloat($('.invoice-total:first').text());

        let data = {};
        data['id'] = parseInt($('.invoice-id').val());
        data['ma'] = maHoaDon;
        data['loai'] = "OFFLINE";
        data['trangThai'] = "TREO";
        data['phuongThucThanhToan'] = "TIENMAT";
        data['tongTienHang'] = tongTienHang;
        data['tienKhachTra'] = tienKhachTra;
        data['maKhachHang'] = $('#code-customer').val() === "" ? null : $('#code-customer').val();
        data['maNhanVien'] = ma;
        data['tienGiamGia'] = parseFloat($('#discount').text());

        console.log(data);

        $.ajax({
            url: "/api/hoa-don-off",
            method: "PUT",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: JSON.stringify(data),
            success: (response) => {
                successCallback();
            },
            error: (error) => {
                errorCallback(error);
            }
        });
    }
</script>

</body>
</html>
