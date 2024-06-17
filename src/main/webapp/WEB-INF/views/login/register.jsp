<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 10/22/2023
  Time: 3:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>

</head>
<body>

<main id="content" role="main" class="main">
    <div class="position-fixed top-0 right-0 left-0 bg-img-hero" style="height: 32rem; background-image: url(/template/login/img/bgr.jpg);">

        <figure class="position-absolute right-0 bottom-0 left-0">
            <svg preserveaspectratio="none" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" viewbox="0 0 1921 273">
                <polygon fill="#fff" points="0,273 1921,273 1921,0 "></polygon>
            </svg>
        </figure>

    </div>

    <div class="container py-5 py-sm-7">
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-5">
                <div class="card card-lg mb-5">
                    <div class="card-body">
                        <div class="text-center">
                            <div class="mb-5">
                                <h1 class="display-4">Tạo tài khoản của bạn</h1>
                                <p>Bạn có sẵn sàng để tạo một tai khoản? <a href="/login">Đăng nhập tại đây</a></p>
                            </div>

                            <span class="divider text-muted mb-4">Hoặc</span>
                        </div>
                        <div>
                            <form action="" id="formRegister">
                                <div class="form-row">
                                    <div class="col-sm-6">
                                        <label class="input-label">Tên khách hàng</label>
                                        <div class="js-form-message form-group">
                                            <input type="text" class="form-control form-control-lg" name="ten" id="ten" placeholder="Tên khách hàng">
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <label class="input-label">Số điện thoại</label>
                                        <div class="js-form-message form-group">
                                            <input type="text" class="form-control form-control-lg" name="soDienThoai" id="soDienThoai" placeholder="Số điện thoại">
                                        </div>
                                    </div>
                                </div>

                                <div class="js-form-message form-group">
                                    <label class="input-label">Địa chỉ email</label>
                                    <input type="email" class="form-control form-control-lg" name="email" id="email" placeholder="email@gmail.com">
                                </div>

                                <div class="js-form-message form-group">
                                    <label class="input-label">Mật khẩu</label>
                                    <div class="input-group input-group-merge">
                                        <input type="password" class="js-toggle-password form-control form-control-lg" name="matKhau" id="matKhau" placeholder="*************">
                                    </div>
                                </div>

                                <div class="js-form-message form-group">
                                    <label class="input-label">Xác nhận mật khẩu</label>
                                    <div class="input-group input-group-merge">
                                        <input type="password" class="js-toggle-password form-control form-control-lg" name="xacNhanMatKhau" id="xacNhanMatKhau" placeholder="*************">
                                    </div>
                                </div>

                                <div class="js-form-message form-group">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="termsCheckbox" name="termsCheckbox" >
                                        <label class="custom-control-label text-muted" for="termsCheckbox">Tôi chấp nhận <a href="#">Các điều khoản và điều kiện</a></label>
                                    </div>
                                </div>
                                <button id="them" class="btn btn-lg btn-block btn-primary mb-2">Tạo tài khoản</button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="text-center">
                    <small class="text-cap mb-4">Được tin cậy bởi các đội tốt nhất thế giới</small>

                    <div class="w-85 mx-auto">
                        <div class="row justify-content-between">
                            <div class="col">
                                <img class="img-fluid" src="/template/login/svg/brands/gitlab-gray.svg" alt="Image Description">
                            </div>
                            <div class="col">
                                <img class="img-fluid" src="/template/login/svg/brands/fitbit-gray.svg" alt="Image Description">
                            </div>
                            <div class="col">
                                <img class="img-fluid" src="/template/login/svg/brands/flow-xo-gray.svg" alt="Image Description">
                            </div>
                            <div class="col">
                                <img class="img-fluid" src="/template/login/svg/brands/layar-gray.svg" alt="Image Description">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<script>
    function isValidPhoneNumber(soDienThoai) {
        return /^[0-9]{10}$/.test(soDienThoai);
    }

    function isValidEmail(email) {
        return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
    }

    function validateForm() {
        let soDienThoai = $("#soDienThoai").val();
        let email = $("#email").val();
        let matKhau = $("#matKhau").val();
        let xacNhanMatKhau = $("#xacNhanMatKhau").val();
        let termsCheckbox = $("#termsCheckbox").prop("checked");

        if ($("#ten").val() === "") {
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
        if (matKhau === "") {
            showError("Mật khẩu không được để trống");
            return false;
        } else if (matKhau.length < 6) {
            showError("Mật khẩu phải có ít nhất 6 ký tự");
            return false;
        }
        if (xacNhanMatKhau === "") {
            showError("Xác nhận mật khẩu không được để trống");
            return false;
        } else if (xacNhanMatKhau !== matKhau) {
            showError("Mật khẩu và xác nhận mật khẩu không khớp");
            return false;
        }
        if (!termsCheckbox) {
            showError("Bạn phải đồng ý với các điều khoản và điều kiện");
            return false;
        }
        return true;
    }

    $('#them').on('click', (e) => {
        e.preventDefault();
        if (validateForm()) {
            let data = getDataFromForm();
            $.ajax({
                url: "/api/khach-hang/register",
                method: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify(data),
                success: (response) => {
                    window.location.href = '/login';
                    showSuccess("Đăng ký thành công")
                },
                error: (error) => {
                    showError(error.responseJSON.error);
                }
            });
        }
    });

    function getDataFromForm() {
        let dataFromForm = $("#formRegister").serializeArray();
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