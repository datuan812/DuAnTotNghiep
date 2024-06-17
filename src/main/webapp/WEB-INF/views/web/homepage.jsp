<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@include file="/common/taglib.jsp" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Trang chủ</title>
</head>
<body>
    <div class="container-fluid pt-5">
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0"><s:message code="web.homepage.qualityProduct"/></h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                    <h5 class="font-weight-semi-bold m-0"><s:message code="web.homepage.freeship"/></h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0"><s:message code="web.homepage.DayReturn"/></h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0"><s:message code="web.homepage.support"/></h5>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid py-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Sản phẩm mới</span></h2>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="owl-carousel related-carousel">
                    <c:forEach items="${productNew}" var="item">
                        <a href="/san-pham/${item.slug}" class="text-decoration-none">
                            <div class="card product-item border-0 hovers">
                                <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                    <img class="img-fluid w-100" src="/repository/${item.anh[0].hinhAnh}" style="height:350px" alt="">
                                </div>
                                <div class="card-body border border-left border-right text-center p-0 pt-4 pb-3">
                                    <h6 class="text-truncate mb-3">${item.ten}</h6>
                                    <div class="d-flex justify-content-center">
                                        <c:if test="${empty item.khuyenMaiHienThiResponse}">
                                            <h4 class="text-danger product-price-custom-vnd ms-2">${item.giaBan}</h4>
                                        </c:if>

                                        <c:if test="${not empty item.khuyenMaiHienThiResponse}">
                                            <c:if test="${item.khuyenMaiHienThiResponse.trangThai =='UPCOMING'}">
                                                <h4 class="text-danger product-price-custom-vnd ms-2">${item.gia}</h4>
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
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <!-- Offer Start -->
    <div class="container-fluid offer pt-5">
        <div class="row px-xl-5">
            <div class="col-md-6 pb-4">
                <div class="position-relative bg-secondary text-center text-md-right text-white mb-2 py-5 px-5">
                    <img src="<c:url value='/template/web/img/offer-1.png'/>" alt="">
                    <div class="position-relative" style="z-index: 1;">
                        <h5 class="text-uppercase text-primary mb-3"><s:message code="web.homepage.discount"/></h5>
                        <h1 class="mb-4 font-weight-semi-bold"><s:message code="web.homepage.textBanner1"/></h1>
                        <a href="" class="btn btn-outline-primary py-md-2 px-md-3"><s:message code="web.homepage.shopNow"/></a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 pb-4">
                <div class="position-relative bg-secondary text-center text-md-left text-white mb-2 py-5 px-5">
                    <img src="<c:url value='/template/web/img/offer-2.png'/>" alt="">
                    <div class="position-relative" style="z-index: 1;">
                        <h5 class="text-uppercase text-primary mb-3"><s:message code="web.homepage.discount"/></h5>
                        <h1 class="mb-4 font-weight-semi-bold"><s:message code="web.homepage.textBanner2"/></h1>
                        <a href="" class="btn btn-outline-primary py-md-2 px-md-3"><s:message code="web.homepage.shopNow"/></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid py-5">
        <div class="row px-xl-5">
            <div class="col">
                <div class="owl-carousel vendor-carousel">
                    <div class="vendor-item border p-4">
                        <img src="<c:url value='/template/web/img/vendor-2.jpg'/>" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="<c:url value='/template/web/img/vendor-2.jpg'/>" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="<c:url value='/template/web/img/vendor-3.jpg'/>" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="<c:url value='/template/web/img/vendor-4.jpg'/>" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="<c:url value='/template/web/img/vendor-5.jpg'/>" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="<c:url value='/template/web/img/vendor-6.jpg'/>" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="<c:url value='/template/web/img/vendor-7.jpg'/>" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="<c:url value='/template/web/img/vendor-8.jpg'/>" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Vendor End -->

    <!-- Products Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <%--            <h2 class="section-title px-5"><span class="px-2"><s:message code="web.homepage.bestSaler"/></span></h2>--%>
            <h2 class="section-title px-5"><span class="px-2">Sản phẩm khuyến mại</span></h2>
        </div>
        <div class="row px-xl-5 pb-3" id="product-home-page-discount">
        </div>

        <div class="d-flex justify-content-center">
            <button class="btn btn-primary" id="load-more-product-discount"><s:message code="web.homepage.loadMore"/></button>
        </div>
    </div>
    <!-- Products End -->

    <!-- Products Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
<%--            <h2 class="section-title px-5"><span class="px-2"><s:message code="web.homepage.bestSaler"/></span></h2>--%>
                <h2 class="section-title px-5"><span class="px-2"><s:message code="web.homepage.SuggestionToday"/></span></h2>
        </div>
        <div class="row px-xl-5 pb-3" id="product-home-page">
        </div>

        <div class="d-flex justify-content-center">
            <button class="btn btn-primary" id="load-more-product"><s:message code="web.homepage.loadMore"/></button>
        </div>
    </div>
    <!-- Products End -->
    <script src="<c:url value='/assets/js/price-product-custom.js'/>"></script>
    <script src="<c:url value='/assets/api/web/home-page.js'/>"></script>
</body>
</html>
