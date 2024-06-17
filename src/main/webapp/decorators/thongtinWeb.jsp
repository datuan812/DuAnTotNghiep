<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><dec:title>Trang chủ</dec:title></title>
    <link href="img/favicon.icon" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="<c:url value='/template/web/lib/owlcarousel/assets/owl.carousel.min.css'/>" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="<c:url value='/template/web/css/style.css'/>" rel="stylesheet">
    <link href="<c:url value='/template/thongtinWeb/css/style.css'/>" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script>

        function getDateTime(longDate) {
            date = new Date(longDate);
            let year = date.getFullYear();
            let month = (1 + date.getMonth()).toString().padStart(2, '0');
            let day = date.getDate().toString().padStart(2, '0');
            let hours = date.getHours().toString().padStart(2, '0');
            let minutes = date.getMinutes().toString().padStart(2, '0');

            return day + '-' + month + '-' + year + ' ' + hours + ':' + minutes;
        }

        function convertVND(number){
            return number.toLocaleString('it-IT', {style : 'currency', currency : 'VND'});
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

        //js click menu
        const links = document.querySelectorAll('.menu ul li a');
        links.forEach(link => {
            link.addEventListener('click', () => {
                links.forEach(otherLink => {
                    otherLink.classList.remove('active');
                });
                link.classList.add('active');
            });
        });
        function genderTrangThaiHd(idhd,mahd,val) {
            if (val!="Chờ nhận đơn"){
                return `
                <div class="my-2 text-right">
                                    <a class="btn btn-secondary" href="/web/thong-tin-don-hang?mahd=\${mahd}">Xem đơn hàng</a>
                                </div>
                `
            }else{
                return `
                <div class="my-2 text-right">
                                    <button class="btn btn-danger me-2 huydonttweb" onclick="thayDoiTrangThaiHoaDon(\${idhd},'HUYDON')">Hủy đơn</button>
                                    <a class="btn btn-secondary" href="/web/thong-tin-don-hang?mahd=\${mahd}">Xem đơn hàng</a>
                                </div>
                `
            }
        }

        function getSoLuongGioHang(customerIdWhenLogin){
            $.ajax({
                url: '/api/user/giohang/tongsptronggio?id='+customerIdWhenLogin,
                dataType: "json",
                success: function (response){
                    $("#soLuongGioHang").text(response);
                },
                error: function (error){
                    console.log(error);
                }
            });
        };
        function formatNumber(number) {
            return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
        }
    </script>

</head>
<body >
<%@ include file="/common/thongtinWeb/topbar.jsp" %>
<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <div class="col-lg-3 col-md-12 pb-1">
            <%@ include file="/common/thongtinWeb/sidebar.jsp" %>
        </div>
        <div class="col-lg-9 col-md-12 pb-1">
            <dec:body/>
        </div>
    </div>
</div>
<%@ include file="/common/thongtinWeb/footer.jsp" %>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>