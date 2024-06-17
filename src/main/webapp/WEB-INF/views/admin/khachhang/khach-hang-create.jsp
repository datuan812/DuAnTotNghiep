<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 9/26/2023
  Time: 3:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm khách hàng</title>
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
                Tạo mới khách hàng
            </h4>
            <form action="" id="form-submit-khach-hang">
                <div class="row">
                    <div class="col">
                        <label>Họ và tên:</label>
                        <input type="text" name="ten" id="ten" class="form-control" >
                    </div>
                    <div class="col">
                        <label>Số điện thoại:</label>
                        <input type="text" name="soDienThoai" id="soDienThoai" class="form-control" >
                    </div>
                    <div class="col">
                        <label>Địa chỉ email:</label>
                        <input type="email" name="email" id="email" class="form-control" >
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col">
                        <label class="form-label">Ngày sinh:</label>
                        <input type="date" name="ngaySinh" id="ngaySinh" class="form-control" >
                    </div>
                    <div class="col">
                        <label>Giới tính:</label>
                        <select class="form-select" id="gioiTinh" name="gioiTinh">
                            <option value="Nam" selected>Nam</option>
                            <option value="Nữ">Nữ</option>
                        </select>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col">
                        <div class="form-floating">
                            <textarea class="form-control" name="moTa" id="moTa" placeholder="Leave a comment here" ></textarea>
                            <label >Mô tả</label>
                        </div>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col">
                        <button class="btn" id="them" style="background-color: #A6edab; color: #00852d">Add</button>
                        <a href="/admin/khach-hang" class="btn ms-2" style="background-color: #FFc5c4; color: #be2329">Cancel</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<script>
    function isValidPhoneNumber(soDienThoai) {
        return /^[0-9]{10}$/.test(soDienThoai);
    }

    function isValidEmail(email) {
        return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
    }

    function validateForm() {
        let isValid = true;

        let soDienThoai = $("#soDienThoai").val().trim();
        let email = $("#email").val().trim();
        let ngaySinh = $("#ngaySinh").val().trim();

        if(ngaySinh !== "") {
            let selectedDate = new Date(ngaySinh);
            let currentDate = new Date();

            // Kiểm tra xem ngày sinh có lớn hơn hoặc bằng 15 tuổi không
            let ageLimitDate = new Date();
            ageLimitDate.setFullYear(currentDate.getFullYear() - 15);

            if (selectedDate > currentDate || selectedDate > ageLimitDate) {
                showError("Ngày sinh không hợp lệ. Phải lớn hơn hoặc bằng 15 tuổi");
                isValid = false;
            }
        }
        if (!isValidEmail(email) && email !== "") {
            showError("Địa chỉ email không hợp lệ");
            isValid = false;
        }
        if (soDienThoai === "") {
            showError("Số điện thoại không được để trống");
            isValid = false;
        } else if (!isValidPhoneNumber(soDienThoai)) {
            showError("Số điện thoại không hợp lệ");
            isValid = false;
        }
        if ($("#ten").val().trim() === "") {
            showError("Họ và tên không được để trống");
            isValid = false;
        }
        return isValid;
    }
    $('#them').on('click', (e) => {
        e.preventDefault();
        if (validateForm()) {
            let data = getDataFromForm();
            $.ajax({
            url: "/api/khach-hang",
            method: "POST",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: JSON.stringify(data),
            success: (response) => {
                window.location.href = '/admin/khach-hang';
                showSuccess("Thêm thành công")
            },
            error: (error) => {
                showError(error.responseJSON.error);
            }
            });
        }
    });

    function getDataFromForm() {
        let dataFromForm = $("#form-submit-khach-hang").serializeArray();
        let data = {};
        $.each(dataFromForm, (index, value) => {
            let propertyName = value.name;
            let propertyValue = value.value;
            data[propertyName] = propertyValue;
        });
        return data;
    }
</script>