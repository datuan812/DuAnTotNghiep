<%@ page import="com.laptrinhjavaweb.security.utils.SecurityUtils" %><%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 11/17/2023
  Time: 2:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Long idkh = SecurityUtils.getPrincipal().getId();
    String ma = SecurityUtils.getPrincipal().getMa();
%>
<head>
    <title>Nạp tiền</title>

</head>
<section>
    <div style="box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 1px 3px 1px; padding: 20px">
        <div class="row">
            <span class="fs-5" style="border-bottom: 1px solid #dedede;padding: 15px">
                    <ul class="nav">
                        <li class="nav-item">
                             <span class="fs-5" >Chọn số điểm muốn đổi: </span>
                        </li>
                        <li class="nav-item ms-auto">
                            <span class="badge bg-primary text-wrap fs-3">
                                <i class="bi bi-piggy-bank-fill me-2"></i><span class="" id="point-customer"> 0</span>
                            </span>
                        </li>
                    </ul>
            </span>
        </div>

        <div class="row" style="border-bottom: 1px solid #dedede;padding: 15px">
            <div class="col-4 p-2">
                <button class="color-button w-100 getValue" value="10" onclick="changeValue(this)">10</button>
            </div>
            <div class="col-4 p-2">
                <button class="color-button w-100 getValue" value="20" onclick="changeValue(this)">20</button>
            </div>
            <div class="col-4 p-2">
                <button class="color-button w-100 getValue" value="30" onclick="changeValue(this)">30</button>
            </div>
            <div class="col-4 p-2">
                <button class="color-button w-100 getValue" value="50" onclick="changeValue(this)">50</button>
            </div>
            <div class="col-4 p-2">
                <button class="color-button w-100 getValue" value="100" onclick="changeValue(this)">100</button>
            </div>
            <div class="col-4 p-2">
                <button class="color-button w-100 getValue" value="200" onclick="changeValue(this)">200</button>
            </div>
        </div>

        <div class="row">
            <span class="fs-5 p-3">Nhập số điểm: </span>
        </div>

        <div class="input-wrapper1">
            <input  class="input-box1 w-25" type="text" id="so-diem-doi">
            <span class="underline1"></span>
        </div>

        <div class="row">
            <div class="col-8"></div>
            <div class="col-4">
                <div class="d-flex justify-content-between mt-4">
                    <div>
                        <span>Số điểm:</span>
                    </div>
                    <div>
                        <span id="so-diem">0</span>
                    </div>
                </div>
                <div class="d-flex justify-content-between mt-2">
                    <div>
                        <span class="fs-5">Số tiền: </span>
                    </div>
                    <div>
                        <span id="so-tien-nhan">0</span>đ
                    </div>
                </div>
            </div>
        </div>
        <div class="row text-center">
            <div class="col mt-3 text-right">
                <button type="button" class="btn btn-success" id="btn-doi-diem">Xác nhận</button>
            </div>
        </div>


    </div>

</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
    var ma = '<%= ma %>';
    var selectedColor = null;
    var soDiemKhachCo = 0;

    loadSoDiem(ma);

    $(".color-button").on("click", function () {
        $(".color-button").removeClass("active");
        $(this).addClass("active");

        selectedColor = $(this).data("color");
    });

    function changeValue(button) {
        var value = formatNumber(parseFloat(button.value));
        $("#so-diem-doi").val(value);
        diemQuyTien(value);
    }

    $("#so-diem-doi").keyup(function () {
        var inputValue = $(this).val().replace(/\./g, ''); // Remove existing periods

        if (inputValue !== '' && !isNaN(inputValue) && parseInt(inputValue) >= 0) {
            diemQuyTien(inputValue);
        } else {
            $('#so-diem').text("0");
            $('#so-tien-nhan').text("0");
        }
    });

    function diemQuyTien(diem) {
        $.ajax({
            url: "/api/quy-doi-diem/diem-to-tien/" + diem,
            method: "GET",
            dataType: "json",
            success: (response) => {
                $('#so-diem').text(formatNumber(diem));
                $('#so-tien-nhan').text(formatNumber(response));
            },
            error: (error) => {
            }
        })
    }

    function updateFormattedValue() {
        var inputValue = $("#so-diem-doi").val(); // Remove existing periods
        if (inputValue ==! "" && !isNaN(inputValue)) {
            value = inputValue.replace(/\./g, '');
            var formattedValue = formatNumber(value);
            $("#so-diem-doi").val(formattedValue);
        }

    }

    $(document).ready(function() {
        $("#so-diem-doi").on("input", updateFormattedValue());
    });

    function formatNumber(number) {
        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    }

    function loadSoDiem(ma) {
        $.ajax({
            url: "/api/tich-diem/" + ma,
            method: "GET",
            dataType: "json",
            success: (response) => {
                soDiemKhachCo = response;
                $('#point-customer').text(response);
            },
            error: (error) => {
                console.log(error);
            }
        });
    }

    $('#btn-doi-diem').on('click', function () {
        doiDiem()
    });

    function doiDiem(){
        let soDiemDoi = $("#so-diem-doi").val().replace(/\./g, '').trim();
        if (!/^\d+$/.test(soDiemDoi) || soDiemDoi.trim() === "" || parseInt(soDiemDoi) <= 0) {
            showError("Số điểm khách hàng không hợp lệ.");
            return false;
        } else if (soDiemDoi > soDiemKhachCo) {
            showError("Số điểm khách hàng không hợp lệ. Xin kiểm tra lại");
            return false;
        } else if (soDiemDoi > soDiemKhachCo) {
            showError("Số điểm khách hàng không hợp lệ. Xin kiểm tra lại");
            return false;
        } else {
            let soDiemDung = $("#so-diem-doi").val().replace(/\./g, '');
            let soTienDoi = $('#so-tien-nhan').text().replace(/\./g, '');
            var data = {
                maKhachHang: ma,
                soDiemDung: soDiemDung,
                soDiemTichDuoc: 0,
                maHoaDon: "",
                soTien: soTienDoi,
            };

            sendDoiDiemRequest(data);
            tichDiem(data);
            luuLichSu(data);
            window.location.href = "/vi-dien-tu";
            showSuccess("Đổi điểm thành công");
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

    function sendDoiDiemRequest(data) {
        $.ajax({
            url: "/api/vi-dien-tu",
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

</script>

