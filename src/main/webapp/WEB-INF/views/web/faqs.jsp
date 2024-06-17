<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<html>
<head>
    <title>FAQs</title>
</head>
<body>
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 180px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3"><s:message code="web.navbar.FAQs"/></h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href=""><s:message code="web.navbar.home"/></a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0"><s:message code="web.navbar.FAQs"/></p>
        </div>
    </div>
</div>
<div class="container-fluid pt-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2"><s:message code="web.faqs.thongtin1"/></span></h2>
    </div>
    <div class="row px-xl-5">
        <div class="col-12 pb-1">
            <div class="d-flex align-items-center justify-content-between mb-4">
                <form action="">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search by name">
                        <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"></i>
                            </span>
                        </div>
                    </div>
                </form>
                <div class="dropdown ml-4">
                    <button class="btn border dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">
                        Sort by
                    </button>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                        <a class="dropdown-item" href="#">Latest</a>
                        <a class="dropdown-item" href="#">Popularity</a>
                        <a class="dropdown-item" href="#">Best Rating</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row px-xl-5">
        <div class="col-lg-8 col-md-12 pb-1 ">
                <div class="tab-pane fade show active" id="tab-pane-1">
                    <h5 class=""><s:message code="web.faqs.thongtin2"/></h5>
                    <button class="btn btn-primary w-100" type="button" data-bs-toggle="collapse" data-bs-target="#faqs1" aria-expanded="false" aria-controls="faqs1">
                       <div class="float-left"><s:message code="web.faqs.thongtin3"/></div>
                    </button>
                    <div class="collapse" id="faqs1">
                        <div class="card card-body">
                            <s:message code="web.faqs.thongtin4"/>
                        </div>
                    </div>
                    <hr>
                    <button class="btn btn-primary w-100" type="button" data-bs-toggle="collapse" data-bs-target="#faqs2" aria-expanded="false" aria-controls="faqs2">
                        <div class="float-left"><s:message code="web.faqs.thongtin5"/></div>
                    </button>
                    <div class="collapse" id="faqs2">
                        <div class="card card-body">
                            <s:message code="web.faqs.thongtin6"/>
                        </div>
                    </div>
                    <hr>
                    <button class="btn btn-primary w-100" type="button" data-bs-toggle="collapse" data-bs-target="#faqs3" aria-expanded="false" aria-controls="faqs3">
                        <div class="float-left"><s:message code="web.faqs.thongtin7"/></div>
                    </button>
                    <div class="collapse" id="faqs3">
                        <div class="card card-body">
                            <s:message code="web.faqs.thongtin8"/>
                        </div>
                    </div>
                    <hr>
                    <button class="btn btn-primary w-100" type="button" data-bs-toggle="collapse" data-bs-target="#faqs4" aria-expanded="false" aria-controls="faqs4">
                        <div class="float-left"><s:message code="web.faqs.thongtin9"/></div>
                    </button>
                    <div class="collapse" id="faqs4">
                        <div class="card card-body">
                            <s:message code="web.faqs.thongtin10"/>
                        </div>
                    </div>
                    <hr>
                    <h5 class=""><s:message code="web.faqs.thongtin19"/></h5>
                    <button class="btn btn-primary w-100" type="button" data-bs-toggle="collapse" data-bs-target="#faqs5" aria-expanded="false" aria-controls="faqs5">
                        <div class="float-left"><s:message code="web.faqs.thongtin11"/></div>
                    </button>
                    <div class="collapse" id="faqs5">
                        <div class="card card-body">
                            <s:message code="web.faqs.thongtin12"/><br>
                            <s:message code="web.faqs.thongtin14"/><br>
                            <s:message code="web.faqs.thongtin15"/><br>
                            <s:message code="web.faqs.thongtin16"/><br>
                            <s:message code="web.faqs.thongtin17"/><br>
                            <s:message code="web.faqs.thongtin18"/>
                        </div>
                    </div>
                    <hr>
                    <button class="btn btn-primary w-100" type="button" data-bs-toggle="collapse" data-bs-target="#faqs6" aria-expanded="false" aria-controls="faqs6">
                        <div class="float-left"><s:message code="web.faqs.thongtin20"/></div>
                    </button>
                    <div class="collapse" id="faqs6">
                        <div class="card card-body">
                            <s:message code="web.faqs.thongtin21"/>
                        </div>
                    </div>
                    <hr>

                    <button class="btn btn-primary w-100" type="button" data-bs-toggle="collapse" data-bs-target="#faqs7" aria-expanded="false" aria-controls="faqs7">
                        <div class="float-left"><s:message code="web.faqs.thongtin22"/></div>
                    </button>
                    <div class="collapse" id="faqs7">
                        <div class="card card-body">
                            <s:message code="web.faqs.thongtin23"/>
                        </div>
                    </div>
                    <hr>
                    <h5 class=""> <s:message code="web.faqs.thongtin24"/></h5>
                    <button class="btn btn-primary w-100" type="button" data-bs-toggle="collapse" data-bs-target="#faqs8" aria-expanded="false" aria-controls="faqs8">
                        <div class="float-left"> <s:message code="web.faqs.thongtin25"/></div>
                    </button>
                    <div class="collapse" id="faqs8">
                        <div class="card card-body">
                            <s:message code="web.faqs.thongtin26"/><br>
                            <s:message code="web.faqs.thongtin27"/><br>
                            <s:message code="web.faqs.thongtin28"/>
                        </div>
                    </div>
                    <hr>
                    <h5 class=""> <s:message code="web.faqs.thongtin29"/></h5>
                    <button class="btn btn-primary w-100" type="button" data-bs-toggle="collapse" data-bs-target="#faqs9" aria-expanded="false" aria-controls="faqs9">
                        <div class="float-left"> <s:message code="web.faqs.thongtin30"/></div>
                    </button>
                    <div class="collapse" id="faqs9">
                        <div class="card card-body">
                            <s:message code="web.faqs.thongtin31"/>
                        </div>
                    </div>
                    <hr>
                    <button class="btn btn-primary w-100" type="button" data-bs-toggle="collapse" data-bs-target="#faqs10" aria-expanded="false" aria-controls="faqs10">
                        <div class="float-left"><s:message code="web.faqs.thongtin32"/></div>
                    </button>
                    <div class="collapse" id="faqs10">
                        <div class="card card-body">
                            <s:message code="web.faqs.thongtin33"/> <br>
                            <s:message code="web.faqs.thongtin34"/><br>
                            <s:message code="web.faqs.thongtin36"/><br>
                            <s:message code="web.faqs.thongtin37"/>
                        </div>
                    <hr>
                </div>
        </div>
        </div>
        <div class="col-lg-4 col-md-12 pb-1">
            <div class="p-3" style="border: 1px solid #FFF0F0;border-radius: 5px;background-color: #FFF0F0">
                <h5><s:message code="web.faqs.thongtin38"/></h5>
                <p><s:message code="web.faqs.thongtin39"/></p>
                <form>
                    <div class="row">
                    <div class="col-12">
                    <input type="text" class="form-control" placeholder="Name:" >
                    </div>
                    <div class="col-12 mt-3">
                        <input type="email" class="form-control" placeholder="Email:" >
                    </div>
                    <div class="col-12 mt-3">
                        <input type="text" class="form-control" placeholder="Phone Number:" >
                    </div>
                    <div class="col-12 mt-3">
                        <textarea class="form-control" placeholder="Content" ></textarea>
                    </div>
                    </div>
                </form>
                <button class="btn btn-success mt-3"><s:message code="web.ttweb.submit"/></button>
            </div>
        </div>
    </div>
</div>

</div>
</body>
</html>
