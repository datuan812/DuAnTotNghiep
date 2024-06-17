<%--
  Created by IntelliJ IDEA.
  User: MMC
  Date: 10/30/2023
  Time: 7:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chi tiết hóa đơn</title>
</head>
<body>
 <section>
     <div class="content-body">
         <div class="container-fluid">
             <h3 style="margin-top: 0;
    margin-bottom: 30px;
    border-bottom: 2px solid #FFD43B;
    padding-bottom: 10px;
    padding-left: 5px;
    color: black;">
                Chi tiết hóa đơn
             </h3>
             <div class="row">
                 <div class="col-lg-9">
                    <div class="card" style="box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
    padding: 20px; background-color: #fff">
                        <div class="d-flex justify-content-between">
                            <h4>Thông tin khách hàng</h4>
                            <button type="button" class="buttonExport" id="exportButton" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                <span class="button__text">Hủy đơn</span>
                                <span class="button__icon">
                                    <svg class="svgExport" xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path d="M367.2 412.5L99.5 144.8C77.1 176.1 64 214.5 64 256c0 106 86 192 192 192c41.5 0 79.9-13.1 111.2-35.5zm45.3-45.3C434.9 335.9 448 297.5 448 256c0-106-86-192-192-192c-41.5 0-79.9 13.1-111.2 35.5L412.5 367.2zM0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256z"/>
                                    </svg>
                                </span>
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Lý do hủy đơn:</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <textarea id="lyDo" class="form-control" placeholder="Nhập lý do hủy đơn"></textarea>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger btn-deleteStatus">Hủy đơn</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-1">
                                    <img src="/template/admin/images/avatar.jpeg" width="50px" style="border-radius: 50%" alt="">
                            </div>
                            <div class="col-11">
                                    <span style="color: #eb8153" class="fs-5" id="tenKhachHang"></span><br>
                                    <span class="fs-5" id="soDienThoaiKhachHang"></span>
                            </div>
                        </div>
                    </div>
                     <div class="card mt-2" style="box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
    padding: 20px; background-color: #fff">
                         <h4>Thông tin sản phẩm</h4>
                         <hr>
                         <table class="table table-hover table-striped" id="tblSanPham">
                             <thead>
                             <tr class="table-warning text-center">
                                 <th scope="col">STT</th>
                                 <th scope="col">Hình ảnh</th>
                                 <th scope="col">Tên sản phẩm </th>
                                 <th scope="col">Tên thuộc tính</th>
                                 <th scope="col">Số lượng</th>
                                 <th scope="col">Đơn giá</th>
                                 <th scope="col">Thành tiền</th>
                             </tr>
                             </thead>
                             <tbody>

                             </tbody>
                         </table>
                         <div class="row">
                             <div class="col-8"></div>
                             <div class="col-4">
                                <div class="d-flex justify-content-between">
                                    <span>Tổng số lượng:</span>
                                    <div>
                                        <span class="font-weight-bold " id="invoice-quantity"></span>
                                    </div>
                                </div>
                                 <div class="d-flex justify-content-between">
                                     <span>Tổng tiền hàng:</span>
                                     <div>
                                         <span class="font-weight-bold invoice-total"></span> <span class="font-weight-bold">đ</span>
                                     </div>
                                 </div>
                                 <div class="d-flex justify-content-between">
                                     <span>Tiền giảm giá:</span>
                                     <div>
                                         <span class="font-weight-bold invoice-discount"></span> <span class="font-weight-bold">đ</span>
                                     </div>
                                 </div>
                                 <div class="d-flex justify-content-between">
                                     <span>Tiền khách trả:</span>
                                     <div>
                                         <span class="font-weight-bold " id="tienKhachTra"></span> <span class="font-weight-bold">đ</span>
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
                 <div class="col-lg-3">
                     <div class="card " style="box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
    padding: 20px; background-color: #fff">
                         <h4>Thông tin hóa đơn</h4>
                         <hr>
                         <div class="d-flex justify-content-between">
                                 <span class="fs-5">Mã hóa đơn:</span>
                                 <span style="color: #EB8153" class="fs-5" id="ma"></span>
                         </div>
                         <div class="d-flex justify-content-between mt-3">
                                <span class="fs-5">Thời gian:</span>
                                 <span class="fs-5" id="ngayThanhToan"></span>
                         </div>
                         <div class="d-flex justify-content-between mt-3">
                                  <span class="fs-5">Người bán:</span>
                                 <span class="fs-5" id="tenNhanVien"></span>
                         </div>
                         <div class="row mt-3">
                             <span class="fs-5">Ghi chú:</span>
                             <textarea class="form-control"></textarea>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </section>


 <script>
     let maHoaDon = null;
     loadHoaDon();

     function getDateTimeFromTimestamp(unixTimeStamp) {
         let date = new Date(unixTimeStamp);
         return ('0' + date.getDate()).slice(-2) + '/' + ('0' + (date.getMonth() + 1)).slice(-2) + '/' + date.getFullYear() + ' ' + ('0' + date.getHours()).slice(-2) + ':' + ('0' + date.getMinutes()).slice(-2);
     }

     function formatNumber(number) {
         return new Intl.NumberFormat('vi-VN').format(number);
     }

     function getMaHoaDon() {
         var urlSegments = window.location.pathname.split("/");
         return urlSegments[urlSegments.length - 1];
     }

     function loadHoaDon() {
         maHoaDon = getMaHoaDon();
         $.ajax({
             url: '/api/hoa-don-off/' + maHoaDon,
             method: 'GET',
             dataType: 'json',
             success: function (req) {
                 let totalInvoice = 0;
                 let toatlQuantity = 0;
                    console.log(req)
                 $("#ma").text(req.ma);
                 $("#tenKhachHang").text(req.tenKhachHang);
                 $("#soDienThoaiKhachHang").text(req.soDienThoaiKhachHang);
                 $("#tenNhanVien").text(req.tenNhanVien);
                 $('#ngayThanhToan').text(getDateTimeFromTimestamp(req.ngayThanhToan));
                 $("#trangThai").text(req.trangThai);
                 var tbody = $('#tblSanPham tbody');
                 tbody.empty();
                 var index = 0;
                 req.hoaDonChiTiet.forEach(function(item) {
                     totalInvoice += item.thanhTien;
                     toatlQuantity += item.soLuong;
                     var row = `
                            <tr>
                                 <td class="text-center">\${++index}</td>
                                 <td class="text-center">
                                     <img src='/repository/\${item.image}' style="width: 120px;">
                                 </td>
                                 <td style="max-width: 300px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">\${item.tenSanPham}</td>
                                 <td class="text-center">\${item.tenBienThe}</td>
                                 <td class="text-center">\${item.soLuong}</td>
                                 <td class="text-center">\${formatNumber(item.gia)} đ</td>
                                 <td class="text-center">\${formatNumber(item.thanhTien)} đ</td>
                            </tr>`;
                     tbody.append(row);
                     $('#invoice-quantity').text(toatlQuantity);
                     $('.invoice-total').text(formatNumber(totalInvoice));
                     $("#tienKhachTra").text(formatNumber(req.tienKhachTra));
                     $(".invoice-discount").text(formatNumber(req.tienGiamGia));
                 });
             },
             error: function (xhr, status, error) {
                 console.log(error);
             }
         })
     }

     $('.btn-deleteStatus').on('click', () => {
         let lyDo = $('#lyDo').val().trim();
         if (lyDo === "") {
             showError("Vui lòng nhập lý do hủy đơn.");
             return;
         }
         showConfirm("Bạn có muốn hủy không?")
                 .then((confirmed) => {
                     if (confirmed) {
                         let data = { "lyDo": lyDo };

                         cancelOrder(data,
                             function (response) {
                                 $.ajax({
                                     url: '/api/hoa-don-off/deleteStatus/' + maHoaDon,
                                     method: 'PUT',
                                     contentType: "application/json; charset=utf-8",
                                     data: JSON.stringify(response.id),
                                     success: function (response) {
                                         console.log(response)
                                         showSuccess("Hủy đơn thành công!");
                                         window.location.href = "/admin/giao-dich/hoa-don-off";
                                     },
                                     error: function (xhr, status, error) {
                                         showError(xhr.responseJSON.error);
                                     }
                                 });
                             },
                             function (error) {
                                console.log(error)
                             })
                     }
                 });

     });

     function cancelOrder(data, successCallback, errorCallback){
         $.ajax({
             url: "/api/ly-do-huy-don",
             method: "POST",
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             data: JSON.stringify(data),
             success: function (response) {
                 successCallback(response);
             },
             error: function (error) {
                 errorCallback(error);
             }
         });
     }
 </script>
</body>
</html>
