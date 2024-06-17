<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 11/19/2023
  Time: 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page import="com.laptrinhjavaweb.security.utils.SecurityUtils" %>
<html>
<head>
    <title>Đổi mật khẩu</title>
</head>
<body>
<div class="khung">
    <span style="font-size: 25px"><s:message code="web.ttweb.changPass"/></span>
    <hr>
    <form id="form-changePass">
    <div class="row">
        <div class="col-8" style="border-right: 2px solid #dedede">
            <input type="hidden" id="ma" name="ma" value="<%=SecurityUtils.getPrincipal().getMa()%>" >
            <div class="row mb-3">
                <div class="col-12 col-sm-3 text-start text-sm-end">
                    <label>
                        <span class="text-danger me-1">*</span>
                        <span><s:message code="web.ttweb.OldPass"/>:</span>
                    </label>
                </div>
                <div class="col-12 col-sm-7">
                    <input type="password" placeholder="Mật khẩu cũ:" id="matKhau" name="matKhau" class="form-control"/>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-12 col-sm-3 text-start text-sm-end">
                    <label>
                        <span class="text-danger me-1">*</span>
                        <span><s:message code="web.ttweb.NewPass"/>:</span>
                    </label>
                </div>
                <div class="col-12 col-sm-7">
                    <input type="password" placeholder="Mật khẩu mới:" id="matKhauMoi" name="matKhauMoi" class="form-control"/>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-12 col-sm-3 text-start text-sm-end">
                    <label>
                        <span class="text-danger me-1">*</span>
                        <span><s:message code="web.ttweb.ConfirmPass"/>:</span>
                    </label>
                </div>
                <div class="col-12 col-sm-7">
                    <input type="password" placeholder="Xác nhận mật khẩu:" id="xacNhanMatKhau" name="xacNhanMatKhau" class="form-control"/>
                </div>
            </div>
        </div>
        <div class="col-4 text-center mt-5">
        </div>
    </div>
    <div style="margin-left: 170px" >
        <button type="button" id="changePass" class="btn" style="background-color: #EFCACA;color: #BF0000;"  ><s:message code="web.ttweb.submit"/></button>
    </div>
    </form>
</div>


<script>
    function validateForm() {
        let matKhau = $("#matKhau").val();
        let matKhauMoi = $("#matKhauMoi").val();
        let xacNhanMatKhau = $("#xacNhanMatKhau").val();


        if (matKhau === "") {
            showError("Mật khẩu không được để trống");
            return false;
        }
        if (matKhauMoi === "") {
            showError("Mật khẩu mới không được để trống");
            return false;
        } else if (matKhauMoi.length < 6) {
            showError("Mật khẩu phải có ít nhất 6 ký tự");
            return false;
        }
        if (xacNhanMatKhau === "") {
            showError("Xác nhận mật khẩu không được để trống");
            return false;
        } else if (xacNhanMatKhau !== matKhauMoi) {
            showError("Mật khẩu mới và xác nhận mật khẩu không khớp");
            return false;
        }

        return true;
    }

    $('#changePass').on('click', (e) => {
        e.preventDefault();
        if (validateForm()) {
            let data = getDataFromForm();
            $.ajax({
                url: "/api/khach-hang/doi-mat-khau" ,
                method: "PUT",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify(data),
                success: (response) => {
                    window.location.href = '/doi-mat-khau';
                    showSuccess("Đổi mật khẩu thành công")
                },
                error: (error) => {
                    showError(error.responseJSON.error)
                }
            });
        }
    });

    function getDataFromForm() {
        let dataFromForm = $("#form-changePass").serializeArray();
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
