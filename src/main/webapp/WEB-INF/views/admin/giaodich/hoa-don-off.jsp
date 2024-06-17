
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Hóa đơn</title>
</head>
<body>
<div class="content-body" >
    <div class="container-fluid">

        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link " aria-current="page" href="/admin/giao-dich/hoa-don">Online</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="/admin/giao-dich/hoa-don-off">Offline</a>
            </li>
        </ul>

        <div class="card card-body hstack gap-2 mt-4">
            <div class="p-2">

                <a class="Btnaddkh text-light" id="create-hoa-don" type="button" style="text-decoration: none">Add
                    <svg xmlns="http://www.w3.org/2000/svg" class="svg" height="1em" viewBox="0 0 448 512"><style>svg{fill:#ffffff}</style>
                        <path d="M256 80c0-17.7-14.3-32-32-32s-32 14.3-32 32V224H48c-17.7 0-32 14.3-32 32s14.3 32 32 32H192V432c0 17.7 14.3 32 32 32s32-14.3 32-32V288H400c17.7 0 32-14.3 32-32s-14.3-32-32-32H256V80z"/></svg>
                </a>
            </div>

            <div class="p-2">
                <button type="button" class="buttonExport" id="exportButton">
                    <span class="button__text">Export</span>
                    <span class="button__icon"><svg class="svgExport" data-name="Layer 2" id="bdd05811-e15d-428c-bb53-8661459f9307" viewBox="0 0 35 35" xmlns="http://www.w3.org/2000/svg"><path d="M17.5,22.131a1.249,1.249,0,0,1-1.25-1.25V2.187a1.25,1.25,0,0,1,2.5,0V20.881A1.25,1.25,0,0,1,17.5,22.131Z"></path><path d="M17.5,22.693a3.189,3.189,0,0,1-2.262-.936L8.487,15.006a1.249,1.249,0,0,1,1.767-1.767l6.751,6.751a.7.7,0,0,0,.99,0l6.751-6.751a1.25,1.25,0,0,1,1.768,1.767l-6.752,6.751A3.191,3.191,0,0,1,17.5,22.693Z"></path><path d="M31.436,34.063H3.564A3.318,3.318,0,0,1,.25,30.749V22.011a1.25,1.25,0,0,1,2.5,0v8.738a.815.815,0,0,0,.814.814H31.436a.815.815,0,0,0,.814-.814V22.011a1.25,1.25,0,1,1,2.5,0v8.738A3.318,3.318,0,0,1,31.436,34.063Z"></path></svg></span>
                </button>
            </div>
            <div class="p-2">
                <a type="button" class="buttonPoint text-decoration-none"   href="/admin/lich-su-tich-diem">
                    <span class="button__text2">Point history</span>
                    <span class="button__icon2">
                                <svg class="svgPoint" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512">
                                    <path d="M464 256A208 208 0 1 1 48 256a208 208 0 1 1 416 0zM0 256a256 256 0 1 0 512 0A256 256 0 1 0 0 256zM232 120V256c0 8 4 15.5 10.7 20l96 64c11 7.4 25.9 4.4 33.3-6.7s4.4-25.9-6.7-33.3L280 243.2V120c0-13.3-10.7-24-24-24s-24 10.7-24 24z"/>
                                </svg>
                    </span>
                </a>
            </div>

            <div class="p-2 ms-auto">
                <div class="InputContainer">
                    <input type="text" id="searchAll" name="text" class="input" placeholder="Search">

                    <div class="border"></div>

                    <button id="searchButton" class="micButton">
                        <svg viewBox="0 0 512 512" class="searchIcon">
                            <path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"></path>
                        </svg>
                    </button>
                </div>
            </div>
        </div>
        <div class="card" style="box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
        padding: 20px; background-color: #fff">
            <div class="row ">
                <div class="col">
                    <div class="d-flex justify-content-between">
                        <h4>Danh sách hóa đơn</h4>
                        <select name="" id="trangThai" class="form-control" style="width: 150px">
                            <option value="TREO">Chờ thanh toán</option>
                            <option value="THANHCONG">Đã thanh toán</option>
                            <option value="HUYDON">Hủy đơn</option>
                        </select>
                    </div>
                </div>
            </div>
            <hr>
            <div class="d-flex justify-content-between">
                <hr>
                <table class="table table-hover" id="tblHoaDonOff">
                    <thead>
                    <tr class="text-center">
                        <th scope="col">STT</th>
                        <th scope="col">Mã Hóa đơn</th>
                        <th scope="col">Khách hàng</th>
                        <th scope="col">Nhân viên</th>
                        <th scope="col">Ngày mua</th>
                        <th scope="col">Tổng tiền hàng</th>
                        <th scope="col">Tiền khách trả</th>
                        <th scope="col">Tiền thừa</th>
                        <th scope="col">Thao tác</th>
                    </tr>
                    </thead>
                    <tbody class="tbody-hoadon">
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
    $('#create-hoa-don').on('click', function (e){
        e.preventDefault();
        let data = {};
        data['maNhanVien'] = ma;
        data['trangThai'] = "TREO";
        data['loai'] = "OFFLINE";

        $.ajax({
            url: "/api/hoa-don-off",
            method: "POST",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: JSON.stringify(data),
            success: (response) => {
                showSuccess("Thêm hóa đơn thành công");
                window.location.href = `/admin/giao-dich/hoa-don-off/create/\${response.ma}`;
            },
            error: (error) => {
                console.log(error);
            }
        });
    })

    function formatNumber(number) {
        return new Intl.NumberFormat('vi-VN').format(number);
    }

    var trangThai = $('#trangThai option:selected').val();

    function getHoaDon(value){
        $.ajax({
            url: "/api/hoa-don-off/find-by-status?trangThai=" + value,
            method: "GET",
            success: (response) => {
                console.log(response)
                var tbody = $('#tblHoaDonOff tbody');
                tbody.empty();

                if (response.length === 0) {
                    var noDataMessage = `
                    <tr class="text-center">
                        <td colspan="9">Không có hóa đơn nào</td>
                    </tr>
                `;
                    tbody.append(noDataMessage);
                } else {
                    var index = 0;
                    response.forEach(function (item) {
                        if(item.tienKhachTra === null){
                            item.tienKhachTra = 0;
                        }
                        var row = `
                        <tr class="text-center">
                            <td>\${++index}</td>
                            <td>\${item.ma}</td>
                            <td>\${item.tenKhachHang}</td>
                            <td>\${item.tenNhanVien}</td>
                            <td>\${getFormattedDate(item.ngayTao)}</td>
                            <td>\${formatNumber(item.tongTienHang)} đ</td>
                            <td>\${formatNumber(item.tienKhachTra)} đ</td>
                            <td>\${formatNumber(item.tienKhachTra === 0 ? 0 : item.tienKhachTra - (item.tongTienHang - item.tienGiamGia))} đ</td>
                            <td>
                                <a href="/admin/giao-dich/hoa-don-off/create/\${item.ma}" class="btn btn-info create">Chi tiết</a>
                                <button class="btn btn-danger btn-delete" value="\${item.ma}">Xóa</button>
                                <a href="/admin/giao-dich/detail/\${item.ma}" class="btn btn-info detail">Chi tiết</a>
                                <a href="/admin/giao-dich/hoa-don-huy/\${item.ma}" class="btn btn-info detail-huy">Chi tiết</a>
                            </td>
                        </tr>
                    `;
                        tbody.append(row);
                    });
                }

                if (value === "TREO") {
                    $(".detail").hide();
                    $(".detail-huy").hide();
                }
                if (value === "THANHCONG") {
                    $(".btn-delete").hide();
                    $(".create").hide();
                    $(".detail-huy").hide();
                }
                if (value === "HUYDON") {
                    $(".btn-delete").hide();
                    $(".create").hide();
                    $(".detail").hide();
                }
            },
            error: (error) => {
                console.log(error);
            }
        });

    }
    getHoaDon(trangThai);

    $("#trangThai").change(function () {
        var selectedValue = $(this).val();
        trangThai = selectedValue;
        getHoaDon(trangThai);
    });

    $('.tbody-hoadon').on('click', (e) => {
        if ($(e.target).hasClass('btn-delete') && !$(e.target).is(":hidden")) {
            let ma = $(e.target).val();
            showConfirm("Bạn có muốn xóa không?", ma)
                .then((confirmed) => {
                    if (confirmed) {
                        $.ajax({
                            url: '/api/hoa-don-off/' + ma,
                            method: 'DELETE',
                            success: function (req) {
                                getHoaDon(trangThai);
                                showSuccess("Xoá thành công!");
                            },
                            error: function (xhr, status, error) {
                                showError("Xóa thất bại");
                            }
                        });
                    }
                })
        }
    })

    $("#exportButton").click(function () {
        var selectedValue = $("#trangThai").val();

        if (selectedValue === "THANHCONG") {
            window.location.href = "/api/hoa-don-off/exportToExcel?trangThai=" + selectedValue;
        } else {
            showError("Bạn chỉ có thể xuất hóa đơn đã thanh toán!");
        }
    });

    $('#searchButton').on('click', (e) =>{
        e.preventDefault();
        param = $('#searchAll').val().trim();
        if(param != ''){
            search(param);
        }else{
            getHoaDon(trangThai);
        }
    })

    function search(param){
        $.ajax({
            url: "/api/hoa-don-off/search?q=" + param + '&trangThai=' + trangThai,
            method: "GET",
            success: (response) => {
                console.log(response)
                var tbody = $('#tblHoaDonOff tbody');
                tbody.empty();

                if (response.length === 0) {
                    var noDataMessage = `
                    <tr class="text-center">
                        <td colspan="9">Không có hóa đơn nào</td>
                    </tr>
                `;
                    tbody.append(noDataMessage);
                } else {
                    var index = 0;
                    response.forEach(function (item) {
                        var row = `
                        <tr class="text-center">
                            <td>\${++index}</td>
                            <td>\${item.ma}</td>
                            <td>\${item.tenKhachHang}</td>
                            <td>\${item.tenNhanVien}</td>
                            <td>\${getFormattedDate(item.ngayTao)}</td>
                            <td>\${formatNumber(item.tongTienHang != null ? item.tongTienHang : 0)} đ</td>
                            <td>\${formatNumber(item.tienKhachTra != null ? item.tienKhachTra : 0)} đ</td>
                            <td>\${formatNumber(item.tienKhachTra - (item.tongTienHang - item.tienGiamGia))} đ</td>
                            <td>
                                <a href="/admin/giao-dich/hoa-don-off/create/\${item.ma}" class="btn btn-info create">Chi tiết</a>
                                <button class="btn btn-danger btn-delete" value="\${item.ma}">Xóa</button>
                                <a href="/admin/giao-dich/detail/\${item.ma}" class="btn btn-info detail">Chi tiết</a>
                                <a href="/admin/giao-dich/hoa-don-huy/\${item.ma}" class="btn btn-info detail-huy">Chi tiết</a>
                            </td>
                        </tr>
                    `;
                        tbody.append(row);
                    });
                }

                if (trangThai  === "TREO") {
                    $(".detail").hide();
                    $(".detail-huy").hide();
                }
                if (trangThai === "THANHCONG") {
                    $(".btn-delete").hide();
                    $(".create").hide();
                    $(".detai-huy").hide();
                }
                if (trangThai === "HUYDON") {
                    $(".btn-delete").hide();
                    $(".create").hide();
                    $(".detail").hide();
                }
            },
            error: (error) => {
                console.log(error);
            }
        });

    }

</script>
</body>
</html>
