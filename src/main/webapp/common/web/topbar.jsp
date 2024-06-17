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
            <form action="/search" method="get">
                <div class="input-group">
                    <input name="q" type="text" class="form-control" placeholder="Search for products"
                           id="input-search-product">
                    <div class="input-group-append" id="icon-search-product">
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
<input type="hidden" id="customer-id" value="<%=SecurityUtils.getPrincipal().getId()%>">

<!-- Topbar End -->
<script>
    $("a[href*=lang]").on("click", function () {
        var param = $(this).attr("href");
        $.ajax({
            url: "/trang-chu" + param,
            success: function () {
                location.reload();
            }
        });
        return false;
    })

    $('#input-search-product').on('keypress', (e) => {
        if (e.which === 13) {
            e.preventDefault();
            const search = $(e.target).val();
            $('#search-filter').val(search);
            window.location.href = '/search?q=' + search;
        }
    })


    $('#icon-search-product').on('click', (e) => {
        e.preventDefault();
        const search = $('#input-search-product').val();
        $('#search-filter').val(search);
        window.location.href = '/search?q=' + search;
    })

    let histories = [];
    let customerCodeWhenLogin = $('#customer-code').val();
    const customerIdWhenLogin = $('#customer-id').val();
    if (customerCodeWhenLogin !== "null") {
        $.ajax({
            url: '/api/khach-hang/histories?ma=' + customerCodeWhenLogin,
            dataType: "json",
            success: function (response) {
                $.each(response, function (index, item) {
                    let history = {
                        "value": item.timKiem
                    }
                    histories.push(history);
                })
                loadSuggestions(histories);
            },
            error: function (error) {
                console.log(error);
            }
        });

        function loadSuggestions(options) {
            $('#input-search-product').autocomplete({
                lookup: options,
                onSelect: function (suggestion) {
                    $('#input-search-product').val(suggestion.value)
                    //window.location = 'search?q=' + suggestion.value;
                }
            });
        }
    }

    $.ajax({
        url: "/api/gio-hang/" + customerCodeWhenLogin + "/ACTIVE",
        method: "GET",
        dataType: "json",
        success: (response) => {
            if(response === null){
                $('.quantity-cart').text(0);
            }else{
                const size = response.gioHang.length;
                $('.quantity-cart').text(size);
            }
        },
        error: (error) => {
        }
    });
</script>