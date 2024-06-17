<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 12/11/2023
  Time: 11:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chi tiết ca làm</title>
</head>
<body>
<div class="content-body">
    <div class="container-fluid">
        <h4 style="margin-top: 0;
    margin-bottom: 30px;
    border-bottom: 2px solid #FFD43B;
    padding-bottom: 10px;
    padding-left: 5px;
    color: black;">
            Chi tiết ca làm
        </h4>
        <div class="row">
            <div class="col-lg-8">
                <div class="card" style="box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
    padding: 20px; background-color: #fff">
                    <h4>Thông tin hóa đơn</h4>
                    <hr>
                    <table class="table table-hover" id="tblHoaDon" >
                        <thead>
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">Mã Hóa đơn</th>
                            <th scope="col">Khách hàng</th>
                            <th scope="col">Ngày mua</th>
                            <th scope="col">Tổng tiền hàng</th>
                            <th scope="col">Phương thức</th>
                        </tr>
                        </thead>
                        <tbody >
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card " style="box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
    padding: 20px; background-color: #fff">
                    <h4>Thông tin ca làm</h4>
                    <hr>
                    <div class="row">
                        <div class="col-8">
                            <h6>Số tiền đầu ca:</h6>
                        </div>
                        <div class="col-4 text-right">
                            <span style="color: #EB8153" id="soTienDauCa">150</span> đ
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-8">
                            <h6>Khách trả tiền mặt:</h6>
                        </div>
                        <div class="col-4 text-right">
                            <span id="tongTienMat"> 300</span> đ
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-8">
                            <h6>Khách chuyển khoản:</h6>
                        </div>
                        <div class="col-4 text-right">
                            <span id="tongTienChuyenKhoan"> 100</span> đ
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-8">
                            <h6>Tổng tiền trong ca:</h6>
                        </div>
                        <div class="col-4 text-right">
                            <span id="tongTienTrongCa"> 400</span> đ
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-8">
                            <h6>Tiền mặt bàn giao:</h6>
                        </div>
                        <div class="col-4 text-right">
                            <span id="tienMatBanGiao"> 400</span> đ
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-8">
                            <h6>Tiền chênh lệch:</h6>
                        </div>
                        <div class="col-4 text-right">
                            <span id="tienChenhLech"> 0</span> đ
                        </div>
                    </div>
                    <div class="row mt-3">
                        <h6>Ghi chú:</h6>
                        <textarea class="form-control"></textarea>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function getCaLam() {
        var url = window.location.pathname.split("/");
        var id = url[url.length - 1];
        console.log(id);
        $.ajax({
            url: '/api/ca-lam/' + id,
            method: 'GET',
            dataType: 'json',
            success: function (req) {
                $("#ma").val(req.ma);
            },
            error: function (xhr, status, error) {
                console.log(error);
                alert('Có lỗi xảy ra: ' + error);
            }
        });
    }

    getNhanVienDetail();
</script>
</body>
</html>
