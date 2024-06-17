<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<div class="khung">
    <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-4">
            <img src="/template/web/img/avatar.jpeg" width="80px" style="border-radius: 50%" alt="">
        </div>
        <div class="col-lg-8 col-md-8 col-sm-8 my-3" >
            <h5><%=SecurityUtils.getPrincipal().getTen()%></h5>
            <a href="/web/account" class="text-decoration-none"><i class="bi bi-pencil-fill"></i> Sửa hồ sơ</a>
        </div>
    </div>
    <hr>
    <div class="row ms-4">
        <div class="nav flex-column ">
            <a href="/web/account" class="text-decoration-none a mb-3" style="font-size: 18px"><i class="bi bi-person-circle me-2"></i> <s:message code="web.ttweb.account"/></a>
            <a href="/web/all" class="text-decoration-none a mb-3" style="font-size: 18px"><i class="bi bi-card-checklist me-2"></i> <s:message code="web.ttweb.purchaseOrder"/></a>
            <a href="/vi-dien-tu" class="text-decoration-none a mb-3 " style="font-size: 18px"><i class="bi bi-wallet2 me-2"></i> <s:message code="web.ttweb.ElectronicWallet"/></a>
            <a href="/thong-tin-tich-diem" class="text-decoration-none a mb-3" style="font-size: 18px"><i class="bi bi-piggy-bank me-2"></i> <s:message code="web.ttweb.point"/></a>
            <a href="/doi-mat-khau" class="text-decoration-none a mb-3" style="font-size: 18px"><i class="bi bi-key me-2"></i> <s:message code="web.ttweb.changPass"/></a>
            <a href="/logout" class="text-decoration-none a " style="font-size: 18px"><i class="bi bi-box-arrow-left me-2"></i> <s:message code="web.navbar.logout"/></a>

        </div>
    </div>
</div>