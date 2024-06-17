<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 12/22/2023
  Time: 11:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Trả hàng</title>
</head>
<body>
<div class="container mt-5" style="border: 1px solid #000000; padding: 20px">
    <div class="container-fluid">
        <h1 class="text-uppercase text-center p-3 pb-5">Biên bản trả hàng và thu hồi hóa đơn</h1>
        <span class="fs-5">Biên bản này được lập ngày 25 tháng 07 năm 2018, Giữa các bên bao gồm:</span>
        <h4 class="mt-2">BÊM BÁN HÀNG: Cửa hàng quần áo nam King Of Clothes</h4>
        <div class="d-flex justify-content-between">
            <div>
                - <strong class="fs-5 mb-2">Tên nhân viên: </strong><span class="fs-5">Nguyễn Văn A</span>
            </div>
            <div>
                <strong class="fs-5">Ngày sinh: </strong><span class="fs-5">08/12/2003</span>
            </div>
        </div>
        - <strong class="fs-5">Địa chỉ: </strong><span class="fs-5">Cổng số 1, Tòa nhà FPT Polytechnic, 13 phố Trịnh Văn Bô, phường Phương Canh, quận Nam Từ Liêm, TP Hà Nội Km12 Cầu Diễn, Phường Phúc Diễn, Quận Bắc Từ Liêm, Hà Nội</span>
        <h4 class="mt-2">BÊM MUA HÀNG: Đinh Anh Tuấn</h4>
        <div class="d-flex justify-content-between mb-3">
            <div>
                - <strong class="fs-5 mb-2">Mã khách hàng: </strong><span class="fs-5">dinhanhtuan0812</span>
            </div>
            <div>
                 <strong class="fs-5">Số điện thoại: </strong><span class="fs-5">0384082003</span>
            </div>
        </div>
        <strong class=" fs-5">1. Bên mua trả lại hàng đã mua của bên bán, chi tiết ở bảng kê sau: </strong>
        <table class="table table-hover table-bordered border-dark mt-3">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Tên sản phẩm</th>
                <th scope="col">Số lượng</th>
                <th scope="col">Đơn giá</th>
                <th scope="col">Thành tiền</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Áo polo</td>
                <td>2</td>
                <td>300000</td>
                <td>600000</td>
            </tr>
            </tbody>
        </table>
        <div class="row mt-3 mb-3">
            <div class="col">
                <span class="fs-5">Bằng chữ:</span>
                <strong class="fs-5" id="price-read-vnd">Tám trăm nghìn đồng</strong>
            </div>
        </div>
        <strong class="fs-5">2. Bên mua trả lại hóa đơn mua hàng cho bên bán, chi tiết như sau: </strong>
        <table class="table table-hover table-bordered border-dark mt-3">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Mã hóa đơn</th>
                <th scope="col">Số tiền</th>
                <th scope="col">Lý do trả hàng</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>HD01</td>
                <td>600000</td>
                <td>Không vừa</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<div class="container pt-4">
    <div class="d-flex justify-content-end">
        <button class="btn btn-outline-dark">In biên bản</button>
    </div>
</div>
</body>
</html>
