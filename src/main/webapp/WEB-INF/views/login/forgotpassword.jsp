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
    <title>Forgot Password</title>

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
                        <!-- Form -->
                            <div class="text-center">
                                <div class="mb-5">
                                    <h1 class="display-4">Quên mật khẩu?</h1>
                                    <p>Nhập địa chỉ email bạn đã sử dụng khi tham gia và chúng tôi sẽ gửi cho bạn hướng dẫn để đặt lại mật khẩu.</p>
                                </div>
                            </div>

                            <!-- Form Group -->
                            <div class="js-form-message form-group">
                                <label class="input-label" for="email">Nhập địa chỉ email</label>

                                <input required
                                       type="email"
                                       id="email"
                                       name="email"
                                       placeholder="Nhập địa chỉ email" class="form-control form-control-lg">
                            </div>
                            <!-- End Form Group -->

                            <button  onclick="quenMatKhau()" class="btn btn-lg btn-block btn-primary">Gửi</button>

                            <div class="d-flex justify-content-between mt-2">
                                <a class="btn btn-link" href="/login">
                                    <i class="tio-chevron-left"></i> Quay lại đăng nhập
                                </a>
                                <a class="btn btn-link" href="/changePassword">
                                    <i class="tio-chevron-left"></i> Đổi mật khẩu
                                </a>
                            </div>
                        <!-- End Form -->
                    </div>
                </div>
                <!-- End Card -->

                <!-- Footer -->
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
                <!-- End Footer -->
            </div>
        </div>
    </div>
    <!-- End Content -->
</main>

<script>
    function quenMatKhau() {
        var email = $("#email").val();
        $.ajax({
            type: "POST",
            url: "/api/quenmatkhau",
            data: { email: email },
            success: function(response) {
                showSuccess("Mật khẩu tạm thời đã được gửi đến email của bạn.")
            },
            error: function(xhr) {
                showError("Không tìm thấy nhân viên với địa chỉ email này.");
            }
        });
    }
</script>
</body>
</html>
