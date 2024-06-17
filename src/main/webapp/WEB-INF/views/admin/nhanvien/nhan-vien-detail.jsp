<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 9/26/2023
  Time: 3:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thông tin chi tiết nhân viên</title>
</head>
<body>
<div class="content-body">
    <div class="container-fluid">
        <div class="card card-body">
            <h4 style="margin-top: 0;
    margin-bottom: 30px;
    border-bottom: 2px solid #FFD43B;
    padding-bottom: 10px;
    padding-left: 5px;
    color: black;">
                Thông tin chi tiết nhân viên
            </h4>
            <div class="row">
                <div class="col">
                    <label>Mã nhân viên:</label>
                    <input type="text" name="ma" id="ma" class="form-control" disabled >
                </div>
                <div class="col">
                    <label>Họ và tên:</label>
                    <input type="text" id="ten" name="ten" class="form-control" disabled >
                </div>
                <div class="col">
                    <label>Địa chỉ email:</label>
                    <input type="email" name="email" id="email" class="form-control" disabled >
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">
                    <label>Địa chỉ thường chú:</label>
                    <input type="text" id="diaChi" name="diaChi" class="form-control" disabled >
                </div>
                <div class="col">
                    <label>Số điện thoại:</label>
                    <input type="text" id="soDienThoai" name="soDienThoai" class="form-control" disabled >
                </div>
                <div class="col">
                    <label  class="form-label">Ngày sinh:</label>
                    <input type="text" class="form-control" id="ngaySinh" name="ngaySinh" disabled >
                </div>
            </div>

            <div class="row mt-3">
                <div class="col">
                    <label>Số CCCD:</label>
                    <input type="text" id="canCuocCongDan" name="canCuocCongDan" class="form-control" disabled >
                </div>
                <div class="col">
                    <label class="form-label">Ngày cấp:</label>
                    <input type="text" class="form-control" id="ngayCap" name="ngayCap" disabled>
                </div>

            </div>

            <div class="row mt-3">
                <div class="col">
                    <label>Chức vụ:</label>
                    <input type="text" id="tenChucVu" name="tenChucVu" class="form-control" disabled >
                </div>
                <div class="col">
                    <label>Giới tính:</label>
                    <input type="text" class="form-control" id="gioiTinh" name="gioiTinh" disabled >
                </div>
            </div>

            <div class="row mt-3">
                <label>Ảnh nhân viên:</label>
                <div class="form-group col-md-12">
                    <div id="thumbbox">
                        <img height="300" width="300" alt="Thumb image" id="anh"/>
                    </div>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col">
                    <a href="/admin/nhan-vien" class="btn ms-2" style="background-color: #FFc5c4; color: #be2329">Cancel</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function getNhanVienDetail() {
        var url = window.location.pathname.split("/");
        var ma = url[url.length - 1];
        console.log(ma);
        $.ajax({
            url: '/api/nhan-vien/' + ma,
            method: 'GET',
            dataType: 'json',
            success: function (req) {
                $("#ma").val(req.ma);
                $("#ten").val(req.ten);
                $("#soDienThoai").val(req.soDienThoai);
                $("#email").val(req.email);
                $("#diaChi").val(req.diaChi);
                $("#gioiTinh").val(req.gioiTinh);
                $("#ngaySinh").val(formatDateInput(req.ngaySinh));
                $("#canCuocCongDan").val(req.canCuocCongDan);
                $("#ngayCap").val(formatDateInput(req.ngayCap));
                $("#tenChucVu").val(req.chucVu.ten);
                $("#anh").attr('src', "/repository/" + req.anh);
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


