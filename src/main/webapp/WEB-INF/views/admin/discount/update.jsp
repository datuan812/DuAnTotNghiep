<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05-11-2023
  Time: 8:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Cập nhật khuyến mại</title>
<section>
    <div class="content-body">
        <div class="container-fluid">

            <!-- row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Thông tin cơ bản</h4>
                        </div>
                        <div class="card-body">
                            <div class="form-validation">
                                <form class="form-valide" action="#" method="post">
                                    <div class="row">
                                        <div class="col-xl-12">
                                            <div class="form-group row">
                                                <label class="col-lg-2 col-form-label" >Tên khuyến mãi
                                                    <span class="text-danger">*</span>
                                                </label>
                                                <div class="col-lg-6">
                                                    <input type="text" class="form-control" id="tenKM" name="val-text" placeholder="Nhập vào">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-2 col-form-label" >Mã khuyến mãi <span class="text-danger">*</span>
                                                </label>
                                                <div class="col-lg-6">
                                                    <input type="text" class="form-control" id="maKM" name="val-text" placeholder="Nhập vào" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-2 col-form-label" >Thời gian sử dụng mã
                                                    <span class="text-danger">*</span>
                                                </label>
                                                <div class="col-lg-3">
                                                    <input type="datetime-local" class="form-control" id="ngayBatDau" name="val-datetime-local" readonly >
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="datetime-local" class="form-control" id="ngayKetThuc" name="val-datetime-local">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-2 col-form-label" >Mô tả thêm <span class="text-danger"></span>
                                                </label>
                                                <div class="col-lg-6">
                                                    <textarea class="form-control" id="moTa" name="val-text" rows="2" placeholder="..."></textarea>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="card-header">
                            <h4 class="card-title">Thiết lập giảm giá</h4>
                        </div>
                        <div class="card-body">
                            <div class="form-validation">
                                <form class="form-valide" action="#" method="post">
                                    <div class="row">
                                        <div class="col-xl-12">
                                            <div class="form-group row">
                                                <label class="col-lg-2 col-form-label" >Loại giảm giá | Mức giảm
                                                </label>
                                                <div class="col-lg-6">
                                                    <form action="#">
                                                        <div class="input-group mb-3">
                                                            <div class="input-group-prepend">
                                                                <select  class="form-control default-select" id="loaiGiamGia" name="loaiGiamGia">
                                                                    <option selected="" disabled>Chọn loại</option>
                                                                    <option value="1">Theo phần trăm</option>
                                                                    <option value="0">Theo mức tiền</option>
                                                                </select>
                                                            </div>
                                                            <input type="text" class="form-control" id="giaTriGiam" name="val-text" placeholder="Nhập giá trị" min="0">
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-2 col-form-label">Số lượng <span class="text-danger"></span>
                                                </label>
                                                <div class="col-lg-6">
                                                    <input type="text" class="form-control" id="soLuong" name="val-text" placeholder="Nhập số lượng"  min="0">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-2 col-form-label" >Sản phẩm áp dụng <span
                                                        class="text-danger"></span>
                                                </label>
                                                <div class="col-lg-6">
                                                    <div class="col-lg-12 ml-auto" style="padding-left: 0px;">
                                                        <button type="button" class="btn btn-primary light mb-2"
                                                                data-toggle="modal" data-target=".bd-example-modal-lg">
                                                            Thêm sản phẩm
                                                        </button>
                                                        <div class="modal fade bd-example-modal-lg" tabindex="-1"
                                                             role="dialog" aria-hidden="true" id="modalSanPham">
                                                            <div class="modal-dialog modal-xl">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title">Danh sách sản phẩm</h5>
                                                                        <div class="group123 ">
                                                                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" aria-hidden="true"
                                                                                 viewBox="0 0 512 512">
                                                                                <style>svg {
                                                                                    fill: #ebeef4
                                                                                }</style>
                                                                                <path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/>
                                                                            </svg>
                                                                            <input placeholder="Tìm sản phẩm" type="search" class="inputghichu w-100" id="searchButton">
                                                                        </div>
                                                                        <div>
                                                                            <button type="button" class="close"
                                                                                    data-dismiss="modal">
                                                                                <span>&times;</span>
                                                                            </button>
                                                                        </div>

                                                                    </div>
                                                                    <div style="max-height: 550px; overflow-y: scroll;">
                                                                        <div class="modal-body">
                                                                            <div class="d-flex justify-content-between">
                                                                                <hr>
                                                                                <table class="table table-hover table-striped">
                                                                                    <thead>
                                                                                    <tr>
                                                                                        <th scope="col"><div class="custom-control custom-checkbox ml-2">
                                                                                            <input type="checkbox" class="custom-control-input" id="checkAll" required="">
                                                                                            <label class="custom-control-label" for="checkAll"></label>
                                                                                        </div></th>
                                                                                        <th scope="col">Tên SP</th>
                                                                                        <th scope="col">Giá</th>
                                                                                        <th scope="col">Danh muc</th>
                                                                                        <th scope="col">Thương hiệu</th>
                                                                                    </tr>
                                                                                    </thead>
                                                                                    <tbody class="tbody-product">
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                            <div>
                                                                                <ul id="pagination" class="d-flex justify-content-center"></ul>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button"
                                                                                class="btn btn-danger light"
                                                                                data-dismiss="modal">Đóng
                                                                        </button>
                                                                        <button type="button" class="btn btn-primary" id="getValue" data-dismiss="modal">
                                                                            Xác nhận
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-2" >
                                                    <span>Số sản phẩm đã chọn:</span>
                                                </label>
                                                <div class="col-lg-6">
                                                    <label id="soLuongSanPham">

                                                    </label>
                                                    <span >sản phẩm</span>
                                                </div>
                                            </div>
<%--                                            <div class="form-group row">--%>
<%--                                                <label class="col-lg-2 col-form-label" for="trangThai">Trạng thái--%>
<%--                                                </label>--%>
<%--                                                <div class="col-lg-3">--%>
<%--                                                    <form action="#">--%>
<%--                                                        <div class="input-group mb-3">--%>
<%--                                                            <div class="input-group-prepend">--%>
<%--                                                                <select  class="form-control default-select" id="trangThai" name="trangThai">--%>
<%--                                                                    <option value="ACTIVE">Đang diễn ra</option>--%>
<%--                                                                    <option value="DELETE">Dừng khuyến mãi</option>--%>
<%--                                                                    <option value="EXPIRED">Đã kết thúc</option>--%>
<%--                                                                    <option value="UPCOMING">Sắp diễn ra</option>--%>
<%--                                                                </select>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </form>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>

                                            <%--                                            <div class="mb-3">--%>
                                            <%--                                                <div class="mb-3">Sản phẩm khuyến mại:</div>--%>

                                            <%--                                                <table class="table table-hover table-striped">--%>
                                            <%--                                                    <tbody class="tbody-product-select">--%>

                                            <%--                                                    </tbody>--%>
                                            <%--                                                </table>--%>
                                            <%--                                            </div>--%>

                                            <div class="form-group row">
                                                <div class="col-lg-4 ml-auto">
                                                    <a href="#" class="btn btn-success" id="update">Xác nhận</a>
                                                    <a href="/admin/khuyen-mai" class="btn btn-danger">Hủy</a>
                                                    <!-- <button type="button" class="btn btn-primary">Xác nhận</button> -->
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>

    var url = window.location.pathname.split("/");
    var maKM = url[url.length - 1];
    var listSlugSanPham = [];
    var size = 0;
    var idKM;
    var trangThai = '';
    $.ajax({
        url: '/api/khuyen-mai/detail/'+maKM,
        method: 'GET',
        success: function(data) {
            console.log(data);
            $("#maKM").val(data.ma);
            $("#tenKM").val(data.ten);
            $("#ngayBatDauFMT").val(data.ngayBatDau);
            $("#ngayketThucFMT").val(data.ngayKetThuc);
            $("#giaTriGiam").val(data.giaTri);
            $("#soLuong").val(data.tong);
            $("#moTa").text(data.moTa);
            $("#loaiGiamGia").val(data.loai).change();
            var ngayBatDauStr = displayDateFormat(data.ngayBatDau);
            $("#ngayBatDau").val(ngayBatDauStr);
            var ngayKetThucStr = displayDateFormat(data.ngayKetThuc);
            $("#ngayKetThuc").val(ngayKetThucStr);
            $("#trangThai").val(data.trangThai).change();
            trangThai = data.trangThai;
            data.listSanPham.forEach(function (item) {
                listSlugSanPham.push(item.sanPhamResponse.slug);
            });
            size = listSlugSanPham.length;
            $("#soLuongSanPham").text(size)
            idKM = data.id;

            var dsSanPhamKhuyenMai = data.listSanPham;
            console.log(dsSanPhamKhuyenMai)
            // let html = '';
            // var i = 0
            // dsSanPhamKhuyenMai.forEach(function (item){
            //     i++;
            //     html +=  `<tr>
            //                     <td>\${i}</td>
            //                     <td>
            //                         <img src='/repository/\${item.sanPhamResponse.anh[0].hinhAnh}' style="width: 80px;">
            //                     </td>
            //                     <td>\${item.sanPhamResponse.ten}</td>
            //
            //                 </tr>`
            //
            // })
            // $('.tbody-product-select').html(html);
        },
        error: function(xhr, status, error) {
            console.log(xhr);
            showError(xhr.responseJSON.error)
        }
    });

    function displayDateFormat(inputDate) {
        var today = new Date(inputDate);
        var year = today.getFullYear();
        var month = (today.getMonth() + 1).toString().padStart(2, '0');
        var day = today.getDate().toString().padStart(2, '0');
        var hours = today.getHours().toString().padStart(2, '0');
        var minutes = today.getMinutes().toString().padStart(2, '0');
        return `\${year}-\${month}-\${day}T\${hours}:\${minutes}`;
    }

    var checkedValues = listSlugSanPham;

    $("#getValue").click(function (){
        checkSearch=false;
        getvaluew();
    });
    $('#soLuongSanPham').text(size);
    function getvaluew(){
        if(!checkSearch){
            checkedValues = [];
        }
        $('.form-check-input:checked').each(function () {
            let val = $(this).val();

            if (checkedValues.length === 0) {
                checkedValues.push(val);
            } else {
                let isDuplicate = false;

                for (const x in checkedValues) {
                    if (checkedValues[x] === val) {
                        isDuplicate = true;
                        break;
                    }
                }

                if (!isDuplicate) {
                    checkedValues.push(val);
                }
            }
        });
        listSlugSanPham = checkedValues;
        $('#modalSanPham').modal('hide');
        size = checkedValues.length;
        $('#soLuongSanPham').text(size);
        console.log(checkedValues);
    };



    $("#update").click(function (){
        var maKM = $("#maKM").val();
        var tenKM = $("#tenKM").val();
        var loaiGiamGia = $('#loaiGiamGia option:selected').val();
        var soLuong = $("#soLuong").val();
        var giaTriGiam = $("#giaTriGiam").val();
        var moTa = $("#moTa").val();
        var ngayBatDau = $("#ngayBatDau").val();
        var ngayKetThuc = $("#ngayKetThuc").val();
        var ngayBatDauFMT = convertDateFormat(ngayBatDau);
        var ngayKetThucFMT = convertDateFormat(ngayKetThuc);
        var trangThai = trangThai;
        var km = {
            id:idKM,
            ma: maKM,
            ten: tenKM,
            loai : loaiGiamGia,
            soLuong: soLuong,
            giaTri: giaTriGiam,
            ngayBatDau: ngayBatDauFMT,
            ngayKetThuc:  ngayKetThucFMT,
            moTa: moTa,
            trangThai: trangThai,
            listSanPham: checkedValues,
        }
        console.log(km)
        if (validateForm()) {

            $.ajax({
                url: '/api/khuyen-mai/update/'+maKM,
                method: 'PUT',
                contentType: 'application/json',
                data: JSON.stringify(km),
                success: function(response) {
                    window.location.href = "/admin/khuyen-mai";
                    showSuccess("Cập nhật thành công!");
                },
                error: function(xhr, status, error) {
                    console.log(xhr);
                    showError(xhr.responseJSON.error)
                }
            });
        }
    });

    function convertDateFormat(inputDate) {
        var date = new Date(inputDate);
        return date;
    }

    function loadKhuyenMai() {
        $.ajax({
            url: '/api/san-pham/find-all',
            method: 'GET',
            success: function (response) {
                let html = '';
                console.log(response);
                $.each(response, (index, item) => {

                    if(item.khuyenMaiHienThiResponse == null || (item.khuyenMaiHienThiResponse != null && item.khuyenMaiHienThiResponse.ma === maKM)) {
                        let isCheck = false;
                        listSlugSanPham.forEach(x => {
                            if (item.slug === x) {
                                isCheck = true;
                                return false;
                            }
                        });

                        html += `<tr>
                                     <td>
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" value="\${item.slug}" \${isCheck ? 'checked' : ''}>
                                        </div>
                                    </td>
                                    <td>\${item.ten}</td>
                                    <td>\${formatNumber(item.gia)}<span>đ</span></td>
                                    <td>\${item.danhMuc.ten}</td>
                                    <td>\${item.thuongHieu.ten}</td>
                               </tr>`;
                    }

                });

                $('.tbody-product').html(html);
            },
            error: function (xhr, status, error) {
                console.log(xhr);
                showError(xhr.responseJSON.error)
            }
        });
    }
    loadKhuyenMai();

    function validateForm() {
        let isValid = true;
        let ngayBatDau = $("#ngayBatDau").val();
        let ngayKetThuc = $("#ngayKetThuc").val();
        let loaiGiamGia = $('#loaiGiamGia option:selected').val();
        let giaTriGiam = $("#giaTriGiam").val();
        let soLuong = $("#soLuong").val();

        if(checkedValues.length == 0){
            showError("Vui lòng chọn sản phảm!");
            isValid = false;
        }

        if(soLuong ===""){
            showError("Số lượng trống. Vui lòng nhập giá trị!");
            isValid = false;
        }else{
            if(isNaN(soLuong)){
                showError("Số lượng không hợp lệ. Vui lòng nhập giá trị là số");
                isValid = false;
            }else
            if(soLuong < 0 ){
                showError("Số lượng không hợp lệ. Vui lòng nhập số lượng > 0!");
                isValid = false;
            }
        }
        if(giaTriGiam === ""){
            showError("Giá trị giảm trống. Vui lòng nhập giá trị!");
            isValid = false;
        }else{
            if(loaiGiamGia == 1){
                if(isNaN(giaTriGiam)){
                    showError("Giá trị giảm không hợp lệ. Vui lòng nhập giá trị là số");
                    isValid = false;
                }else if(giaTriGiam <=0 || giaTriGiam >= 100){
                    showError("Giá trị giảm không hợp lệ. Vui lòng nhập giá trị > 0 & < 100!");
                    isValid = false;
                }
            }else{
                if(isNaN(giaTriGiam)){
                    showError("Giá trị giảm không hợp lệ. Vui lòng nhập giá trị là số");
                    isValid = false;
                }else if(giaTriGiam <= 1000){
                    showError("Giá trị giảm không hợp lệ. Vui lòng nhập giá trị > 1000!");
                    isValid = false;
                }
            }
        }
        if (ngayKetThuc === "") {
            showError("Ngày kết thúc trống. Vui lòng chọn giá trị");
            isValid = false;
        } else {
            if (ngayBatDau > ngayKetThuc) {
                showError("Ngày kết thúc không hợp lệ. Vui lòng chọn ngày kết thúc > ngày bắt đầu");
                isValid = false;
            }
            let currentDate = new Date();
            let ngayKT = new Date(ngayKetThuc);
            if(ngayKT < currentDate){
                showError("Ngày kết thúc không hợp lệ. Vui lòng chọn ngày >= ngày hiện tại");
                isValid = false;
            }
        }
        if (ngayBatDau === "") {
            showError("Ngày bắt đầu trống. Vui lòng chọn giá trị");
            isValid = false;
        }
        // else{
        // let ngayBD = new Date(ngayBatDau);
        // let currentDate = new Date();
        // if(ngayBD < currentDate){
        //     showError("Ngày bắt đầu không hợp lệ. Vui lòng chọn ngày >= ngày hiện tại");
        //     isValid = false;
        // }
        // }
        if ($("#tenKM").val().trim() === "") {
            showError("Tên khuyến mại trống. Vui lòng nhập tên khuyến mại!");
            isValid = false;
        }
        return isValid;
    }
    function formatNumber(number) {
        if (isNaN(number) || number === null) {
            return "0";
        }
        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    }
    var checkSearch = false;
    $(document).ready(function() {
        var searchButton = $('#searchButton');
        pageCurrent = 1;
        searchButton.on('keydown', function (event) {
            checkSearch=true;
            if (event.which === 13) {
                value = searchButton.val();
                getvaluew();
                if (value.trim()==="") {
                    loadKhuyenMai();
                } else {
                    loadSearch(value);
                }
            }
        });
        $('#ngayBatDau').attr('min', getCurrentDatetime());
        $('#ngayKetThuc').attr('min', getCurrentDatetime());
        // $("#ngayBatDau").val(getCurrentDatetime());
    });
    var limit = 100;

    function loadSearch(value) {
        $.ajax({
            url: '/api/san-pham/search?q=' + value + '&limit=' + limit,
            method: 'GET',
            success: function (response) {
                let html = '';
                if(response.data.length == 0){
                    html += `
                            <tr>
                                <td colspan="5">
                                Sản phẩm tìm kiếm không tồn tại. Vui lòng tìm kiếm hoặc chọn sản phẩm khác!
                                </td>
                           </tr>
                        `
                }else {
                    $.each(response.data, (index, item) => {
                        if (item.khuyenMaiHienThiResponse == null || (item.khuyenMaiHienThiResponse != null && item.khuyenMaiHienThiResponse.ma === maKM)) {
                            let isCheck = false;
                            listSlugSanPham.forEach(x => {
                                if (item.slug === x) {
                                    isCheck = true;
                                    return false;
                                }
                            });

                            html += `<tr>
                                     <td>
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" value="\${item.slug}" \${isCheck ? 'checked' : ''}>
                                        </div>
                                    </td>
                                    <td>\${item.ten}</td>
                                    <td>\${formatNumber(item.gia)}<span>đ</span></td>
                                    <td>\${item.danhMuc.ten}</td>
                                    <td>\${item.thuongHieu.ten}</td>
                               </tr>`;
                        }
                        if(response.data.length == 1 && item.khuyenMaiHienThiResponse != null && item.khuyenMaiHienThiResponse.ma != maKM){
                            html += `
                            <tr>
                                <td colspan="5">
                                Sản phẩm tìm kiếm đang chạy khuyến mại. Vui lòng tìm kiếm hoặc chọn sản phẩm khác!
                                </td>
                           </tr>
                        `
                        }
                    })
                }
                $('.tbody-product').html(html);
                // $('#pagination').twbsPagination({
                //     first: "<<",
                //     prev: "<",
                //     next: ">",
                //     last: ">>",
                //     visiblePages: 5,
                //     totalPages: response.meta.totalPage,
                //     startPage: response.meta.pageCurrent,
                //     onPageClick: function (event, page) {
                //         if(page !== pageCurrent){
                //             event.preventDefault();
                //             pageCurrent = page;
                //             loadKhuyenMai();
                //         }
                //     },
                // });
            },
            error: function (xhr, status, error) {
                console.log(xhr);
                showError(xhr.responseJSON.error)
            }
        });
    }
    function getCurrentDatetime() {
        var today = new Date();
        var year = today.getFullYear();
        var month = (today.getMonth() + 1).toString().padStart(2, '0');
        var day = today.getDate().toString().padStart(2, '0');
        var hours = today.getHours().toString().padStart(2, '0');
        var minutes = today.getMinutes().toString().padStart(2, '0');
        return `\${year}-\${month}-\${day}T\${hours}:\${minutes}`;
    }

</script>