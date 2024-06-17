<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 10/18/2023
  Time: 4:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.laptrinhjavaweb.security.utils.SecurityUtils" %>
<html>
<head>
    <title>Profile</title>
</head>
<body>
<div class="content-body">
    <div class="container-fluid">

        <!-- row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="profile card card-body px-3 pt-3 pb-0">
                    <div class="profile-head">
                        <div class="photo-content">
                            <div class="cover-photo"></div>
                        </div>
                        <div class="profile-info">
                            <div class="profile-photo">
                                <img  src="/repository/<%=SecurityUtils.getPrincipal().getAnh()%>" id="anh" class="img-fluid rounded-circle" alt="">
                            </div>
                            <div class="profile-details">
                                <div class="profile-name px-3 pt-2">
                                    <h4 id="ten2" class="text-primary mb-0">Họ và tên</h4>
                                    <p id="chucvu">Chức vụ</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-4">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="profile-interest">
                                    <h5 class="text-cyan d-inline">Image</h5>
                                    <div class="row mt-4 sp4" id="lightgallery">
                                        <a href="/repository/<%=SecurityUtils.getPrincipal().getAnh()%>" data-exthumbimage="/repository/<%=SecurityUtils.getPrincipal().getAnh()%>" data-src="/repository/<%=SecurityUtils.getPrincipal().getAnh()%>" class="mb-1 col-lg-4 col-xl-4 col-sm-4 col-6">
                                            <img src="/repository/<%=SecurityUtils.getPrincipal().getAnh()%>" alt="" class="img-fluid">
                                        </a>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-8">
                <div class="card">
                    <div class="card-body">
                        <div class="profile-tab">
                            <div class="custom-tab-1">
                                <ul class="nav nav-tabs">

                                    <li class="nav-item"><a href="#about-me" data-toggle="tab" class="nav-link active">Thông tin cá nhân</a>
                                    </li>
                                    <li class="nav-item"><a href="#profile-settings" data-toggle="tab" class="nav-link">Cài đặt</a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div id="about-me" class="tab-pane fade active show">
<%--                                       --%>
<%--                                        <div class="profile-skills mb-5">--%>
<%--                                            <h4 class="text-cyan mb-2">Skills</h4>--%>
<%--                                            <a href="javascript:void(0);" class="btn btn-primary light btn-xs mb-1">Bán hàng</a>--%>
<%--                                            <a href="javascript:void(0);" class="btn btn-primary light btn-xs mb-1">Thu ngân</a>--%>
<%--                                        </div>--%>
                                        <div class="profile-personal-info">
                                            <h5 class="text-cyan mb-4"></h5>
                                            <div class="row mb-2">
                                                <div class="col-sm-3 col-5">
                                                    <h5 class="f-w-500">Username <span class="pull-right">:</span></h5>
                                                </div>
                                                <div class="col-sm-9 col-7"><span id="ma">abc</span>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-sm-3 col-5">
                                                    <h5 class="f-w-500">Họ và tên <span class="pull-right">:</span>
                                                    </h5>
                                                </div>
                                                <div class="col-sm-9 col-7"><span id="ten1">Mitchell C.Shay</span>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-sm-3 col-5">
                                                    <h5 class="f-w-500">Email <span class="pull-right">:</span>
                                                    </h5>
                                                </div>
                                                <div class="col-sm-9 col-7"><span id="email1"></span>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-sm-3 col-5">
                                                    <h5 class="f-w-500">Ngày sinh <span class="pull-right">:</span>
                                                    </h5>
                                                </div>
                                                <div class="col-sm-9 col-7"><span id="ngaysinh">01-01-2001</span>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-sm-3 col-5">
                                                    <h5 class="f-w-500">Số điện thoại<span class="pull-right">:</span></h5>
                                                </div>
                                                <div class="col-sm-9 col-7"><span id="sdt">0987654321</span>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-sm-3 col-5">
                                                    <h5 class="f-w-500">Địa chỉ <span class="pull-right">:</span></h5>
                                                </div>
                                                <div class="col-sm-9 col-7"><span id="diachi">Hà Nội</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="profile-settings" class="tab-pane fade">
                                        <div class="pt-3">
                                            <div class="settings-form">
<%--                                                <h4 class="text-cyan">Account Setting</h4>--%>
                                                <form action="" id="form-submit-nhan-vien">
                                                    <div class="form-row">
                                                        <div class="form-group col-md-6">
                                                            <label>Username</label>
                                                            <p style="color: #3AB54B" id="username" name="ma">
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label>Họ và tên</label>
                                                            <input type="text" placeholder="Name" id="ten" name="ten" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="form-group col-md-6">
                                                            <label>Email</label>
                                                            <input type="email" placeholder="Email" id="email" name="email" class="form-control">
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label>Số điện thoại</label>
                                                            <input type="text" placeholder="Phone number" id="soDienThoai" name="soDienThoai" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Số CCCD</label>
                                                        <input type="text" placeholder="Citizen card" id="canCuocCongDan" name="canCuocCongDan" class="form-control">
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="form-group col-md-6">
                                                            <label>Ngày sinh</label>
                                                            <input type="date" id="ngaySinh" name="ngaySinh" class="form-control">
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label>Ngày cấp</label>
                                                            <input type="date" id="ngayCap" name="ngayCap" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Địa chỉ</label>
                                                        <input type="text" placeholder="Address" id="diaChi" name="diaChi" class="form-control">
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-12 col-sm-12">
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox" id="changePasswordCheckbox">
                                                                <label class="form-check-label" for="changePasswordCheckbox">
                                                                    Đổi mật khẩu
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="passwordFields" style="display: none;">
                                                        <div class="form-group">
                                                            <label>Mật khẩu</label>
                                                            <input type="password" id="matKhau" name="matKhau" placeholder="Password" class="form-control">
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Nhập lại mật khẩu</label>
                                                            <input type="password"  id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" class="form-control">
                                                        </div>
                                                    </div>

                                                    <button class="btn" id="updateButton" style="background-color: #A6edab; color: #00852d">Xác nhận</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script >
    //checkbox change password
    const changePasswordCheckbox = document.getElementById("changePasswordCheckbox");
    const passwordFields = document.getElementById("passwordFields");

    changePasswordCheckbox.addEventListener("change", function () {
        if (changePasswordCheckbox.checked) {
            passwordFields.style.display = "block";
        } else {
            passwordFields.style.display = "none";
        }
    });

    moment.locale('vn');
    var options = {
        month: 'numeric', day: 'numeric', year: 'numeric',
    };

    $.ajax({
        url: '/api/nhan-vien/' + ma,
        method: 'GET',
        dataType: 'json',
        success: function (req) {
           console.log(req);
            $('#ma').text(req.ma);
            $('#email1').text(req.email);
            $('#ten2').text(req.ten);
            $('#ten1').text(req.ten);
            $('#chucvu').text(req.chucVu.ten);
            $('#ngaysinh').text(formatDateInput(req.ngaySinh));
            $('#sdt').text(req.soDienThoai);
            $('#address').text(req.diaChi);
            $('#username').text(req.ma);
            $('#ten').val(req.ten);
            $('#email').val(req.email);
            $('#soDienThoai').val(req.soDienThoai);
            var date = new Date(req.ngaySinh);
            $('#ngaySinh').val(moment(date).format('YYYY-MM-DD'));
            $('#diaChi').val(req.diaChi);
            $('#canCuocCongDan').val(req.canCuocCongDan);
            var ngayCap = new Date(req.ngayCap);
            $('#ngayCap').val(moment(ngayCap).format('YYYY-MM-DD'));
        },
        error: function (xhr, status, error) {
            console.log(error);
        }
    });


    $('#updateButton').on('click', (e) => {
        e.preventDefault();
        let data = getDataFromForm();
        $.ajax({
            url: "/api/nhan-vien/" + ma,
            method: "PUT",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: JSON.stringify(data),
            success: (response) => {
                console.log("success");
                showSuccess("Cập nhật thành công!")
            },
            error: (error) => {
                showError("Cập nhật thất bại!")
            }
        });
    });


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
