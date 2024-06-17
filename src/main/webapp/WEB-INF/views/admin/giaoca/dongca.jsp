<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 10/19/2023
  Time: 10:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Báo cáo kết ca</title>
</head>
<body>
<div class="content-body">
    <div class="container-fluid">
        <h4 style="margin-top: 0;
    margin-bottom: 30px;
    border-bottom: 2px solid #FFD43B;
    padding-bottom: 10px;
    padding-left: 5px;
    color: black;" class="font-weight-bold">Đóng ca làm việc</h4>

        <div class="row">
            <div class="col-3">
                <strong>Giờ mở ca:</strong> <span id="ngayTao"></span>
            </div>
            <div class="col-3">
                <strong>Giờ hiện tại: </strong> <span id="thoiGian"></span>
            </div>
            <div class="col-3">
                <strong>Nhân viên: </strong><span id="maNhanVien"></span>
            </div>
        </div>
        <div class="card card-body mt-3" >

        <div class="card card-body hstack gap-3 mt-1">
            <div class="">
                <h5 class="font-weight-bold" style="color: #EB8153">Đầu ca</h5>
            </div>
            <div class=" ms-auto">
                <span class="text-cyan">Tiền mặt:</span><span class="text-cyan ms-1" id="soTienDauCa"></span><span class="text-cyan ms-1">đ</span>
            </div>
        </div>

        <div class="card card-body mt-3">
            <div class=" hstack gap-3">
                <h5 class="font-weight-bold" style="color: #EB8153">Trong ca</h5>
                <div class=" ms-auto">
                    <span class="text-cyan">Tiền mặt:</span><span class="text-cyan ms-1" id="tongTienMat1"></span><span class="text-cyan ms-1">đ</span>
                </div>
            </div>
            <div class="row p-3">
                <div class="col-3">
                    <div class="bg-light-subtle p-3">
                    <strong>Bán hàng </strong>(<span id="tongHoaDon"></span> hóa đơn)
                    <div class="d-flex justify-content-between my-3" style="border-bottom: 2px solid green;">
                        <div style="margin-bottom: 10px;">
                            1. Tiền mặt
                        </div>
                        <div>
                            <span id="tongTienMat"></span> đ
                        </div>
                    </div>
                    <div class="d-flex justify-content-between my-3" style="border-bottom: 2px solid green;">
                        <div style="margin-bottom: 10px;">
                            2. Chuyển khoản
                        </div>
                        <div>
                            <span id="tongTienChuyenKhoan"></span> đ
                        </div>
                    </div>
                    <div class="d-flex justify-content-between my-3 font-weight-bold">
                        <div class="">
                           Tổng thu
                        </div>
                        <div>
                            <span id="tongTienTrongCa"></span> đ
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="card card-body mt-3">
            <div class=" hstack gap-3">
                <h5 class="font-weight-bold" style="color: #EB8153">Cuối ca</h5>
                <div class=" ms-auto">
                    <span class="text-cyan">Tiền cuối ca:</span><span class="text-cyan ms-1" id="soTienCuoiCa"></span><span class="text-cyan ms-1">đ</span>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-4">
                    <span class="text-danger">* </span>Tiền mặt bàn giao thực tế:
                    <div class="input-wrapper1 mt-4">
                        <input class="input-box1" id="tienMatBanGiao" name="tienMatBanGiao" type="text" placeholder="Nhập số tiền">
                        <span class="underline1"></span>
                    </div>

                </div>
                <div class="col-4">
                    Số tiền chêch lệch:
                    <div class="mt-4">
                        <span id="tienChenhLech">0</span> đ
                    </div>
                </div>
                <div class="col-4">
                    Ghi chú:
                    <div class="input-wrapper1 mt-4">
                        <input class="input-box1" id="ghiChu" name="ghiChu" type="text" placeholder="Nhập ghi chú">
                        <span class="underline1"></span>
                    </div>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="text-right">
                <button class="btn" id="dongCa"  style="background-color: #A6edab; color: #00852d">Đóng ca và in phiếu giao</button>
            </div>
        </div>

        </div>
    </div>
</div>


<script>
    function time() {
        var currentDate = new Date();
        var formattedTime = ('0' + currentDate.getDate()).slice(-2) + '/'
            + ('0' + (currentDate.getMonth() + 1)).slice(-2) + '/'
            + currentDate.getFullYear() + ' '
            + ('0' + currentDate.getHours()).slice(-2) + ':'
            + ('0' + currentDate.getMinutes()).slice(-2)+ ':'
            + ('0' + currentDate.getSeconds()).slice(-2);
        $('#thoiGian').text(formattedTime);
    }

    setInterval(time, 1000);

    function formatDate(date) {
        var year = date.getFullYear().toString();
        var month = (date.getMonth() + 101).toString().substring(1);
        var day = (date.getDate() + 100).toString().substring(1);
        return year + "-" + month + "-" + day;
    }

    function getDateTimeFromTimestamp(unixTimeStamp) {
        let date = new Date(unixTimeStamp);
        return ('0' + date.getDate()).slice(-2) + '/' + ('0' + (date.getMonth() + 1)).slice(-2) + '/' + date.getFullYear() + ' ' + ('0' + date.getHours()).slice(-2) + ':' + ('0' + date.getMinutes()).slice(-2) + ':' + ('0' + date.getSeconds()).slice(-2);
    }

    $('#tienMatBanGiao').on('input', function () {
        var soTienBanGiao = parseFloat($('#tienMatBanGiao').val()) || 0;
        var soTienCuoiCa = parseFloat($('#soTienCuoiCa').text()) || 0;
        var tienChenhLech = soTienCuoiCa - soTienBanGiao;
        $('#tienChenhLech').text(tienChenhLech);
    });

    function updateUiWithInitialData(req) {
        $('#maNhanVien').text(req.maNhanVien);
        $('#ngayTao').text(getDateTimeFromTimestamp(req.ngayTao));
        $('#soTienDauCa').text(req.soTienDauCa);
        $('#soTienCuoiCa').text(req.soTienCuoiCa);
        $('#tongTienMat').text(req.tongTienMat);
        $('#tongTienMat1').text(req.tongTienMat);
        $('#tongTienChuyenKhoan').text(req.tongTienChuyenKhoan);
        $('#tongHoaDon').text(req.tongHoaDon);
        $('#tongTienTrongCa').text(req.tongTienTrongCa);
    }

    $.ajax({
        url: '/api/ca-lam/ket-ca?ngay=' + formatDate(new Date()) + '&ma=' + ma,
        method: 'GET',
        dataType: 'json',
        success: function (req) {
            updateUiWithInitialData(req);
        },
        error: function (xhr, status, error) {
            console.log(error);
        }
    });

    function validate(){
        var ghiChu = $("#ghiChu").val();
        var tienMatBanGiao = $("#tienMatBanGiao").val();

        if (tienMatBanGiao === "") {
            showError("Tiên mặt bàn giao không được để trống");
            return false;
        }
        if (isNaN(parseFloat(tienMatBanGiao))) {
            showError("Tiền mặt bàn giao phải là số");
            return false;
        }
        if (ghiChu === "") {
            showError("Ghi chú không được để trống");
            return false;
        }
        return true;
    }

    $('#dongCa').on('click', function (e) {

        var soTienCuoiCa = $("#soTienCuoiCa").text();
        var tienChenhLech = $("#tienChenhLech").text();
        var ghiChu = $("#ghiChu").val();
        var tienMatBanGiao = $("#tienMatBanGiao").val();

        var data = {
            "soTienCuoiCa": soTienCuoiCa,
            "tienChenhLech": tienChenhLech,
            "tienMatBanGiao": tienMatBanGiao,
            "ghiChu": ghiChu
        };
        if (validate()) {
            $.ajax({
                url: "/api/ca-lam/" + ma,
                method: "PUT",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify(data),
                success: function (response) {
                    window.location.href = "/logout";
                    showSuccess("Đóng ca thành công")
                },
                error: function (error) {
                    showError(error);
                }
            });
        }
    })

</script>
</body>
</html>
