<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.laptrinhjavaweb.security.utils.SecurityUtils" %>
<%@include file="/common/taglib.jsp" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<!--**********************************
      Sidebar start
  ***********************************-->
<div class="deznav">
    <div class="deznav-scroll">
        <div class="main-profile">
            <div class="image-bx">
                <img src="/repository/<%=SecurityUtils.getPrincipal().getAnh()%>" alt="">
<%--                <a href="javascript:void(0);"><i class="fa fa-cog" aria-hidden="true"></i></a>--%>
            </div>
            <h5 class="name"><span class="font-w400">Hello,</span><%=SecurityUtils.getPrincipal().getTen()%></h5>
        </div>
        <ul class="metismenu" id="menu">
            <li class="nav-label first">Main Menu</li>

            <li>
                    <a class="has-arrow" href="/admin/dashboards" aria-expanded="false">
                        <i class="flaticon-144-layout"></i>
                        <span class="nav-text">Dashboard</span>
                    </a>
            </li>
            <li>
                    <a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
                        <i class="flaticon-061-puzzle"></i>
                        <span class="nav-text">Quản lý</span>
                    </a>
                <ul aria-expanded="false">
                    <li><a href="/admin/nhan-vien">Nhân viên</a></li>
                    <li><a href="/admin/khach-hang">Khách hàng</a></li>
                    <li><a href="/admin/danh-muc">Danh mục</a></li>
                    <li><a href="/admin/thuong-hieu">Thương hiệu</a></li>
                    <li><a href="/admin/san-pham">Sản phẩm</a></li>
                    <li><a href="/admin/khuyen-mai">Khuyến mãi</a></li>
                    <li><a href="/admin/slider">Slider</a></li>
                </ul>
            </li>
            <li>
                    <a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
                        <i class="flaticon-044-file"></i>
                        <span class="nav-text">Giao dịch</span>
                    </a>
                <ul aria-expanded="false">
                    <li><a href="/admin/giao-dich/hoa-don">Hóa đơn</a></li>
                </ul>
            </li>
            <li>
                <a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
                    <i class="flaticon-381-settings-2"></i>
                    <span class="nav-text">Setting</span>
                </a>
                <ul aria-expanded="false">
                    <li><a href="/admin/setting/profile">Profile</a></li>
                    <li><a href="/admin/setting/tich-diem">Tích điểm</a></li>
                </ul>
            </li>
        </ul>
        <div class="copyright">
            <p><strong>KOC Admin Dashboard</strong> © 2023 All Rights Reserved</p>
            <p class="fs-12">Made with <span class="heart"></span> by KOC Teams</p>
        </div>
    </div>
</div>
<!--**********************************
    Sidebar end
***********************************-->
<input class="ma-chuc-vu" type="hidden" value="<%=SecurityUtils.getPrincipal().getMaChucVu()%>">
<script>
    const ma = $('.user-name-login').text();
    const role = $('.ma-chuc-vu').val();
    if(role === "STAFF"){
        const html = `<li class="nav-label first">Main Menu</li>
                        <li>
                            <a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
                                <i class="flaticon-044-file"></i>
                                <span class="nav-text">Giao dịch</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="/admin/giao-dich/hoa-don">Hóa đơn</a></li>
                            </ul>
                        </li>

                        <li>
                            <a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
                                <i class="flaticon-381-settings-2"></i>
                                <span class="nav-text">Setting</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="/admin/setting/profile">Profile</a></li>
                                <li><a href="/admin/setting/tich-diem">Tích điểm</a></li>
                            </ul>
                        </li>`;
        $('#menu').html(html);
    }else if(role === "ADMIN"){
        const html = `  <li class="nav-label first">Main Menu</li>
                        <li>
                                <a class="has-arrow" href="/admin/dashboards" aria-expanded="false">
                                    <i class="flaticon-144-layout"></i>
                                    <span class="nav-text">Dashboard</span>
                                </a>
                        </li>
                        <li>
                                <a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
                                    <i class="flaticon-061-puzzle"></i>
                                    <span class="nav-text">Quản lý</span>
                                </a>
                            <ul aria-expanded="false">
                                <li><a href="/admin/nhan-vien">Nhân viên</a></li>
                                <li><a href="/admin/khach-hang">Khách hàng</a></li>
                                <li><a href="/admin/danh-muc">Danh mục</a></li>
                                <li><a href="/admin/thuong-hieu">Thương hiệu</a></li>
                                <li><a href="/admin/san-pham">Sản phẩm</a></li>
                                <li><a href="/admin/khuyen-mai">Khuyến mại</a></li>
                                <li><a href="/admin/slider">Slider</a></li>
                            </ul>
                        </li>
                        <li>
                                <a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
                                    <i class="flaticon-044-file"></i>
                                    <span class="nav-text">Giao dịch</span>
                                </a>
                            <ul aria-expanded="false">
                                <li><a href="/admin/giao-dich/hoa-don">Hóa đơn</a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
                                <i class="flaticon-381-settings-2"></i>
                                <span class="nav-text">Setting</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="/admin/setting/profile">Profile</a></li>
                                <li><a href="/admin/setting/tich-diem">Tích điểm</a></li>
                            </ul>
                        </li>`;
        $('#menu').html(html);
    }

</script>
</body>
</html>