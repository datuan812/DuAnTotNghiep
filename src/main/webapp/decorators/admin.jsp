<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><dec:title>Dashboard</dec:title></title>
    <link rel="icon" type="image/png" sizes="50x50" href="<c:url value='/template/admin/images/logoKFC.png'/>">
    <link rel="stylesheet" href="<c:url value='/template/admin/vendor/chartist/css/chartist.min.css'/>">
    <link href="<c:url value='/template/admin/vendor/bootstrap-select/dist/css/bootstrap-select.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/template/admin/vendor/owl-carousel/owl.carousel.css'/>" rel="stylesheet">
    <link href="<c:url value='/template/admin/css/style.css'/>" rel="stylesheet">
    <link href="<c:url value='/template/admin/css/main.css'/>" rel="stylesheet">
    <link href="<c:url value='/assets/css/customer.css'/>" rel="stylesheet">
    <link href="<c:url value='/template/admin/css/bieudo.css'/>" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        .autocomplete-suggestions { -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; border: 1px solid #999; background: #FFF; cursor: default; overflow: auto; -webkit-box-shadow: 1px 4px 3px rgba(50, 50, 50, 0.64); -moz-box-shadow: 1px 4px 3px rgba(50, 50, 50, 0.64); box-shadow: 1px 4px 3px rgba(50, 50, 50, 0.64); }
        .autocomplete-suggestion { padding: 2px 5px; white-space: nowrap; overflow: hidden; }
        .autocomplete-selected { background: #F0F0F0; }
        .autocomplete-suggestions strong { font-weight: bold; color: #000; }
    /*    Loading  */

    </style>
    <script>
        var loadingBody = function(){
            $('#preloader').show();
        }
        var endLoadingBody = function () {
            $('#preloader').hide();
        }
        function convertVND(number){
            if (!number){
                number = 0;
            }
            return number.toLocaleString('it-IT', {style : 'currency', currency : 'VND'});
        }
        function getFormattedDate(longDate) {
            date = new Date(longDate);
            let year = date.getFullYear();
            let month = (1 + date.getMonth()).toString().padStart(2, '0');
            let day = date.getDate().toString().padStart(2, '0');

            return day + '-' + month + '-' + year;
        }
        function formatDateInput(longDate) {
            date = new Date(longDate);
            let year = date.getFullYear();
            let month = (1 + date.getMonth()).toString().padStart(2, '0');
            let day = date.getDate().toString().padStart(2, '0');

            return year + '-' + month + '-' + day;
        }
        function getDateTime(longDate) {
            date = new Date(longDate);
            let year = date.getFullYear();
            let month = (1 + date.getMonth()).toString().padStart(2, '0');
            let day = date.getDate().toString().padStart(2, '0');
            let hours = date.getHours().toString().padStart(2, '0');
            let minutes = date.getMinutes().toString().padStart(2, '0');

            return day + '-' + month + '-' + year + ' ' + hours + ':' + minutes;
        }

        function showConfirm(message, id) {
            return new Promise((resolve) => {
                Swal.fire({
                    title: 'Bạn chắc chắn?',
                    text: message,
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Đồng ý!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        resolve(true);
                    } else {
                        resolve(false);
                    }
                });
            });
        }
        function showSuccess2(message){
            const Toast = Swal.fire({
                title: "Thông báo!",
                text: message,
                icon: "success",
            })

        }

        function showSuccess(message){
            const Toast = Swal.mixin({
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 2000,
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer)
                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                }
            })

            Toast.fire({
                icon: 'success',
                title: message
            })
        }

        function showError(message){
            const Toast = Swal.mixin({
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 2000,
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer)
                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                }
            })

            Toast.fire({
                icon: 'error',
                title: message
            })
        }
    </script>


</head>
<body>
<!--*******************
   Preloader start
********************-->

<div id="preloader" style="z-index: 999;">
    <div class="sk-three-bounce">
        <div class="sk-child sk-bounce1"></div>
        <div class="sk-child sk-bounce2"></div>
        <div class="sk-child sk-bounce3"></div>
    </div>
</div>
<!--*******************
    Preloader end
********************-->


<div id="main-wrapper">
    <%@ include file="/common/admin/header.jsp" %>
    <%@ include file="/common/admin/sidebar.jsp" %>
    <dec:body/>
    <%@ include file="/common/admin/footer.jsp" %>
</div>



<%--<script data-cfasync="false" src="../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>--%>
<script src="<c:url value='/template/admin/vendor/global/global.min.js'/>"></script>
<script src="<c:url value='/template/admin/vendor/bootstrap-select/dist/js/bootstrap-select.min.js'/>"></script>
<script src="<c:url value='/template/admin/vendor/chart.js/Chart.bundle.min.js'/>"></script>

<!-- Chart piety plugin files -->
<%--<script src="<c:url value='/template/admin/vendor/peity/jquery.peity.min.js'/>"></script>--%>

<!-- Apex Chart -->
<script src="<c:url value='/template/admin/vendor/apexchart/apexchart.js'/>"></script>
<!-- Dashboard 1 -->
<%--<script src="<c:url value='/template/admin/js/dashboard/dashboard-1.js'/>"></script>--%>
<script src="<c:url value='/template/admin/paging/jquery.twbsPagination.js'/>"></script>
<script src="<c:url value='/template/autocomplete/jquery.autocomplete.js'/>"></script>
<script src="<c:url value='/template/admin/vendor/owl-carousel/owl.carousel.js'/>"></script>
<script src="<c:url value='/template/admin/js/custom.min.js'/>"></script>
<script src="<c:url value='/template/admin/js/deznav-init.js'/>"></script>
<script src="<c:url value='/template/admin/js/demo.js'/>"></script>
<script src="<c:url value='/template/admin/js/main.js'/>"></script>
<script src="<c:url value='/template/admin/js/bieudo.js'/>"></script>
<script src="<c:url value='/template/admin/js/styleSwitcher.js'/>"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>
</html>