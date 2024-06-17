<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!-- Footer Start -->
<div class="container-fluid bg-secondary text-dark mt-5 pt-5">
    <div class="row px-xl-5 pt-5">
        <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
            <a href="" class="text-decoration-none">
                <h1 class="mb-4 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border border-white px-3 mr-1">K.O.C</span>SHOP</h1>
            </a>
            <h5 class=" font-weight-semi-bold mb-4"><s:message code="web.footer.thongtin1"/></h5>
            <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i><s:message code="web.footer.thongtin6"/></p>
            <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>KOC2003@gmail.com</p>
            <p class="mb-2"><i class="fa fa-phone-alt text-primary mr-3"></i>+84 987654321</p>
        </div>
        <div class="col-lg-8 col-md-12">
            <div class="row">
                <div class="col-md-4 mb-5">
                    <h5 class="font-weight-bold text-dark mb-4"><s:message code="web.footer.thongtin2"/></h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-dark mb-2" href="/trang-chu"><i class="fa fa-angle-right mr-2"></i><s:message code="web.navbar.home"/></a>
                        <a class="text-dark mb-2" href="/shop_us"><i class="fa fa-angle-right mr-2"></i><s:message code="web.navbar.shopus"/></a>
                        <a class="text-dark mb-2" href="/danh-sach-san-pham"><i class="fa fa-angle-right mr-2"></i><s:message code="web.navbar.product"/></a>
                        <a class="text-dark mb-2" href="/cart"><i class="fa fa-angle-right mr-2"></i><s:message code="web.navbar.cart"/></a>
                        <a class="text-dark mb-2" href="/faqs"><i class="fa fa-angle-right mr-2"></i><s:message code="web.navbar.FAQs"/></a>
                        <a class="text-dark" href="/contact"><i class="fa fa-angle-right mr-2"></i><s:message code="web.navbar.Contact"/></a>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <h5 class="font-weight-bold text-dark mb-4"><s:message code="web.footer.thongtin3"/></h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-dark mb-2" href="/danh-muc/ao-thun"><i class="fa fa-angle-right mr-2"></i><s:message code="web.footer.thongtin7"/></a>
                        <a class="text-dark mb-2" href="/danh-muc/ao-so-mi"><i class="fa fa-angle-right mr-2"></i><s:message code="web.footer.thongtin8"/></a>
                        <a class="text-dark mb-2" href="/danh-muc/ao-polo"><i class="fa fa-angle-right mr-2"></i><s:message code="web.footer.thongtin9"/></a>
                        <a class="text-dark mb-2" href="/danh-muc/quan-kaki"><i class="fa fa-angle-right mr-2"></i><s:message code="web.footer.thongtin10"/></a>
                        <a class="text-dark mb-2" href="/danh-muc/quan-jeans"><i class="fa fa-angle-right mr-2"></i><s:message code="web.footer.thongtin11"/></a>
                        <a class="text-dark" href="/danh-muc/quan-dai-quan-au"><i class="fa fa-angle-right mr-2"></i><s:message code="web.footer.thongtin12"/></a>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <h5 class="font-weight-bold text-dark mb-4"><s:message code="web.footer.thongtin4"/></h5>
                    <form action="">
                        <div class="form-group">
                            <input type="text" class="form-control border-0 py-4" placeholder="Your Name" required="required" />
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control border-0 py-4" placeholder="Your Email"
                                   required="required" />
                        </div>
                        <div>
                            <button class="btn btn-primary btn-block border-0 py-3" type="submit"><s:message code="web.footer.thongtin5"/></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="row border-top border-light mx-xl-5 py-4">
        <div class="col-md-6 px-xl-0">
            <p class="mb-md-0 text-center text-md-left text-dark">
                &copy; <a class="text-dark font-weight-semi-bold" href="#">2023 POLYTECHNIC</a>
                <s:message code="web.footer.thongtin14"/>
            </p>
        </div>
        <div class="col-md-6 px-xl-0 text-center text-md-right">
            <img class="img-fluid" src="<c:url value='/template/web/img/payments.png'/>" alt="">
        </div>
    </div>
</div>
<!-- Footer End -->


<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>