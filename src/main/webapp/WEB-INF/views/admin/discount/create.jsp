<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Thêm khuyến mại</title>
<section>
    <div class="content-body">
        <div class="container-fluid">
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
                                                    <span class="text-danger"></span>
                                                </label>
                                                <div class="col-lg-6">
                                                    <input type="text" class="form-control" id="tenKM" name="val-text"
                                                           placeholder="Nhập vào">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-2 col-form-label" >Mã khuyến mãi <span
                                                        class="text-danger"></span>
                                                </label>
                                                <div class="col-lg-6">
                                                    <input type="text" class="form-control" id="maKM" name="val-text"
                                                           placeholder="Nhập vào" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-2 col-form-label" >Thời gian sử dụng mã
                                                    <span class="text-danger"></span>
                                                </label>
                                                <div class="col-lg-3">
                                                    <input type="datetime-local" class="form-control" id="ngayBatDau"
                                                           name="val-datetime-local">
                                                </div>
                                                <div class="col-lg-3">
                                                    <input type="datetime-local" class="form-control" id="ngayKetThuc"
                                                           name="val-datetime-local">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-2 col-form-label">Mô tả thêm <span
                                                        class="text-danger"></span>
                                                </label>
                                                <div class="col-lg-6">
                                                    <textarea class="form-control" id="moTa" name="val-text" rows="2"
                                                              placeholder="..."></textarea>
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
                                                <label class="col-lg-2 col-form-label">Loại giảm
                                                    | Mức giảm
                                                </label>
                                                <div class="col-lg-6">
                                                    <form action="#">
                                                        <div class="input-group mb-3">
                                                            <div class="input-group-prepend">
                                                                <select class="form-control default-select"
                                                                        id="loaiGiamGia">
                                                                    <option value="1" selected>Theo phần trăm</option>
                                                                    <option value="0">Theo mức tiền</option>
                                                                </select>
                                                            </div>
                                                            <input type="text" class="form-control" id="giaTriGiam"
                                                                   name="val-text" placeholder="Nhập giá trị" min="0">
                                                        </div>


                                                    </form>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-2 col-form-label" >Số lượng
                                                    <span class="text-danger"></span>
                                                </label>
                                                <div class="col-lg-6">
                                                    <input type="text" class="form-control" id="soLuong" name="val-text"
                                                           placeholder="Nhập vào" min="0">
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
                                            <div class="form-group row">
                                                <div class="col-lg-4 ml-auto">
                                                    <a href="#" class="btn btn-success" id="addDiscount">Xác nhận</a>
                                                    <a href="/admin/khuyen-mai" class="btn btn-danger">Hủy</a>
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
    var generatedNumbers = new Set();
    let pageCurrent = 1;

    var checkedValues = [];
    var size = checkedValues.length;
    ///pagination?page='+ pageCurrent+'&limit='+limit,
    var genMa = "KOCS"+generateNumber();
    $("#maKM").val(genMa);
    function loadKhuyenMai() {
        $.ajax({
            url: '/api/san-pham/find-all',
            method: 'GET',
            success: function (response) {
                let html = '';
                $.each(response, (index, item) => {
                    let isCheck = false;
                    checkedValues.forEach(function (x){
                        if (item.slug === x) {
                            isCheck = true;
                            return false;
                        }
                    });
                    if(item.khuyenMaiHienThiResponse == null){
                        html += `<tr>
                                 <td>
                                    <div class="form-check">
                                      <input class="form-check-input" type="checkbox" value="\${item.slug}" \${isCheck ? 'checked' : ''}>
                                    </div>
                                </td>
                                <td>\${item.ten}</td>
                                <td>\${formatNumber(item.gia)}</td>
                                <td>\${item.danhMuc.ten}</td>
                                <td>\${item.thuongHieu.ten}</td>
                           </tr>`;
                    }
                })
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
                console.log(error);
            }
        });
    }

    loadKhuyenMai();

    $("#getValue").click(function () {
        checkSearch=false;
        getvaluew();
    })
    $('#soLuongSanPham').text(size);

    function getvaluew() {
        if(!checkSearch){
            checkedValues = [];
        }
        $('.form-check-input:checked').each(function () {
            let val = $(this).val();
            checkedValues.push(val);
            //let isDuplicate = false;

            // checkedValues.forEach((item) => {
            //     console.log(item);
            //     if (item === val) {
            //         isDuplicate = true;
            //
            //         return false;
            //     }
            // })

            // if (!isDuplicate) {
            //     checkedValues.push(val);
            // }

        });
        $('#modalSanPham').modal('hide');
        size = checkedValues.length;
        $('#soLuongSanPham').text(size);
        console.log(checkedValues);
    };

    $("#addDiscount").click(function () {
        var maKM = $("#maKM").val();
        var tenKM = $("#tenKM").val();
        var loaiGiamGia = $('#loaiGiamGia option:selected').val();
        var ngayBatDau = $("#ngayBatDau").val();
        var ngayKetThuc = $("#ngayKetThuc").val();
        var soLuong = $("#soLuong").val();
        var giaTriGiam = $("#giaTriGiam").val();
        var moTa = $("#moTa").val();
        var ngayBatDauFMT = convertDateFormat(ngayBatDau);
        var ngayKetThucFMT = convertDateFormat(ngayKetThuc);
        var listSanPham = [];
        for (var x in checkedValues) {
            listSanPham.push(checkedValues[x]);
        }
        var km = {
            ma: maKM,
            ten: tenKM,
            loai: loaiGiamGia,
            soLuong: soLuong,
            giaTri: giaTriGiam,
            ngayBatDau: ngayBatDauFMT,
            ngayKetThuc: ngayKetThucFMT,
            trangThai: "ACTIVE",
            moTa: moTa,
            listSanPham: listSanPham,
        }
        console.log(km);
        if (validateForm()) {
            $.ajax({
                url: '/api/khuyen-mai/create',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(km),
                success: function (response) {
                    window.location.href = "/admin/khuyen-mai";
                    showSuccess("Thêm thành công");
                    // console.log(response)
                },
                error: function (xhr, status, error) {
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

    var checkSearch = false;
    function generateNumber() {
        var randomNumber;
        do {
                randomNumber = Math.floor(Math.random() * 999) + 1;
                randomNumber = randomNumber.toString().padStart(3, '0');
            } while (generatedNumbers.has(randomNumber));

            generatedNumbers.add(randomNumber);
            return randomNumber;
        }
    $(document).ready(function() {
        var searchButton = $('#searchButton');
        pageCurrent = 1;
        searchButton.on('keydown', function (event) {
            checkSearch=true;
            if (event.which === 13) {
                getvaluew();
                value = searchButton.val();
                if (value.trim()==="") {
                    loadKhuyenMai();
                } else {
                    loadSearch(value);
                }
            }
        });
        $('#ngayBatDau').attr('min', getCurrentDatetime());
        $('#ngayKetThuc').attr('min', getCurrentDatetime());
        $("#ngayBatDau").val(getCurrentDatetime());
    });
    var limit = 100;

    function loadSearch(value) {
        $.ajax({
            url: '/api/san-pham/search?q=' + value + '&limit=' + limit,
            method: 'GET',
            success: function (response) {
                let html = '';
                console.log(response.data);
                if(response.data.length == 0){
                    html += `
                            <tr>
                                <td colspan="5">
                                Sản phẩm tìm kiếm không tồn tại. Vui lòng tìm kiếm hoặc chọn sản phẩm khác!
                                </td>
                           </tr>
                        `
                }else{
                    $.each(response.data, (index, item) => {
                        let isCheck = false;
                        checkedValues.forEach(x => {
                            if (item.slug === x) {
                                isCheck = true;
                                return false;
                            }
                        });
                        if(item.khuyenMaiHienThiResponse == null){
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
                        if(response.data.length == 1 && item.khuyenMaiHienThiResponse != null){
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
                console.log(error);
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
            }else if(soLuong < 0 ){
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
        }
        if (ngayBatDau === "") {
            showError("Ngày bắt đầu trống. Vui lòng chọn giá trị");
            isValid = false;
        }
        // else{
        //     let ngayBD = new Date(ngayBatDau);
        //     let currentDate = new Date();
        //     if(ngayBD < currentDate){
        //         showError("Ngày bắt đầu không hợp lệ. Vui lòng chọn ngày >= ngày hiện tại");
        //         isValid = false;
        //     }
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

</script>