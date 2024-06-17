<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.laptrinhjavaweb.security.utils.SecurityUtils" %>
<!-- Topbar Start -->
<div class="container-fluid">
    <div class="row align-items-center py-3 px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a href="/trang-chu" class="text-decoration-none">
                <h1 class="m-0 display-5 font-weight-semi-bold"><span
                        class="text-primary font-weight-bold border px-3 mr-1">K.O.C</span>SHOP</h1>
            </a>
        </div>

        <div class="col-lg-6 col-6 text-left">
            <form action="">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for products">
                    <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"></i>
                            </span>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-lg-3 col-6 text-right">
            <a href="?lang=vi" class="btn border"><img src="/template/web/img/vietnam.jpg" style="width: 30px"
                                                       alt=""></a>
            <a href="?lang=en" class="btn border"><img src="/template/web/img/my.jpg" style="width: 30px" alt=""></a>
            <a href="/cart" class="btn border">
                <i class="fas fa-shopping-cart text-primary"></i>
                <span class="quantity-cart">0</span>
            </a>
        </div>
    </div>
</div>
<input type="hidden" id="customer-code" value="<%=SecurityUtils.getPrincipal().getMa()%>">
<input class="ma-chuc-vu" type="hidden" value="<%=SecurityUtils.getPrincipal().getMaChucVu()%>">
<input type="hidden" id="customer-id" value="<%=SecurityUtils.getPrincipal().getId()%>">
<!-- Topbar End -->
<script>
    const customerCodeWhenLogin = $('#customer-code').val();
    $.ajax({
        url: "/api/gio-hang/" + customerCodeWhenLogin + "/ACTIVE",
        method: "GET",
        dataType: "json",
        success: (response) => {
            if (response === null) {
                $('.quantity-cart').text(0);
            } else {
                const size = response.gioHang.length;
                $('.quantity-cart').text(size);
            }
        },
        error: (error) => {
        }
    });
</script>