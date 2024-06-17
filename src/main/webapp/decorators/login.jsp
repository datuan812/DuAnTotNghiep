<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><dec:title>Login</dec:title></title>
    <link href="img/favicon.icon" rel="icon">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    <link href="<c:url value='/template/login/css/vendor.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/template/login/vendor/icon-set/style.css'/>" rel="stylesheet">
    <link href="<c:url value='/template/login/css/theme.min.css'/>" rel="stylesheet">
    <script>
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
    </script>
</head>
<body>

<dec:body/>

<script src="<c:url value='/template/login/js/vendor.min.js'/>"></script>
<script src="<c:url value='/template/login/js/theme.min.js'/>"></script>

<script>
    if (/MSIE \d|Trident.*rv:/.test(navigator.userAgent)) document.write('<script src="<c:url value='/template/login/vendor/babel-polyfill/polyfill.min.js"'/>"<\/script>');
</script>

</body>
</html>