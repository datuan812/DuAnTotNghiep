<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Login</title>
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
    <c:if test="${param.incorrectAccount != null}">
        <script>
            showError(" Tài khoản không hợp lệ. Xin kiểm tra lại")
        </script>
    </c:if>
    <c:if test="${param.sessionTimeout != null}">
        <script>
            showError(" Phiên làm việc hết hạn, yêu cầu đăng nhập lại!")
        </script>
    </c:if>
    <c:if test="${param.is_not_login != null}">
        <script>
            showError("Vui lòng đăng nhập tài khoản của bạn")
        </script>
    </c:if>
    <c:if test="${param.is_logout != null}">
        <script>
            showSuccess("Đăng xuất thành công");
        </script>
    </c:if>

    <div class="container py-5 py-sm-7">


        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-5">
                <!-- Card -->
                <div class="card card-lg mb-5">
                    <div class="card-body">
                        <!-- Form -->
                        <form action="j_spring_security_check" method="POST" class="js-validate">
                            <div class="text-center">
                                <div class="mb-5">
                                    <h1 class="display-4">Đăng nhập</h1>
                                    <p>Vẫn chưa có tài khoản? <a href="/register">Đăng ký tại đây</a></p>
                                </div>
                                <span class="divider text-muted mb-4">Hoặc</span>
                            </div>

                            <!-- Form Group -->
                            <div class="js-form-message form-group">
                                <label class="input-label" for="signinSrEmail"> Nhập Email/Số điện thoại</label>

                                <input type="text" class="form-control form-control-lg" value=""
                                       name="j_username" id="signinSrEmail" placeholder="" >
                            </div>
                            <!-- End Form Group -->

                            <!-- Form Group -->
                            <div class="js-form-message form-group">
                                <label class="input-label" for="signupSrPassword" tabindex="0">
                        <span class="d-flex justify-content-between align-items-center">
                          Mật khẩu
                          <a class="input-label-secondary" href="/forgotpassword">Quên mật khẩu?</a>
                        </span>
                                </label>

                                <div class="input-group input-group-merge">
                                    <input type="password" class="js-toggle-password form-control form-control-lg" name="j_password" id="signupSrPassword" placeholder="*************" value="">
                                </div>
                            </div>
                            <!-- End Form Group -->

                            <button type="submit" class="btn btn-lg btn-block btn-primary">Đăng nhập</button>
                        </form>
                        <!-- End Form -->
                    </div>
                </div>
                <!-- End Card -->

                <!-- Footer -->
                <div class="text-center">
                    <small class="text-cap mb-4"><a href="/trang-chu" class="text-decoration-none">Bỏ qua</a></small>
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
</body>
</html>