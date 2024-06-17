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
    <title>Cập nhật nhân viên</title>
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
                Sửa thông tin nhân viên
            </h4>
            <form action="" id="form-submit-nhan-vien">
            <div class="row">
                <div class="col">
                    <label>Mã nhân viên:</label>
                    <input type="text" id="ma" name="ma" class="form-control" disabled >
                </div>
                <div class="col">
                    <label>Họ và tên:</label>
                    <input type="text" id="ten" name="ten" class="form-control" >
                </div>
                <div class="col">
                    <label>Địa chỉ email:</label>
                    <input type="email" id="email" name="email" class="form-control" >
                </div>
            </div>

            <div class="row mt-3">
                <div class="col">
                    <label>Địa chỉ thường chú:</label>
                    <input type="text" id="diaChi" name="diaChi" class="form-control" >
                </div>
                <div class="col">
                    <label>Số điện thoại:</label>
                    <input type="text" id="soDienThoai" name="soDienThoai" class="form-control" >
                </div>
                <div class="col">
                    <label>Số CCCD:</label>
                    <input type="text" id="canCuocCongDan" name="canCuocCongDan" class="form-control" >
                </div>
            </div>

            <div class="row mt-3">
                <div class="col">
                    <label  class="form-label">Ngày sinh:</label>
                    <input type="date" class="form-control" id="ngaySinh" name="ngaySinh" >
                </div>
                <div class="col">
                    <label class="form-label">Ngày cấp:</label>
                    <input type="date" class="form-control" id="ngayCap" name="ngayCap">
                </div>
                <div class="col">
                    <label>Giới tính:</label>
                    <select class="form-select" id="gioiTinh" name="gioiTinh">
                        <option value="Nam" id="namOption">Nam</option>
                        <option value="Nữ" id="nuOption">Nữ</option>
                    </select>
                </div>
                <div class="col">
                    <label>Chức vụ:</label>
                    <select class="form-select" id="selectChucVu" name="maChucVu">

                    </select>
                </div>

            </div>

            <div class="row mt-3">
                <label>Ảnh nhân viên:</label>
                <div class="form-group col-md-12">
                    <div id="thumbbox">
                        <img height="300" width="300" alt="Thumb image" id="thumbimage"/>
                    </div>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col">
                    <button class="btn" id="updateButton" style="background-color: #A6edab; color: #00852d">Update</button>
                    <a href="/admin/nhan-vien" class="btn ms-2" style="background-color: #FFc5c4; color: #be2329">Cancel</a>
                </div>
            </div>
            </form>
        </div>
    </div>
</div>

<script>

    function updateChucVuSelect() {
        $.ajax({
            url: '/api/chuc-vu',
            method: 'GET',
            success: function (response) {
                let htmlSelect = '';
                $.each(response, (index, item) => {
                    htmlSelect +=  `<option value="\${item.ma}">\${item.ten}</option>`
                })
                $("#selectChucVu").append(htmlSelect)
            },
            error: function (xhr, status, error) {
                showError("Lỗi khi cập nhật select chức vụ");
            }
        });
    }

    updateChucVuSelect();

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
                if (req.gioiTinh === "Nam") {
                    $("#namOption").prop("selected", true);
                } else if (req.gioiTinh === "Nữ") {
                    $("#nuOption").prop("selected", true);
                }
                $("#ngaySinh").val(formatDateInput(req.ngaySinh));
                $("#canCuocCongDan").val(req.canCuocCongDan);
                $("#ngayCap").val(formatDateInput(req.ngayCap));
                $("#thumbimage").attr('src', "/repository/" + req.anh);

                $("#selectChucVu option").each(function(i){
                    $(this).prop('selected', $(this).val() === (req.chucVu && req.chucVu.ma));
                    if($(this).val() === req.chucVu.ma){
                        $(this).prop("selected", true);
                    }
                });
            },
            error: function (xhr, status, error) {
                console.log(error);
                alert('Có lỗi xảy ra: ' + error);
            }
        });
    }

    getNhanVienDetail();


    function isValidPhoneNumber(soDienThoai) {
        return /^[0-9]{10}$/.test(soDienThoai);
    }

    function isValidCCCDNumber(canCuocCongDan) {
        return /^[0-9]{12}$/.test(canCuocCongDan);
    }

    function isValidEmail(email) {
        return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
    }

    function validateForm(){
        let ten = $("#ten").val();
        let email = $("#email").val();
        let diaChi = $("#diaChi").val();
        let soDienThoai = $("#soDienThoai").val();
        let canCuocCongDan = $("#canCuocCongDan").val();
        let ngaySinh = $("#ngaySinh").val();
        let ngayCap = $("#ngayCap").val();

        if (ten === "") {
            showError("Họ và tên không được để trống");
            return false;
        }
        if (email === "") {
            showError("Email không được để trống");
            return false;
        }else if (!isValidEmail(email)) {
            showError("Địa chỉ email không hợp lệ");
            return false;
        }
        if (diaChi === "") {
            showError("Địa chỉ thường chú không được để trống");
            return false;
        }
        if (soDienThoai === "") {
            showError("Số điện thoại không được để trống");
            return false;
        } else if (!isValidPhoneNumber(soDienThoai)) {
            showError("Số điện thoại không hợp lệ");
            return false;
        }
        if (canCuocCongDan === "") {
            showError("Số căn cước công dân không được để trống");
            return false;
        } else if (!isValidCCCDNumber(canCuocCongDan)) {
            showError("Số căn cước công dân không hợp lệ");
            return false;
        }
        if (ngaySinh === "") {
            showError("Ngày sinh không được để trống");
            return false;
        } else  {
            let selectedDate = new Date(ngaySinh);
            let currentDate = new Date();
            if (selectedDate > currentDate) {
                showError("Ngày sinh không được lớn hơn ngày hiện tại");
                return false;
            }
        }
        if (ngayCap === "") {
            showError("Ngày cấp không được để trống");
            return false;
        } else  {
            let selectedDate = new Date(ngayCap);
            let currentDate = new Date();
            if (selectedDate > currentDate) {
                showError("Ngày cấp không được lớn hơn ngày hiện tại");
                return false;
            }
        }

        return true;
    }

    $('#updateButton').on('click', (e) => {
        e.preventDefault();
        if (validateForm()) {
            let data = getDataFromForm();
            var url = window.location.pathname.split("/");
            var ma = url[url.length - 1];
            $.ajax({
                url: "/api/nhan-vien/" + ma,
                method: "PUT",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify(data),
                success: (response) => {
                    window.location.href = '/admin/nhan-vien';
                    console.log("success");
                },
                error: (error) => {
                    showError("fail")
                }
            });
        }
    })

    function getDataFromForm() {
        let dataFromForm = $("#form-submit-nhan-vien").serializeArray();
        let data = {};
        $.each(dataFromForm, (index, value) => {
            let propertyName = value.name;
            let propertyValue = value.value;
            data[propertyName] = propertyValue;
        });
        return data;
    }
</script>


</body>
</html>
