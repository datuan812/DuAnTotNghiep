<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 12/15/2023
  Time: 12:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Xuất hóa đơn</title>
</head>
<body>
<div id="printf-invoice-pdf" class="container mt-5" style="border: 1px solid #000000; padding: 20px">
    <div class="container-fluid">
        <div class="row text-center">
            <div class="col-7 ">
                <h3 class="font-weight-bold mt-3">KING OF CLOTHES</h3>
            </div>
            <div class="col-5 ">
                <h2 class="font-weight-bold" style="border-bottom: 1px solid #000000; padding: 20px;">HÓA ĐƠN BÁN HÀNG </h2>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col">
                <span class="fs-5"><strong>Tên khách hàng:</strong></span>
                <span class="fs-4 ms-3 customer-name">Khách lẻ</span>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col">
                <span class="fs-5"><strong>Số điện thoại: </strong></span>
                <span class="fs-5 ms-3 customer-phone">0384082003</span>
            </div>
        </div>
        <div class="row mt-3">
            <table class="table table-hover table-bordered border-dark">
                <thead>
                <tr class="text-center">
                    <th scope="col">STT</th>
                    <th scope="col">Tên sản phẩm</th>
                    <th scope="col">Số lượng</th>
                    <th scope="col">Đơn giá</th>
                    <th scope="col">Thành tiền</th>
                </tr>
                </thead>
                <tbody id="tbody-invoice" class="table-group-divider">

                </tbody>
            </table>
        </div>
        <div class="row mt-3">
            <div class="col">
                <span class="fs-5">Thành tiền (viết bằng chữ):</span>
                <strong class="fs-4" id="price-read-vnd">Tám trăm nghìn đồng</strong>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-5 text-center">
                <h4 class="">KHÁCH HÀNG</h4>
                <h5 class="customer-name">Khách lẻ</h5>
            </div>
            <div class="col-7 text-center">
                <h5 class="timestamp-invoice">20/11/2023 8:49</h5>
                <h4 class="">NGƯỜI BÁN HÀNG </h4>
                <h5 id="user-id">Nguyễn Văn A</h5>
            </div>
        </div>
    </div>
</div>
<div class="container pt-4">
    <div class="d-flex justify-content-between">
        <a href="/admin/giao-dich/hoa-don-off" class="btn btn-outline-dark">Back ></a>
        <button id="printf-invoice" class="btn btn-outline-dark">In hóa đơn</button>
    </div>
</div>

<script>
    const currentUrl = window.location.href;
    const results = currentUrl.split('/');
    const maHoaDon = results[results.length - 1];

    loadHoaDon();

    function formatNumber(number) {
        return new Intl.NumberFormat('vi-VN').format(number);
    }

    function loadHoaDon() {
        $.ajax({
            url: "/api/hoa-don-off/" + maHoaDon,
            method: "GET",
            dataType: "json",
            success: (response) => {
                let html = '';
                let totalInvoice = 0;

                $.each(response.hoaDonChiTiet, (index, item) => {
                    totalInvoice += item.thanhTien;
                    html += ` <tr>
                                <td class="text-center">\${++index}</td>
                                <td>\${item.tenSanPham}</td>
                                <td class="text-center">\${item.soLuong}</td>
                                <td class="text-center">\${formatNumber(item.gia)}</td>
                                <td class="text-center">\${formatNumber(item.thanhTien)}</td>
                            </tr>`;
                });

                let totalAmount = response.tienGiamGia !== null ? totalInvoice - response.tienGiamGia : totalInvoice;

                html += `<tr>
                        <td scope="col" colspan="2"></td>
                        <th scope="col" colspan="3" class="fs-4 text-center">Tổng tiền: \${formatNumber(totalAmount)}</th>
                    </tr>`;

                $('#tbody-invoice').html(html);
                $('.customer-name').text(response.tenKhachHang);
                $('.customer-phone').text(response.soDienThoaiKhachHang);
                $('#user-id').text(response.tenNhanVien);

                var docTien = new DocTienBangChu();
                $('#price-read-vnd').text(docTien.doc(totalAmount));

                var ngayTao = new Date(response.ngayTao).toLocaleDateString("vi-VN");
                let splitNgayTao = ngayTao.split("/");
                let res = "Ngày " + splitNgayTao[0] + " tháng " + splitNgayTao[1] + " năm " + splitNgayTao[2];
                $('.timestamp-invoice').html(res);
            },
            error: (error) => {
                console.log(error);
            }
        });
    }


    var form = $("#printf-invoice-pdf"),
        cache_width = form.width(),
        a4 = [570, 850];

    $("#printf-invoice").on("click", function () {
        $("body").scrollTop(0);
        createPDF();
        showSuccess("In hóa đơn thành công")

    });

    function createPDF() {
        getCanvas().then(function (canvas) {
            var img = canvas.toDataURL("image/png"),
                doc = new jsPDF({
                    unit: "px",
                    format: "a4",
                });
            doc.addImage(img, "JPEG", 20, 20);
            doc.save(maHoaDon + ".pdf");
            form.width(cache_width);
        });
    }

    function getCanvas() {
        form.width(a4[0] * 1.33333 - 80).css("max-width", "none");
        return html2canvas(form, {
            imageTimeout: 2000,
            removeContainer: true,
        });
    }

</script>
</body>
</html>