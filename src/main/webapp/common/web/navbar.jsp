<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.laptrinhjavaweb.security.utils.SecurityUtils" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@include file="/common/taglib.jsp" %>
<!-- Navbar Start -->
<div class="container-fluid">
    <div class="row border-top px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <span class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                <h6 class="m-0">Danh mục sản phẩm</h6>
                <i class="fa fa-angle-down text-dark"></i>
            </span>
            <nav class="collapse show navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0" id="navbar-vertical">
                <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
                    <c:forEach items="${categoriesProduct}" var="item">
                        <a href="/danh-muc/${item.slug}" class="nav-item nav-link">${item.ten}</a>
                    </c:forEach>
                </div>
            </nav>
        </div>
        <div class="col-lg-9">
            <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                <a href="" class="text-decoration-none d-block d-lg-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <a href="/trang-chu" class="nav-item nav-link"><s:message code="web.navbar.home"/></a>
                        <a href="/danh-sach-san-pham" class="nav-item nav-link"><s:message code="web.navbar.product"/></a>
                        <a href="/shop_us" class="nav-item nav-link"><s:message code="web.navbar.shopus"/></a>
                        <a href="/faqs" class="nav-item nav-link"><s:message code="web.navbar.FAQs"/></a>
                        <a href="/contact" class="nav-item nav-link"><s:message code="web.navbar.Contact"/></a>
                    </div>
                    <div class="navbar-nav ml-auto py-0">
                        <security:authorize access="hasAnyRole('ADMIN', 'STAFF', 'CUSTOMER')">
                            <div class="btn-group">
                                <button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                    <s:message code="web.navbar.hello"/>, <%=SecurityUtils.getPrincipal().getTen()%>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="/web/account"><s:message code="web.ttweb.account"/></a></li>
                                    <li><a class="dropdown-item" href="/web/all"><s:message code="web.ttweb.purchaseOrder"/></a></li>
                                    <li><a class="dropdown-item" href="doi-mat-khau"><s:message code="web.ttweb.changPass"/></a></li>
                                    <li><a class="dropdown-item" href="/logout" ><s:message code="web.navbar.logout"/></a></li>
                                </ul>
                            </div>
                        </security:authorize>
                        <security:authorize access="hasRole('ANONYMOUS')">
                            <a href="/login" class="nav-item nav-link"><s:message code="web.navbar.login"/></a>
                            <a href="/register" class="nav-item nav-link"><s:message code="web.navbar.register"/></a>
                        </security:authorize>
                    </div>
                </div>
            </nav>
            <div id="header-carousel" class="carousel slide" data-ride="carousel">

                <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                    <div class="btn btn-dark" style="width: 45px; height: 45px;">
                        <span class="carousel-control-prev-icon mb-n2"></span>
                    </div>
                </a>
                <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                    <div class="btn btn-dark" style="width: 45px; height: 45px;">
                        <span class="carousel-control-next-icon mb-n2"></span>
                    </div>
                </a>
            </div>

        </div>
    </div>
</div>
<!-- Navbar End -->

<script>
    document.addEventListener("DOMContentLoaded", function () {
        var currentPath = window.location.pathname;
        var links = document.querySelectorAll('.navbar-nav a');

        links.forEach(function (link) {
            if (link.getAttribute('href') === currentPath) {
                link.classList.add('active');
            }
        });
    });


    $.ajax({
        url: '/api/slider' ,
        method: 'GET',
        dataType: 'json',
        success: function (response) {
            let html = '<div class="carousel-inner">';
            $.each(response.data, (index, item) => {
                let image = item.image;
                html += `<div class="carousel-item active" style="height: 410px;">
                            <img class="img-fluid" src="/repository/\${image}" alt="Image">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                                    <h3 class="display-4 text-white font-weight-semi-bold mb-4">Fashionable Dress</h3>
                                    <a href="" class="btn btn-light py-2 px-3">Shop Now</a>
                                </div>
                            </div>
                        </div>`;
            });
            html += `</div> `;

            $('#header-carousel').append(html);
        },
        error: function(xhr, status, error) {
            console.log('Có lỗi xảy ra: ' + error);
        }
    });


</script>