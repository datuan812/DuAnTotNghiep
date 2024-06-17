<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Tìm kiếm sản phẩm</title>
</head>
<body>

<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 180px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3"><s:message code="web.navbar.product"/></h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href=""><s:message code="web.navbar.home"/></a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0"><s:message code="web.navbar.product"/></p>
        </div>
    </div>
</div>
<!-- Page Header End -->

<!-- Shop Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <!-- Shop Sidebar Start -->
        <div class="col-lg-3 col-md-12">
            <c:set var="priceFilter" value="not-filter" />
            <c:set var="brandFilter" value="not-filter" />
            <div id="filter">
                <div id="gia" class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4"><s:message code="web.product.price"/></h5>
                    <div>
                        <div class="mb-3">
                            <button value="0,100000" name="gia" class="btn btn-primary">Dưới 100.000đ</button>
                        </div>
                        <div class=" mb-3">
                            <button value="100000,200000" name="gia" class="btn btn-primary">100.000đ - 200.000đ</button>
                        </div>
                        <div class=" mb-3">
                            <button value="200000,500000" name="gia" class="btn btn-primary">200.000đ - 500.000đ</button>
                        </div>
                        <div class=" mb-3">
                            <button value="500000,1000000000" name="gia" class="btn btn-primary">Trên 500.000đ</button>
                        </div>
                    </div>
                </div>

                <div id="brands" class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">Lọc theo thương hiệu</h5>
                    <div>
                        <c:forEach items="${brandsProduct}" var="brand">
                            <div class="mb-3">
                                <button value="${brand.slug}" name="thuong-hieu" class="btn btn-primary">${brand.ten}</button>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <c:forEach items="${filterProduct}" var="filter">
                    <div id="${filter.ma}" class="border-bottom mb-4 pb-4">
                        <h5 class="font-weight-semi-bold mb-4">Lọc theo ${filter.ten}</h5>
                        <div>
                            <c:forEach items="${filter.giaTri}" var="giaTri" varStatus="loop">
                                <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                    <c:if test="${empty attributeChecked}">
                                        <input name="${filter.ma}" value="${giaTri}" type="checkbox" class="custom-control-input" id="${filter.ma}-${loop.count}">
                                        <label for="${filter.ma}-${loop.count}" class="custom-control-label">${giaTri}</label>
                                    </c:if>

                                    <c:if test="${not empty attributeChecked}">
                                        <c:set var="isChecked" value="false" />
                                        <c:set var="loopBreak" value="false" />

                                        <c:forEach items="${attributeChecked}" var="checked">
                                            <c:if test="${checked.key eq 'gia'}">
                                                <c:set var="priceFilter" value="${checked.value}" />
                                            </c:if>

                                            <c:if test="${checked.key eq 'thuong-hieu'}">
                                                <c:set var="brandFilter" value="${checked.value}" />
                                            </c:if>

                                            <c:forEach items="${f:split(checked.value, ',')}" var="val">
                                                <c:if test="${val == giaTri && checked.key == filter.ma && not loopBreak}">
                                                    <c:set var="isChecked" value="true" />
                                                    <c:set var="loopBreak" value="true" />
                                                </c:if>
                                            </c:forEach>
                                        </c:forEach>
                                        <input ${isChecked ? 'checked' : ''} name="${filter.ma}" value="${giaTri}" type="checkbox" class="custom-control-input" id="${filter.ma}-${loop.count}">
                                        <label for="${filter.ma}-${loop.count}" class="custom-control-label">${giaTri}</label>
                                    </c:if>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <input id="price-filter" type="hidden" name="gia" value="${priceFilter}">
            <input id="brand-filter" type="hidden" name="thuong-hieu" value="${brandFilter}">
        </div>
        <!-- Shop Sidebar End -->

        <!-- Shop Product Start -->
        <div class="col-lg-9 col-md-12">
            <div class="row pb-3">
                <form action="/search" method="GET" id="form-submit-product">
                    <div class="list-product row">
                        <c:if test="${empty mapProduct.data}">
                            <p>Không tìm thấy kết quả phù hợp</p>
                        </c:if>
                        <c:if test="${not empty mapProduct.data}">
                            <c:forEach var="item" items="${mapProduct.data}">
                                <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                                    <a href="/san-pham/${item.slug}" class="text-decoration-none ">
                                        <div class="card product-item border-0 mb-4 hovers">
                                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                                <img class="img-fluid w-100"
                                                     src="/repository/${item.anh[0].hinhAnh}" style="height:350px" alt="">
                                            </div>
                                            <div class="card-body border-left border-right border text-center p-0 pt-4 pb-3">
                                                <h6 class="text-truncate mb-3">${item.ten}</h6>
                                                <div class="d-flex justify-content-center">
                                                    <c:if test="${empty item.khuyenMaiHienThiResponse}">
                                                        <h4 class="text-danger product-price-custom-vnd ms-2">${item.giaBan}</h4>
                                                    </c:if>

                                                    <c:if test="${not empty item.khuyenMaiHienThiResponse}">
                                                        <c:if test="${item.khuyenMaiHienThiResponse.trangThai =='UPCOMING'}">
                                                            <h4 class="text-danger product-price-custom-vnd ms-2">${item.giaBan}</h4>
                                                        </c:if>
                                                        <c:if test="${item.khuyenMaiHienThiResponse.trangThai == 'ACTIVE'}">
                                                            <h6><del class="product-price-custom-vnd product-buy">${item.gia}</del></h6>
                                                            <h4 class="text-danger product-price-custom-vnd ms-2">${item.giaBan}</h4>
                                                        </c:if>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </c:if>

                    </div>
                    <div class="col-12 pb-1">
                        <ul class="pagination d-flex justify-content-center" id="pagination" ></ul>
                        <input type="hidden" value="" id="search-product" name="q"/>
                        <div class="value-server">

                        </div>
                        <input type="hidden" value="" id="page-product" name="page"/>
                        <input type="hidden" value="" id="limit-product" name="limit"/>
                    </div>
                </form>
            </div>
        </div>
        <!-- Shop Product End -->
    </div>
</div>
<!-- Shop End -->
<script>
    $('#form-submit-product')[0].scrollIntoView({ behavior: 'smooth' });
</script>
<script src="<c:url value='/template/web/paging/jquery.twbsPagination.js'/>"></script>
<script>
    const urlString = window.location.href;
    let paramString = urlString.split('?')[1];
    let queryString = new URLSearchParams(paramString);
    let param = queryString.get('q');
    $('#input-search-product').val(param);
    let pageCurrent = ${mapProduct.meta.pageCurrent};
    let totalPages = ${mapProduct.meta.totalPage};

    let limit = 9;
    $('#pagination').twbsPagination({
        totalPages: totalPages,
        visiblePages: 5,
        startPage: pageCurrent,
        onPageClick: function (event, page) {
            if (pageCurrent != page) {
                const priceFilter = $('#price-filter').val();
                const brandFilter = $('#brand-filter').val();
                filterAndPageable(page, limit, param, priceFilter, brandFilter);
            }
        }
    });
</script>
<script src="<c:url value='/assets/js/filter-web.js'/>"></script>
<script src="<c:url value='/assets/js/price-product-custom.js'/>"></script>
</body>
</html>