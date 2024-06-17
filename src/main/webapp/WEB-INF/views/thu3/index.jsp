<%--
  Created by IntelliJ IDEA.
  User: sktfk
  Date: 27/11/2023
  Time: 10:41 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="width: 700px">
        <div class="modal-content"  >
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Trạng thái giao hàng</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" style="height: 500px;">
                <div class="mb-3">
                    <p>Địa chỉ giao hàng : <span id="dc"></span></p>
                </div>
                    <div class="mb-3">
                        <label for="tenTrangThai" class="form-label">Trạng thái</label>
                        <input type="email" class="form-control" id="tenTrangThai" aria-describedby="emailHelp">
                        <div id="emailHelp" class="form-text">Thêm trạng thái giao hàng của mã giao hàng</div>
                        <button type="button" class="btn btn-outline-success" id="themtrangthai" onclick="themTrangThai()">Thêm</button>
                    </div>

                <div id="dsTrangThaiGiaoHang">

                </div>
            </div>
            <div class="modal-footer" id="thaydoitrangthai">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="ghtc" onclick="thayDoiTrangThai('DANHANHANG')">Giao hàng thành công</button>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <table class="table table-striped w-100"  id="tblgiaohang">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Mã giao hàng</th>
            <th scope="col">Mã hoá đơn</th>
            <th scope="col">Ngày giao hàng</th>
            <th scope="col">Tên người nhận</th>
            <th scope="col">Số điện thoại</th>
            <th scope="col">Trạng thái</th>
            <th scope="col"></th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th scope="row">1</th>
            <td>Mark</td>
            <td>Otto</td>
        </tr>

        </tbody>
    </table>
</div>
<script>

    var maGiaoHangIndex ;
    var trangThaiThis ;
   async function loadTrangThaiGiaoHang(maGiaoHang,trangThai) {
      await  $.ajax({
            url: '/api/thu3/dstrangthai/'+maGiaoHang,
            method: 'GET',
            contentType: 'application/json',
            success: function (response) {
                console.log(response)
                var ds = $("#dsTrangThaiGiaoHang");
                ds.empty();
                var dstrangthai = $("#thaydoitrangthai");
                dstrangthai.empty();
                dstrangthai.append(`
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                `)
                response.forEach(function (item){
                    ds.append(`
                        <div class="card mb-3">
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <div class="d-flex flex-row align-items-center">
                                    <div>
                                        <h5>\${item.tenTrangThai}</h5>
                                        <p class="small mb-0">\${item.ngayTao}</p>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                        `);
                })
                if (trangThai=='Đang giao hàng'){
                        dstrangthai.append(`
                                        <button type="button" class="btn btn-primary ghtc" data-bs-dismiss="modal" onclick="thayDoiTrangThai('HUYDON',2)">Lỗi giao hàng nhanh</button>
                                        <button type="button" class="btn btn-primary ghtc" data-bs-dismiss="modal" onclick="thayDoiTrangThai('HUYDON',1)">Khách không nhận</button>
                                        <button type="button" class="btn btn-primary ghtc" data-bs-dismiss="modal" onclick="thayDoiTrangThai('DANHANHANG','')">Giao hàng thành công</button>
                        `)
                }
            },
            error: function (xhr, status, error) {
                showError("Lỗi ")
                console.log('Có lỗi xảy ra: ' + error);
            }
        });
    }
    $(document).on("click",".searchTrangThai",async function() {
        let maGiaoHang = $(this).val();
        maGiaoHangIndex= maGiaoHang;
        let diaChi = $(this).attr("data-diachi");
        let idhd = $(this).attr("data-idhd");
        let trangthai = $(this).attr("data-trangthai");
        if (trangthai!="Đang giao hàng"){
            $("#themtrangthai").hide();
        }else{
            $("#themtrangthai").show();
        }
        trangThaiThis =trangthai;
            $("#dc").text(diaChi)
      await  loadTrangThaiGiaoHang(maGiaoHang,trangthai)
        $(".ghtc").val(idhd)

    });
    function thayDoiTrangThai(trangthai,check) {
        let idhd = $(".ghtc:first").val()
        $.ajax({
            url: `/api/hoadon/thaydoitrangthai?idhd=\${idhd}&trangthai=\${trangthai}&thu3=\${check}`,
            method: 'GET',
            success: function (req) {
                showSuccess("Thành công")
                loadTable();
            },
            error: function(xhr, status, error) {
                console.log("Có lỗi xảy ra")
            }
        });
    }
    function themTrangThai(){

        $.ajax({
            url:'api/thu3/themtrangthai/'+maGiaoHangIndex+"?tentrangthai="+$("#tenTrangThai").val(),
            method: 'GET',
            contentType: 'application/json',
            success: function (response) {
                $("#tenTrangThai").val("")
                loadTrangThaiGiaoHang(maGiaoHangIndex,trangThaiThis)
                showSuccess("Thêm thành công")
            },
            error: function (xhr, status, error) {
                showError("Lỗi ")
                console.log('Có lỗi xảy ra: ' + error);
            }
        });

    }
        loadTable()
        function loadTable() {
            $.ajax({
                url: '/api/thu3',
                method: 'GET',
                contentType: 'application/json',
                success: function (response) {
                    console.log(response)
                    $('#tblgiaohang').DataTable({
                        destroy: true,
                        pageLength: 10,
                        responsive:true,
                        data: response,
                        order:[[3,"desc"],[2,"desc"]],
                        columns: [
                            {
                                data: null,
                                render: function(data, type, row, meta) {
                                    // Nếu type là 'display', hiển thị số thứ tự, nếu không, trả về dữ liệu gốc
                                    return type === 'display' ? meta.row + 1 : data;
                                }
                            },
                            { data: 'ma' },
                            { data: 'maGiaoHang' },
                            {
                                data: 'thoiGianDat',
                                render: function(data, type, row) {
                                    return `<span>\${formatDateInput(data)} </span>`;
                                }
                            },
                            { data: 'tenNguoiNhan' },
                            { data: 'soDienThoai' },
                            { data: 'trangThai' },
                            {
                                data: 'maGiaoHang',
                                render: function(data, type, row) {
                                    return `<button type='button' class='btn btn-primary searchTrangThai' data-bs-toggle='modal' data-bs-target='#exampleModal' value='\${row.id}'
                                data-diachi='\${row.diaChi}'
                                data-idhd='\${row.id}'
                                data-trangthai='\${row.trangThai}'
                                >Xem</button>`;
                                }
                            }


                        ],
                    })

                    //
                },
                error: function (xhr, status, error) {
                    showError("Lỗi ")
                    console.log('Có lỗi xảy ra: ' + error);
                }
            });
        }


</script>
