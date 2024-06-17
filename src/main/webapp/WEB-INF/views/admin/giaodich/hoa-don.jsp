<%--
  Created by IntelliJ IDEA.
  User: MMC
  Date: 10/27/2023
  Time: 10:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>Hóa Đơn</title>
</head>
<section>
    <div class="content-body" >
        <div class="container-fluid">
            <div class="modal fade chitiethoadon" tabindex="-1" aria-labelledby="chitiethoadon" aria-hidden="true">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-4" id="chitiethoadon">Chi tiết hóa đơn</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="card" style="box-shadow: rgba(0, 0, 0, 0.06) 0px 2px 4px 0px inset;padding: 20px; background-color: #fff">
                                <div class="">
                                    <h5>Thông tin khách hàng</h5>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col">
                                        <strong>Mã Khách hàng đặt:</strong> <span id="makh">KH01</span>
                                    </div>
                                    <div class="col">
                                        <strong>Tên người nhận:</strong> <span id="tennguoinhan">Đinh Tuấn Anh</span>
                                    </div>
                                </div>
                                <div class="row my-2">
                                    <div class="col">
                                        <strong>Địa chỉ:</strong> <span id="diachi">Yên trị, Yên Thuỷ, Hoà bình</span>
                                    </div>
                                    <div class="col">
                                        <strong>Số điện thoại:</strong> <span id="sodienthoai">0325808823</span>
                                    </div>
                                </div>
                                <div class="row my-2">
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="luuy">Lưu ý cho shop</label>
                                            <textarea class="form-control" id="luuy" rows="3"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="" style="height: 300px; overflow-y: scroll;" id="cart">
                                <div class="card">
                                    <div class="project-info">
                                        <div class="col-xl-1 my-2 col-lg-4 col-sm-6">
                                            <span>#</span>
                                            <h5 class="mb-0 pt-1 font-w500 text-black">1</h5>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Mã biến thể</span>
                                                    <h5 class="mb-0 pt-1 font-w500 text-black" >SP03</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Tên sản phẩm</span>
                                                    <h5 class="mb-0 pt-1 font-w500 text-black">Áo polo nam aelimited</h5>
                                                    <div class="text-success" >Màu hồng, M</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Số lượng</span>
                                                    <input type="text" class="form-control w-50" style="text-align: center; height: 30px" value="2">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Đơn giá</span>
                                                    <h5 class="mb-0 pt-1 font-w500 text-black">150000</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Thành tiền</span>
                                                    <h5 class="mb-0 pt-1 font-w500 text-black" >150000</h5>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="project-info">
                                        <div class="col-xl-1 my-2 col-lg-4 col-sm-6">
                                            <span>#</span>
                                            <h5 class="mb-0 pt-1 font-w500 text-black">1</h5>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Mã sản phẩm</span>
                                                    <h5 class="mb-0 pt-1 font-w500 text-black">SP03</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Tên sản phẩm</span>
                                                    <h5 class="mb-0 pt-1 font-w500 text-black">Áo polo nam aelimited</h5>
                                                    <div class="text-success">Màu hồng, M</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Số lượng</span>
                                                    <input type="text" class="form-control w-50" style="text-align: center; height: 30px" value="2">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Đơn giá</span>
                                                    <h5 class="mb-0 pt-1 font-w500 text-black">150000</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Thành tiền</span>
                                                    <h5 class="mb-0 pt-1 font-w500 text-black">150000</h5>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="project-info">
                                        <div class="col-xl-1 my-2 col-lg-4 col-sm-6">
                                            <span>#</span>
                                            <h5 class="mb-0 pt-1 font-w500 text-black">1</h5>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Mã sản phẩm</span>
                                                    <h5 class="mb-0 pt-1 font-w500 text-black">SP03</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Tên sản phẩm</span>
                                                    <h5 class="mb-0 pt-1 font-w500 text-black">Áo polo nam aelimited</h5>
                                                    <div class="text-success">Màu hồng, M</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Số lượng</span>
                                                    <input type="text" class="form-control w-50" style="text-align: center; height: 30px" value="2">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Đơn giá</span>
                                                    <h5 class="mb-0 pt-1 font-w500 text-black">150000</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Thành tiền</span>
                                                    <h5 class="mb-0 pt-1 font-w500 text-black">150000</h5>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="project-info">
                                        <div class="col-xl-1 my-2 col-lg-4 col-sm-6">
                                            <span>#</span>
                                            <h5 class="mb-0 pt-1 font-w500 text-black">1</h5>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Mã sản phẩm</span>
                                                    <h5 class="mb-0 pt-1 font-w500 text-black">SP03</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Tên sản phẩm</span>
                                                    <h5 class="mb-0 pt-1 font-w500 text-black">Áo polo nam aelimited</h5>
                                                    <div class="text-success">Màu hồng, M</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Số lượng</span>
                                                    <input type="text" class="form-control w-50" style="text-align: center; height: 30px" value="2">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Đơn giá</span>
                                                    <h5 class="mb-0 pt-1 font-w500 text-black">150000</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Thành tiền</span>
                                                    <h5 class="mb-0 pt-1 font-w500 text-black">150000</h5>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="project-info">
                                        <div class="col-xl-1 my-2 col-lg-4 col-sm-6">
                                            <span>#</span>
                                            <h5 class="mb-0 pt-1 font-w500 text-black">1</h5>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Mã sản phẩm</span>
                                                    <h5 class="mb-0 pt-1 font-w500 text-black">SP03</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Tên sản phẩm</span>
                                                    <h5 class="mb-0 pt-1 font-w500 text-black">Áo polo nam aelimited</h5>
                                                    <div class="text-success">Màu hồng, M</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Số lượng</span>
                                                    <input type="text" class="form-control w-50" style="text-align: center; height: 30px" value="2">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Đơn giá</span>
                                                    <h5 class="mb-0 pt-1 font-w500 text-black">150000</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Thành tiền</span>
                                                    <h5 class="mb-0 pt-1 font-w500 text-black">150000</h5>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="project-info">
                                        <div class="col-xl-1 my-2 col-lg-4 col-sm-6">
                                            <span>#</span>
                                            <h5 class="mb-0 pt-1 font-w500 text-black">1</h5>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Mã sản phẩm</span>
                                                    <h5 class="mb-0 pt-1 font-w500 text-black">SP03</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Tên sản phẩm</span>
                                                    <h5 class="mb-0 pt-1 font-w500 text-black">Áo polo nam aelimited</h5>
                                                    <div class="text-success">Màu hồng, M</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Số lượng</span>
                                                    <input type="text" class="form-control w-50" style="text-align: center; height: 30px" value="2">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Đơn giá</span>
                                                    <h5 class="mb-0 pt-1 font-w500 text-black">150000</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                            <div class="d-flex align-items-center">
                                                <div class="ml-2">
                                                    <span>Thành tiền</span>
                                                    <h5 class="mb-0 pt-1 font-w500 text-black">150000</h5>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-8"></div>
                                <div class="col-4">
                                    <div class="d-flex justify-content-between">
                                        <h6>Tiền sản phẩm:</h6>
                                        <h6 id="tiensp">500.000 VND</h6>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <h6>Tiền ship:</h6>
                                        <h6 id="tienship">25.000 VND</h6>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <h6>Tổng tiền hàng:</h6>
                                        <h6 id="tienhang">525.000 VND</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer" id="trangthaibutton">
                            <button type="button" class="btn btn-outline-default" data-bs-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-outline-secondary">Nhận đơn</button>
                            <button type="button" class="btn btn-outline-success">Nhận đơn</button>
                            <button type="button" class="btn btn-outline-warning">Nhận đơn</button>
                            <button type="button" class="btn btn-outline-primary">Nhận đơn</button>
                        </div>
                    </div>

                </div>
            </div>
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/admin/giao-dich/hoa-don">Online</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="/admin/giao-dich/hoa-don-off">Offline</a>
                </li>
            </ul>

            <div class="card mt-4" style="box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
        padding: 20px; background-color: #fff">
                    <div class=" hstack gap-3">
                        <div class="">
                            <h4 >Danh sách hóa đơn</h4>
                        </div>
                        <div class="ms-auto">
                            <select id="tthd" class="form-select">
                                <option value="" selected>Trạng thái hóa đơn</option>
                                <option value="CHONHANDON">Chờ nhận đơn</option>
                                <option value="DANHANDON">Đã nhận đơn</option>
                                <option value="DANGGIAOHANG">Đang giao hàng</option>
                            </select>
                        </div>
                        <div class="vr"></div>
                        <div class="">
                            <div class="InputContainer">
                                <input type="text" id="tensearch" name="text" class="input" placeholder="Search">

                                <div class="border"></div>

                                <button id="searchhoadon" class="micButton">
                                    <svg viewBox="0 0 512 512" class="searchIcon">
                                        <path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"></path>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>


                    <hr>
                    <div class="d-flex justify-content-between">
                        <hr>
                            <table class="table table-hover" id="tblHoaDon" >
                                <thead>
                                <tr>
                                    <th scope="col">STT</th>
                                    <th scope="col">Mã Hóa đơn</th>
                                    <th scope="col">Khách hàng</th>
                                    <th scope="col">Ngày đặt</th>
                                    <th scope="col">Tổng tiền hàng</th>
                                    <th scope="col">Phương thức</th>
                                    <th scope="col">Trạng thái</th>
                                    <th scope="col">Thao tác</th>
                                </tr>
                                </thead>
                                <tbody >
                                </tbody>
                            </table>
                    </div>
                </div>

<%--                <nav class="mt-2">--%>
<%--                    <ul class="pagination pagination-gutter pagination-primary  no-bg">--%>
<%--                        <li class="page-item page-indicator">--%>
<%--                            <a class="page-link" href="javascript:void(0)">--%>
<%--                                <i class="la la-angle-left"></i></a>--%>
<%--                        </li>--%>
<%--                        <li class="page-item "><a class="page-link" href="javascript:void(0)">1</a>--%>
<%--                        </li>--%>
<%--                        <li class="page-item active"><a class="page-link" href="javascript:void(0)">2</a></li>--%>
<%--                        <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>--%>
<%--                        <li class="page-item"><a class="page-link" href="javascript:void(0)">4</a></li>--%>
<%--                        <li class="page-item page-indicator">--%>
<%--                            <a class="page-link" href="javascript:void(0)">--%>
<%--                                <i class="la la-angle-right"></i></a>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </nav>--%>

        </div>
    </div>
</section>
<div id="loading"></div>
<%--<script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.js"></script>--%>

<script>
    loadDsHoaDon()
  function loadDsHoaDon() {
      $.ajax({
          url: '/api/hoadon/dshoadon',
          method: 'GET',
          success: function (req) {
              console.log(req)
              $("#loading").addClass("loading")
              loadTable(req)

          },
          error: function(xhr, status, error) {
              console.log("Có lỗi xảy ra")
          }
      });
  }
  function loadTable(data) {
      let table = $("#tblHoaDon tbody");
      table.empty();
      data.forEach(function (item,index) {
         table.append(`
            <tr>
                  <th scope="row">\${index+1}</th>
                  <td>\${item.ma}</td>
                  <td>\${item.tenNguoiNhan}</td>
                  <td>\${getFormattedDate(item.thoiGianDat)}</td>
                  <td>\${convertVND(item.tongTien)}</td>
                  <td>\${item.phuongThucThanhToan}</td>
                  <td>\${item.trangThai}</td>
                  <td>
                    <button class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target=".chitiethoadon" onclick="chiTietHoaDon(\${item.id})">Chi tiết</button>
                </td>
                </tr>
         `)
      })

  }
  function htmlGiaTien(giaTien,giaTienKm) {
        let html = '';
        if(!giaTienKm){
            html+=
                `
            <h6 class="mb-0 pt-1 font-w500 text-black">\${convertVND(giaTien)}</h6>
                `
        }else{
            html+=`
            <h6 class="mb-0 pt-1 font-w500 text-black">\${convertVND(giaTienKm)}</h6>
            <h6 class="mb-0 pt-1 font-w500 text-black"><del>\${convertVND(giaTien)}</del></h6>
            `
        }
        return html;
  }
   function chiTietHoaDon(idhd) {
       $.ajax({
           url: '/api/hdct/'+idhd,
           method: 'GET',
           success: function (req) {
               var data  = req.data[0];
              $("#makh").text(data.maKhachHang)
              $("#tennguoinhan").text(data.tenNguoiNhan)
              $("#sodienthoai").text(data.soDienThoai)
              $("#diachi").text(data.diaChiNguoiNhan)
              $("#tiensp").text(convertVND(data.tongTienSanPham))
              $("#tienship").text(convertVND(data.tienShip))
              $("#tienhang").text(convertVND(data.tongTien))
               var luuy = $("#luuy");
               luuy.val(data.moTa);
               if (data.trangThaiHoaDon != "Chờ nhận đơn") {
                   luuy.prop('readonly', true); // Sử dụng prop() để thiết lập thuộc tính readOnly
               } else {
                   luuy.prop('readonly', false);
               }

               let cart = $("#cart")
               cart.empty();
               let html = "";
                req.data.forEach(function (item,index) {
                    let htmlGia = htmlGiaTien(item.giaTien,item.giaTienKm);
                    html+=`
                     <div class="card">
                        <div class="project-info">
                        <div class="col-xl-1 my-2 col-lg-4 col-sm-6">
                        <span>#</span>
                    <h5 class="mb-0 pt-1 font-w500 text-black">\${index+1}</h5>
                </div>
                    <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                        <div class="d-flex align-items-center">
                            <div class="ml-2">
                                <span>Hình ảnh</span>
                                <a class="text-decoration-none" href="/san-pham/\${item.slugSP}">
                                    <img src='/repository/\${item.image}' style="width: 120px;">
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 my-2 col-lg-6 col-sm-6">
                        <div class="d-flex align-items-center">
                            <div class="ml-2">
                                <span>Tên sản phẩm</span>
                            <a style="text-decoration: none;color: black" href="/san-pham/\${item.slugSP}">
                                <h5 class="mb-0 pt-1 font-w500 text-black line-clamp-2">\${item.tenSanPham}</h5>
                                <div class="text-success" >\${item.tenBienThe}</div>
                            </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                        <div class="d-flex align-items-center">
                            <div class="ml-2">
                                <span>Đơn giá</span>
                                \${htmlGia}
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                        <div class="d-flex align-items-center">
                            <div class="ml-2">
                                <span>Số lượng</span>
                                <input type="text" class="form-control w-50" style="text-align: center; height: 30px" value="\${item.soLuong}" disabled >
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                        <div class="d-flex align-items-center">
                            <div class="ml-2">
                                <span>Thành tiền</span>
                                <h5 class="mb-0 pt-1 font-w500 text-black" >\${convertVND(item.tongTienHdct)}</h5>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                    `
                })
               cart.append(html);
               setTrangThaiHoaDon(idhd,data.trangThaiHoaDon)
           },
           error: function(xhr, status, error) {
               console.log("Có lỗi xảy ra")
           }
       });
   }
    // <div class="modal-footer" id="trangthaibutton">
    //     <button type="button" class="btn btn-default" data-bs-dismiss="modal">Hủy</button>
    //     <button type="button" class="btn btn-info">Nhận đơn</button>
    // </div>
   function setTrangThaiHoaDon(idhd,trangThaiHoaDon) {

        let trangThaiHtml = $("#trangthaibutton");
        trangThaiHtml.empty();
        trangThaiHtml.append('<button type="button" class="btn btn-default" data-bs-dismiss="modal">Quay lại</button>');
       if (trangThaiHoaDon=='Chờ nhận đơn'){
           trangThaiHtml.append(`
           <button type="button" class="btn btn-info" data-bs-dismiss="modal" onclick="thayDoiTrangThaiHoaDon(\${idhd},'HUYDON')">Huỷ đơn</button>
           <button type="button" class="btn btn-info" data-bs-dismiss="modal" onclick="thayDoiTrangThaiHoaDon(\${idhd},'DANHANDON')">Nhận đơn</button>
           `)
       }else if (trangThaiHoaDon=='Đã nhận đơn'){
          trangThaiHtml.append(`
           <button type="button" class="btn btn-info" data-bs-dismiss="modal" onclick="thayDoiTrangThaiHoaDon(\${idhd},'HUYDON')">Huỷ đơn</button>
           <button type="button" class="btn btn-info" data-bs-dismiss="modal" onclick="thayDoiTrangThaiHoaDon(\${idhd},'DANGGIAOHANG')">Đang giao hàng</button>
          `);
       }else if (trangThaiHoaDon=='Đang giao hàng'){
           // trangThaiHtml.append(`
           //          <button type="button" class="btn btn-info" data-bs-dismiss="modal" onclick="thayDoiTrangThaiHoaDon(\${idhd},'DANHANHANG')">Đã nhận hàng</button>
      // `);
       }


   }
   function thayDoiTrangThaiHoaDon(idhd,trangThai){
       loadingBody()
       let parameter = `?idhd=\${idhd}&trangthai=\${trangThai}`;
           var luuy = $("#luuy").val();
           parameter += `&luuy=\${encodeURIComponent(luuy)}`;
       $.ajax({
           url: `/api/hoadon/thaydoitrangthai`+parameter,
           method: 'GET',
           success: function (req) {
               endLoadingBody();
               showMessageHoaDon(trangThai);
               loadDsHoaDon();
           },
           error: function(xhr, status, error) {
               showError("Có lỗi xảy ra")
               console.log("Có lỗi xảy ra")
               endLoadingBody()
           }
       });
   }
   function showMessageHoaDon(trangThai){
           if (trangThai=='HUYDON'){
               showSuccess("Đã huỷ đơn")
           }else  if (trangThai=="DANHANDON"){
               showSuccess("Đã nhận đơn")
           }else if (trangThai=="DANGGIAOHANG"){
               showSuccess("Đơn hàng đang giao hàng")
           }else if (trangThai=="DANHANHANG"){
               showSuccess("Đơn hàng đã nhận")
           }

   }
   $("#tthd").change(function () {
       $("#searchhoadon").click();
   })
   $("#searchhoadon").click(function () {
       let ten = $("#tensearch").val();
       let trangThai = $('#tthd').val();
       // let trangThai = $('input[name=radio]:checked').val();
       $.ajax({
           url: `/api/hoadon/dshoadon?trangthai=\${trangThai}&ten=\${ten}`,
           method: 'GET',
           success: function (req) {
               console.log(req)
               loadTable(req)

           },
           error: function(xhr, status, error) {
               console.log("Có lỗi xảy ra")
           }
       });
   })
    $(".tthd").click(function () {
        $("#searchhoadon").trigger("click");
    })
</script>