<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 9/26/2023
  Time: 1:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm nhân viên</title>
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
                Tạo mới nhân viên
            </h4>
            <form action="" id="form-submit-nhan-vien">
                <div class="row">
                    <div class="col">
                        <label>Họ và tên:</label>
                        <input type="text" name="ten" id="ten" class="form-control" >
                    </div>
                    <div class="col">
                        <label>Địa chỉ email:</label>
                        <input type="email" name="email" id="email" class="form-control" >
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col">
                        <label>Địa chỉ thường chú:</label>
                        <input type="text" name="diaChi"  id="diaChi" class="form-control" >
                    </div>
                    <div class="col">
                        <label>Số điện thoại:</label>
                        <input type="text" id="soDienThoai" name="soDienThoai" class="form-control" >
                    </div>
                    <div class="col">
                        <label>Số CCCD:</label>
                        <input type="text" name="canCuocCongDan" id="canCuocCongDan" class="form-control" >
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col">
                        <label  class="form-label">Ngày sinh:</label>
                        <input type="date" name="ngaySinh" class="form-control" id="ngaySinh" >
                    </div>
                    <div class="col">
                        <label class="form-label">Ngày cấp:</label>
                        <input type="date" name="ngayCap" class="form-control" id="ngayCap">
                    </div>
                    <div class="col">
                        <label>Giới tính:</label>
                        <select class="form-select" id="gioiTinh" name="gioiTinh">
                            <option value="Nam" selected>Nam</option>
                            <option value="Nữ">Nữ</option>
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
                        <input type="file" id="upload-image" name="ImageUpload">
                        <div id="thumbbox">
                            <img height="300" width="300" alt="Thumb image" id="thumbimage" style="display: none" />
                        </div>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col">
                        <button type="submit" class="btn" id="them" style="background-color: #A6edab; color: #00852d">Add</button>
                        <a href="/admin/nhan-vien" class="btn ms-2" style="background-color: #FFc5c4; color: #be2329">Cancel</a>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>
<script>
    let image = {};
    $("#upload-image").change(function (event) {
        var reader = new FileReader();
        var file = $(this)[0].files[0];
        reader.onload = function (e) {
            let imageBase64 = e.target.result;
            let name = file.name;

            image["base64"] = imageBase64;
            image["anh"] = name;
        };
        reader.readAsDataURL(file);
        openImage(this);
    });

    function openImage(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#thumbimage').attr("src", reader.result);
                $('#thumbimage').show();
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
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
        let ten = $("#ten").val().trim();
        let email = $("#email").val().trim();
        let diaChi = $("#diaChi").val().trim();
        let soDienThoai = $("#soDienThoai").val().trim();
        let canCuocCongDan = $("#canCuocCongDan").val().trim();
        let ngaySinh = $("#ngaySinh").val().trim();
        let ngayCap = $("#ngayCap").val().trim()

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
    $('#them').on('click', (e) => {
        e.preventDefault();
        if (validateForm()) {
            let data = getDataFromForm();
            console.log(data);
            $.ajax({
                url: "/api/nhan-vien",
                method: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify(data),
                success: (response) => {
                    window.location.href = '/admin/nhan-vien';
                    console.log("success");
                },
                error: (error) => {
                    showError(error.responseJSON.error);
                }
            });
        }
    });

    function getDataFromForm() {
        let dataFromForm = $("#form-submit-nhan-vien").serializeArray();
        let data = {};
        $.each(dataFromForm, (index, value) => {
            let propertyName = value.name;
            let propertyValue = value.value;
            data[propertyName] = propertyValue;
        });
        data['anh'] = image.anh;
        data['base64'] = image.base64;
        return data;
    }

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



</script>
</body>
</html>
