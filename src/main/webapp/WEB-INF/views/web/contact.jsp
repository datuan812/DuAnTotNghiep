<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Contact</title>
</head>
<body>
    <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 180px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3"><s:message code="web.navbar.Contact"/></h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href=""><s:message code="web.navbar.home"/></a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0"><s:message code="web.navbar.Contact"/></p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->

    <!-- Contact Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2"><s:message code="web.contact.thongtin1"/></span></h2>
        </div>
        <div class="row px-xl-5">
            <div class="col-lg-6 mb-5">
                <div class="d-flex flex-column mb-3">
                    <h5 class="font-weight-semi-bold mb-3">King Of Clothes Shop</h5>
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i><s:message code="web.footer.thongtin6"/></p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>KOC2003@gmail.com</p>
                    <p class="mb-2"><i class="fa fa-phone-alt text-primary mr-3"></i>+84 987654321</p>
                </div>
                <hr>
                <h4><s:message code="web.navbar.Contact"/></h4>
                <div class="contact-form">
                    <div id="success"></div>
                    <form name="sentMessage" id="contactForm" novalidate="novalidate">
                        <div class="control-group">
                            <input type="text" class="form-control" id="name" placeholder="Your Name"
                                   required="required" data-validation-required-message="Please enter your name" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group">
                            <input type="email" class="form-control" id="email" placeholder="Your Email"
                                   required="required" data-validation-required-message="Please enter your email" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group">
                            <input type="text" class="form-control" id="subject" placeholder="Subject"
                                   required="required" data-validation-required-message="Please enter a subject" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group">
                                <textarea class="form-control" rows="6" id="message" placeholder="Message"
                                          required="required"
                                          data-validation-required-message="Please enter your message"></textarea>
                            <p class="help-block text-danger"></p>
                        </div>
                        <div>
                            <button class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton"><s:message code="web.contact.thongtin2"/></button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-lg-6 mb-5">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d12525.381622199584!2d105.74598925796502!3d21.03995763828852!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31345544688c13a3%3A0x598a29eb40c7e5bb!2zVGjGocyAaSBUcmFuZyBWZW51cw!5e0!3m2!1sen!2s!4v1696573970081!5m2!1sen!2s"
                        style="border:0; width: 100%; height: 600px"  allowfullscreen="" loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade"></iframe>

            </div>
        </div>
    </div>
    <!-- Contact End -->
</body>
</html>