<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 11/12/2023
  Time: 9:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Password</title>
</head>
<body>
<main id="content" role="main" class="main">
    <div class="position-fixed top-0 right-0 left-0 bg-img-hero" style="height: 32rem; background-image: url(/template/login/img/bgr.jpg);">
        <!-- SVG Bottom Shape -->
        <figure class="position-absolute right-0 bottom-0 left-0">
            <svg preserveaspectratio="none" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" viewbox="0 0 1921 273">
                <polygon fill="#fff" points="0,273 1921,273 1921,0 "></polygon>
            </svg>
        </figure>
        <!-- End SVG Bottom Shape -->
    </div>

    <!-- Content -->
    <div class="container py-5 py-sm-7">
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-5">
                <!-- Card -->
                <div class="card card-lg mb-5">
                    <div class="card-body">
                        <div class="text-center">
                            <div class="mb-5">
                                <h1 class="display-4">Đổi mật khẩu?</h1>
                                <p>Nhập mã bạn được cung cấp để thay đổi mật khẩu.</p>
                                <p>Mã có giá trị trong 5 phút</p>
                            </div>
                        </div>

                        <!-- Form Group -->
                        <div class="js-form-message form-group">
                            <label class="input-label">Mã code:</label>
                            <input required type="text" id="restToken" placeholder="Mã code" class="form-control form-control-lg"/>
                            <label class="input- mt-3">Mật khẩu mới</label>
                            <input required type="password" id="matKhau" placeholder="Mật khẩu mới" class="form-control form-control-lg"/>
                        </div>
                        <!-- End Form Group -->

                        <button onclick="restPassword()" class="btn btn-lg btn-block btn-primary">Xác nhận</button>
                    </div>
                </div>
                <div class="text-center">
                    <small class="text-cap mb-4"><a href="/login" class="text-decoration-none">Trở lại</a></small>
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
    <!-- End Content -->
</main>

<script>
    function restPassword() {
        var restToken = $("#restToken").val();
        var matKhau = $("#matKhau").val();

        if (!restToken || !matKhau) {
            showError("Vui lòng điền đầy đủ mọi thông tin !");
            return;
        }
        $.ajax({
            url: "/api/resetPasswordByToken",
            type: "POST",
            data: {
                restToken: restToken,
                matKhau: matKhau
            },
            success: function(response) {
                showSuccess("Đổi mật khẩu thành công!");
                window.location.href = '/login';
            },
            error: function(xhr, textStatus, error) {
                showError(xhr.responseJSON.error);
            }
        });
    }

</script>
</body>
</html>