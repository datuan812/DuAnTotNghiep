<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 14-10-2023
  Time: 11:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Danh sách khuyến mại</title>
<section>
    <div class="content-body">
        <div class="container-fluid">
            <div class="">
                <div class="card card-body card-tabs text-center">
                    <div class="row">
                        <div class="hstack gap-3">
                            <div class="p-2">
                                <ul class="nav nav-tabs style-2">
                                    <li class="nav-item">
                                        <a href="#navpills-1" class="nav-link active" data-toggle="tab"
                                           aria-expanded="false">Tất cả
                                            <span class="badge badge-pill shadow-primary badge-primary"
                                                  id="tongKM">0</span></a>
                                    </li>
                                </ul>
                            </div>
                            <div class="p-2 ms-auto">
                                <div class="p-2">
                                    <a href="/admin/khuyen-mai/create" type="button"
                                       class="buttonImport text-decoration-none" id="importButton">
                                        <span class="button__text1">Tạo mới</span>
                                        <span class="button__icon1">
                                           <svg xmlns="http://www.w3.org/2000/svg" class="svgImport" height="1em"
                                                viewBox="0 0 448 512"><style>svg {
                                               fill: #ffffff
                                           }</style>
                                                <path d="M256 80c0-17.7-14.3-32-32-32s-32 14.3-32 32V224H48c-17.7 0-32 14.3-32 32s14.3 32 32 32H192V432c0 17.7 14.3 32 32 32s32-14.3 32-32V288H400c17.7 0 32-14.3 32-32s-14.3-32-32-32H256V80z"/></svg>
                                       </span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col">
                        <div class="group123 ">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" aria-hidden="true"
                                 viewBox="0 0 512 512">
                                <style>svg {
                                    fill: #ebeef4
                                }</style>
                                <path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/>
                            </svg>
                            <input placeholder="Tìm khuyến mãi" type="search" class="inputghichu w-100" id="searchButton">
                        </div>
                    </div>
                    <div class="col">
                        <div class="group123 ">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" aria-hidden="true"
                                 viewBox="0 0 512 512">
                                <style>svg {
                                    fill: #ebeef4
                                }</style>
                                <path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/>
                            </svg>
                            <input placeholder="Tìm sản phẩm" type="search" class="inputghichu w-100"
                                   id="searchButtonProduct">
                        </div>
                    </div>
                </div>

            </div>
            <hr>
            <p class="mt-4" id="iemty"></p>
            <div class="tab-content project-list-group" id="myTabContent">
                <div class="tab-pane fade active show" id="navpills-1">
                    <div id="cardKhuyenMai">

                    </div>
                </div>
                <div class="tab-pane fade" id="navpills-2">
                    <!--  -->
                    <div class="card">
                    </div>

                </div>
                <div class="tab-pane fade" id="navpills-3">

                </div>

                <div class="tab-pane fade" id="navpills-4">
                    <div class="card">

                    </div>
                </div>
            </div>
        </div>
        <ul class="pagination d-flex justify-content-center" id="pagination"></ul>
    </div>
</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
    let pageCurrent = 1;
    var value = "";
    let pageCurrentProduct = 1;
    var valueProduct = "";

    function loadKhuyenMai() {
        $.ajax({
            url: "/api/khuyen-mai/pagination?page=" + pageCurrent,
            method: 'GET',
            success: function (response) {
                console.log(response);
                var khuyenMai = $('#cardKhuyenMai');
                khuyenMai.empty();
                if (response.data && response.data.length !== undefined) {
                    var count = response.data.length;
                    $("#tongKM").text(count);
                } else {
                    $("#tongKM").text("0");
                }
                response.data.forEach(function (item) {
                    var ngayBatDauFMT = formatMicrosoftJSONDate(item.ngayBatDau);
                    var ngayKetThucFMT = formatMicrosoftJSONDate(item.ngayKetThuc);
                    var ngayTaoFMT = formatMicrosoftJSONDate(item.ngayTao);
                    var giaTriFMT = formatNumber(item.giaTri);
                    var soLuongFMT = formatNumber(item.tong);
                    var trangThaiStr = "";
                    var textColor = "";
                    var badgeColor = "";
                    var textFront = "text-info";
                    if (item.trangThai == "DELETE") {
                        trangThaiStr = "Đã dừng";
                        textColor = "bgl-danger";
                        textFront = "text-danger";
                        badgeColor = "badge-danger";
                    } else if (item.trangThai == "UPCOMING") {
                        trangThaiStr = "Sắp diễn ra";
                        textColor = "bgl-warning";
                        textFront = "text-warning";
                        badgeColor = "badge-warning";
                    } else if (item.trangThai == "EXPIRED") {
                        trangThaiStr = "Đã kết thúc";
                        textColor = "bgl-success";
                        textFront = "text-success";
                    } else {
                        trangThaiStr = "Đang diễn ra";
                        textColor = "bgl-primary";
                    }
                    if (item.trangThai == "DELETE") {
                        var card = `
                       <div class="card"  style="box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
             background-color: #fff" >
                        <div class="project-info">
                            <div class="col-xl-3 my-2 col-lg-4 col-sm-6">
                                <p class="text-primary mb-1">#\${item.ma}</p>
                                <h5 class="title font-w600 mb-2"><a href="/admin/khuyen-mai/detail/\${item.ma}" class="text-black nav-link active">\${item.ten}</a></h5>
                                <div class="text-dark"><i class="fa fa-calendar-o mr-3" aria-hidden="true"></i>Ngày tạo: \${ngayTaoFMT}</div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                                <div class="d-flex align-items-center">

                                    <div class="ml-2">
                                        <span>Giá trị</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">Giảm: \${giaTriFMT} \${item.loai == 1 ? "%": "đ"} </h5>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">
                                    <div class="ml-1">
                                        <span>Ngày bắt đầu</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${ngayBatDauFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">
                                    <div class="ml-1">
                                        <span>Ngày kết thúc</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${ngayKetThucFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-1 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">

                                    <div class="ml-2">
                                        <span>Số lượng</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${soLuongFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex project-status align-items-center">
                                    <h6>
                                    <span class="btn \${textColor} \${textFront} status-btn mr-3">\${trangThaiStr}</span>
                                    </h6>

                                    <div class="dropdown">
                                        <a href="javascript:void(0);" data-toggle="dropdown" aria-expanded="false">
                                            <svg width="24" height="24" viewbox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M12 13C12.5523 13 13 12.5523 13 12C13 11.4477 12.5523 11 12 11C11.4477 11 11 11.4477 11 12C11 12.5523 11.4477 13 12 13Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                                <path d="M12 6C12.5523 6 13 5.55228 13 5C13 4.44772 12.5523 4 12 4C11.4477 4 11 4.44772 11 5C11 5.55228 11.4477 6 12 6Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                                <path d="M12 20C12.5523 20 13 19.5523 13 19C13 18.4477 12.5523 18 12 18C11.4477 18 11 18.4477 11 19C11 19.5523 11.4477 20 12 20Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                            </svg>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                           <a class="dropdown-item btn-undelete-khuyen-mai" data-ma="\${item.ma}">Tiếp tục khuyến mãi</a>
                                            <a class="dropdown-item" href="/admin/khuyen-mai/edit/\${item.ma}" style="color: inherit; " >Chỉnh sửa</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        `;
                    } else if (item.trangThai == "EXPIRED") {
                        var card = `
                       <div class="card"  style="box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
             background-color: #fff" >
                        <div class="project-info">
                            <div class="col-xl-3 my-2 col-lg-4 col-sm-6">
                                <p class="text-primary mb-1">#\${item.ma}</p>
                                <h5 class="title font-w600 mb-2"><a href="/admin/khuyen-mai/detail/\${item.ma}" class="text-black nav-link active">\${item.ten}</a></h5>
                                <div class="text-dark"><i class="fa fa-calendar-o mr-3" aria-hidden="true"></i>Ngày tạo: \${ngayTaoFMT}</div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                                <div class="d-flex align-items-center">

                                    <div class="ml-2">
                                        <span>Giá trị</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">Giảm: \${giaTriFMT} \${item.loai == 1 ? "%": "đ"} </h5>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">
                                    <div class="ml-1">
                                        <span>Ngày bắt đầu</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${ngayBatDauFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">
                                    <div class="ml-1">
                                        <span>Ngày kết thúc</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${ngayKetThucFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-1 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">

                                    <div class="ml-2">
                                        <span>Số lượng</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${soLuongFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex project-status align-items-center">
                                    <span class="btn \${textColor} \${textFront}  \${badgeColor} status-btn mr-3">\${trangThaiStr}</span>
                                    <div class="dropdown">
                                        <a href="javascript:void(0);" data-toggle="dropdown" aria-expanded="false">
                                            <svg width="24" height="24" viewbox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M12 13C12.5523 13 13 12.5523 13 12C13 11.4477 12.5523 11 12 11C11.4477 11 11 11.4477 11 12C11 12.5523 11.4477 13 12 13Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                                <path d="M12 6C12.5523 6 13 5.55228 13 5C13 4.44772 12.5523 4 12 4C11.4477 4 11 4.44772 11 5C11 5.55228 11.4477 6 12 6Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                                <path d="M12 20C12.5523 20 13 19.5523 13 19C13 18.4477 12.5523 18 12 18C11.4477 18 11 18.4477 11 19C11 19.5523 11.4477 20 12 20Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                            </svg>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="/admin/khuyen-mai/edit/\${item.ma}" style="color: inherit; " >Chỉnh sửa</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        `;
                    } else {
                        var card = `
                       <div class="card"  style="box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
             background-color: #fff" >
                        <div class="project-info">
                            <div class="col-xl-3 my-2 col-lg-4 col-sm-6">
                                <p class="text-primary mb-1">#\${item.ma}</p>
                                <h5 class="title font-w600 mb-2"><a href="/admin/khuyen-mai/detail/\${item.ma}" class="text-black nav-link active">\${item.ten}</a></h5>
                                <div class="text-dark"><i class="fa fa-calendar-o mr-3" aria-hidden="true"></i>Ngày tạo: \${ngayTaoFMT}</div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                                <div class="d-flex align-items-center">

                                    <div class="ml-2">
                                        <span>Giá trị</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">Giảm: \${giaTriFMT} \${item.loai == 1 ? "%": "đ"} </h5>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">
                                    <div class="ml-1">
                                        <span>Ngày bắt đầu</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${ngayBatDauFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">
                                    <div class="ml-1">
                                        <span>Ngày kết thúc</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${ngayKetThucFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-1 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">

                                    <div class="ml-2">
                                        <span>Số lượng</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${soLuongFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex project-status align-items-center">
                                    <span class="btn \${textColor} \${textFront} status-btn mr-3">\${trangThaiStr}</span>
                                    <div class="dropdown">
                                        <a href="javascript:void(0);" data-toggle="dropdown" aria-expanded="false">
                                            <svg width="24" height="24" viewbox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M12 13C12.5523 13 13 12.5523 13 12C13 11.4477 12.5523 11 12 11C11.4477 11 11 11.4477 11 12C11 12.5523 11.4477 13 12 13Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                                <path d="M12 6C12.5523 6 13 5.55228 13 5C13 4.44772 12.5523 4 12 4C11.4477 4 11 4.44772 11 5C11 5.55228 11.4477 6 12 6Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                                <path d="M12 20C12.5523 20 13 19.5523 13 19C13 18.4477 12.5523 18 12 18C11.4477 18 11 18.4477 11 19C11 19.5523 11.4477 20 12 20Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                            </svg>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                           <a class="dropdown-item btn-delete-khuyen-mai" data-ma="\${item.ma}">Dừng khuyến mãi</a>
                                            <a class="dropdown-item" href="/admin/khuyen-mai/edit/\${item.ma}" style="color: inherit; " >Chỉnh sửa</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        `;
                    }

                    khuyenMai.append(card);
                });
                $('#pagination').twbsPagination('destroy');
                $('#pagination').twbsPagination({
                    first: "First",
                    prev: "Previous",
                    next: "Next",
                    last: "Last",
                    visiblePages: 5,
                    totalPages: response.meta.totalPage,
                    startPage: response.meta.pageCurrent,
                    onPageClick: function (event, page) {
                        if (page !== pageCurrent) {
                            event.preventDefault();
                            pageCurrent = page;
                            if (value != '') {
                                loadSearchKM(value)
                            } else {
                                loadKhuyenMai();
                            }
                        }
                    },
                });
            },
            error: function (xhr, status, error) {
                console.log(error);
            }
        });
    }

    loadKhuyenMai();

    //    format date
    function formatMicrosoftJSONDate(jsonDate) {
        // Create a Date object from the timestamp
        var date = new Date(jsonDate);
        var day = date.getDate().toString().padStart(2, '0');
        var month = (date.getMonth() + 1).toString().padStart(2, '0');
        var year = date.getFullYear();
        var hours = date.getHours().toString().padStart(2, '0');
        var minutes = date.getMinutes().toString().padStart(2, '0');
        // Format the date into "HH:MM dd-MM-yyyy" format
        var formattedDate = day + '/' + month + '/' + year;
        return formattedDate;
    }

    $('#cardKhuyenMai').on('click', (e) => {
        if ($(e.target).hasClass('btn-delete-khuyen-mai')) {
            let ma = $(e.target).data('ma');
            showConfirm("Bạn muốn dừng chương trình khuyến mãi?", ma)
                .then((confirmed) => {
                    if (confirmed) {
                        $.ajax({
                            url: '/api/khuyen-mai/delete/' + ma,
                            method: 'DELETE',
                            success: function (req) {
                                console.log(req);
                                loadKhuyenMai();
                                showSuccess("Dừng khuyến mãi thành công!");
                            },
                            error: function (xhr, status, error) {
                                showError("Dừng thất bại");
                            }
                        });
                    }
                })
        }
    });

    $('#cardKhuyenMai').on('click', (e) => {
        if ($(e.target).hasClass('btn-undelete-khuyen-mai')) {
            let ma = $(e.target).data('ma');
            showConfirm("Bạn muốn tiếp tục chương trình khuyến mãi?", ma)
                .then((confirmed) => {
                    if (confirmed) {
                        $.ajax({
                            url: '/api/khuyen-mai/undelete/' + ma,
                            method: 'DELETE',
                            success: function (req) {
                                console.log(req);
                                loadKhuyenMai();
                                showSuccess("Cập nhật thành công!");
                            },
                            error: function (xhr, status, error) {
                                showError("Cập nhật thất bại");
                            }
                        });
                    }
                })
        }
    });

    function formatNumber(number) {
        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    }

    $(document).ready(function () {
        var searchButton = $('#searchButton');
        pageCurrent = 1;
        searchButton.on('keydown', function (event) {
            if (event.which === 13) {
                $('#searchButtonProduct').val("")
                value = searchButton.val();
                if (pageCurrent > 1) {
                    pageCurrent = 1;
                }
                loadSearchKM(value);
            }
        });

        var searchButtonProduct = $('#searchButtonProduct');
        pageCurrentProduct = 1;
        searchButtonProduct.on('keydown', function (event) {
            if (event.which === 13) {
                $('#searchButton').val("")
                valueProduct = searchButtonProduct.val();
                if (pageCurrentProduct > 1) {
                    pageCurrentProduct = 1;
                }
                loadSearchSanPham(valueProduct);
            }
        });
    });

    function loadSearchKM(value) {
        $.ajax({
            url: "/api/khuyen-mai/search?page=" + pageCurrent + "&q=" + value,
            method: 'GET',
            success: function (response) {
                if (response.data.length === 0) {
                    $('#iemty').removeClass('d-none')
                    $('#iemty').text("Không tìm thấy khuyến mại!")
                    $('#cardKhuyenMai').addClass('d-none');
                    $('#pagination').addClass('d-none');
                } else {
                    $('#iemty').addClass('d-none')
                    $('#cardKhuyenMai').removeClass('d-none');
                    $('#pagination').removeClass('d-none');
                    var khuyenMai = $('#cardKhuyenMai');
                    khuyenMai.empty();
                    var count = response.data.length;
                    $("#tongKM").text(count);
                    response.data.forEach(function (item) {
                        var ngayBatDauFMT = formatMicrosoftJSONDate(item.ngayBatDau);
                        var ngayKetThucFMT = formatMicrosoftJSONDate(item.ngayKetThuc);
                        var ngayTaoFMT = formatMicrosoftJSONDate(item.ngayTao);
                        var giaTriFMT = formatNumber(item.giaTri);
                        var soLuongFMT = formatNumber(item.soLuong);
                        var trangThaiStr = "";
                        var textColor = "";
                        var textFront = "text-info";
                        if (item.trangThai == "DELETE") {
                            trangThaiStr = "Đã dừng";
                            textColor = "bgl-danger";
                            textFront = "text-danger";
                        } else if (item.trangThai == "UPCOMING") {
                            trangThaiStr = "Sắp diễn ra";
                            textColor = "bgl-warning";
                            textFront = "text-warning";
                        } else {
                            trangThaiStr = "Hoạt động";
                            textColor = "bgl-info";
                        }
                        if (item.trangThai == "DELETE") {
                            var card = `
                       <div class="card"  style="box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
             background-color: #fff" >
                        <div class="project-info">
                            <div class="col-xl-3 my-2 col-lg-4 col-sm-6">
                                <p class="text-primary mb-1">#\${item.ma}</p>
                                <h5 class="title font-w600 mb-2"><a href="/admin/khuyen-mai/detail/\${item.ma}" class="text-black nav-link active">\${item.ten}</a></h5>
                                <div class="text-dark"><i class="fa fa-calendar-o mr-3" aria-hidden="true"></i>Ngày tạo: \${ngayTaoFMT}</div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                                <div class="d-flex align-items-center">

                                    <div class="ml-2">
                                        <span>Giá trị</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">Giảm: \${giaTriFMT} \${item.loai == 1 ? "%": "đ"} </h5>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">
                                    <div class="ml-1">
                                        <span>Ngày bắt đầu</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${ngayBatDauFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">
                                    <div class="ml-1">
                                        <span>Ngày kết thúc</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${ngayKetThucFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-1 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">

                                    <div class="ml-2">
                                        <span>Số lượng</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${soLuongFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex project-status align-items-center">
                                    <span class="btn \${textColor} \${textFront} status-btn mr-3">\${trangThaiStr}</span>
                                    <div class="dropdown">
                                        <a href="javascript:void(0);" data-toggle="dropdown" aria-expanded="false">
                                            <svg width="24" height="24" viewbox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M12 13C12.5523 13 13 12.5523 13 12C13 11.4477 12.5523 11 12 11C11.4477 11 11 11.4477 11 12C11 12.5523 11.4477 13 12 13Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                                <path d="M12 6C12.5523 6 13 5.55228 13 5C13 4.44772 12.5523 4 12 4C11.4477 4 11 4.44772 11 5C11 5.55228 11.4477 6 12 6Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                                <path d="M12 20C12.5523 20 13 19.5523 13 19C13 18.4477 12.5523 18 12 18C11.4477 18 11 18.4477 11 19C11 19.5523 11.4477 20 12 20Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                            </svg>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                           <a class="dropdown-item btn-undelete-khuyen-mai" data-ma="\${item.ma}">Tiếp tục khuyến mãi</a>
                                            <a class="dropdown-item" href="/admin/khuyen-mai/edit/\${item.ma}" style="color: inherit;">Chỉnh sửa</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        `;
                        }else if(item.trangThai == "EXPIRED"){
                            var card = `
                       <div class="card"  style="box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
             background-color: #fff" >
                        <div class="project-info">
                            <div class="col-xl-3 my-2 col-lg-4 col-sm-6">
                                <p class="text-primary mb-1">#\${item.ma}</p>
                                <h5 class="title font-w600 mb-2"><a href="/admin/khuyen-mai/detail/\${item.ma}" class="text-black nav-link active">\${item.ten}</a></h5>
                                <div class="text-dark"><i class="fa fa-calendar-o mr-3" aria-hidden="true"></i>Ngày tạo: \${ngayTaoFMT}</div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                                <div class="d-flex align-items-center">

                                    <div class="ml-2">
                                        <span>Giá trị</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">Giảm: \${giaTriFMT} \${item.loai == 1 ? "%": "đ"} </h5>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">
                                    <div class="ml-1">
                                        <span>Ngày bắt đầu</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${ngayBatDauFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">
                                    <div class="ml-1">
                                        <span>Ngày kết thúc</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${ngayKetThucFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-1 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">

                                    <div class="ml-2">
                                        <span>Số lượng</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${soLuongFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex project-status align-items-center">
                                    <span class="btn \${textColor} \${textFront} status-btn mr-3">\${trangThaiStr}</span>
                                    <div class="dropdown">
                                        <a href="javascript:void(0);" data-toggle="dropdown" aria-expanded="false">
                                            <svg width="24" height="24" viewbox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M12 13C12.5523 13 13 12.5523 13 12C13 11.4477 12.5523 11 12 11C11.4477 11 11 11.4477 11 12C11 12.5523 11.4477 13 12 13Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                                <path d="M12 6C12.5523 6 13 5.55228 13 5C13 4.44772 12.5523 4 12 4C11.4477 4 11 4.44772 11 5C11 5.55228 11.4477 6 12 6Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                                <path d="M12 20C12.5523 20 13 19.5523 13 19C13 18.4477 12.5523 18 12 18C11.4477 18 11 18.4477 11 19C11 19.5523 11.4477 20 12 20Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                            </svg>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                           <a class="dropdown-item btn-undelete-khuyen-mai" data-ma="\${item.ma}">Tiếp tục khuyến mãi</a>
                                            <a class="dropdown-item" href="/admin/khuyen-mai/edit/\${item.ma}" style="color: inherit;">Chỉnh sửa</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        `;
                        } else{
                            var card = `
                       <div class="card"  style="box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
             background-color: #fff" >
                        <div class="project-info">
                            <div class="col-xl-3 my-2 col-lg-4 col-sm-6">
                                <p class="text-primary mb-1">#\${item.ma}</p>
                                <h5 class="title font-w600 mb-2"><a href="/admin/khuyen-mai/detail/\${item.ma}" class="text-black nav-link active">\${item.ten}</a></h5>
                                <div class="text-dark"><i class="fa fa-calendar-o mr-3" aria-hidden="true"></i>Ngày tạo: \${ngayTaoFMT}</div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                                <div class="d-flex align-items-center">

                                    <div class="ml-2">
                                        <span>Giá trị</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">Giảm: \${giaTriFMT} \${item.loai == 1 ? "%": "đ"} </h5>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">
                                    <div class="ml-1">
                                        <span>Ngày bắt đầu</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${ngayBatDauFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">
                                    <div class="ml-1">
                                        <span>Ngày kết thúc</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${ngayKetThucFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-1 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">

                                    <div class="ml-2">
                                        <span>Số lượng</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${soLuongFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex project-status align-items-center">
                                    <span class="btn \${textColor} \${textFront} status-btn mr-3">\${trangThaiStr}</span>
                                    <div class="dropdown">
                                        <a href="javascript:void(0);" data-toggle="dropdown" aria-expanded="false">
                                            <svg width="24" height="24" viewbox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M12 13C12.5523 13 13 12.5523 13 12C13 11.4477 12.5523 11 12 11C11.4477 11 11 11.4477 11 12C11 12.5523 11.4477 13 12 13Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                                <path d="M12 6C12.5523 6 13 5.55228 13 5C13 4.44772 12.5523 4 12 4C11.4477 4 11 4.44772 11 5C11 5.55228 11.4477 6 12 6Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                                <path d="M12 20C12.5523 20 13 19.5523 13 19C13 18.4477 12.5523 18 12 18C11.4477 18 11 18.4477 11 19C11 19.5523 11.4477 20 12 20Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                            </svg>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="/admin/khuyen-mai/edit/\${item.ma}" style="color: inherit;">Chỉnh sửa</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        `;
                        }
                        khuyenMai.append(card);
                    });
                    console.log(response);
                    $('#pagination').twbsPagination('destroy');
                    $('#pagination').twbsPagination({
                        first: "First",
                        prev: "Previous",
                        next: "Next",
                        last: "Last",
                        visiblePages: 5,
                        totalPages: response.meta.totalPage,
                        startPage: response.meta.pageCurrent,
                        onPageClick: function (event, page) {
                            if (page !== pageCurrent) {
                                event.preventDefault();
                                pageCurrent = page;
                                if(value != ''){
                                    loadSearchKM(value)
                                }else{
                                    loadKhuyenMai();
                                }
                            }
                        },
                    });
                }
            },
            error: function (xhr, status, error) {
                console.log(error);
            }
        });
    }

    function loadSearchSanPham(value) {
        $.ajax({
            url: "/api/khuyen-mai/search-product?page=" + pageCurrentProduct + "&q=" + value,
            method: 'GET',
            success: function (response) {
                if (response.data.length === 0) {
                    $('#iemty').removeClass('d-none')
                    $('#iemty').text("Không tìm thấy khuyến mại có sản phẩm: " + value)
                    $('#cardKhuyenMai').addClass('d-none');
                    $('#pagination').addClass('d-none');
                } else {
                    $('#iemty').addClass('d-none')
                    $('#cardKhuyenMai').removeClass('d-none');
                    $('#pagination').removeClass('d-none');
                    var khuyenMai = $('#cardKhuyenMai');
                    khuyenMai.empty();
                    var count = response.data.length;
                    $("#tongKM").text(count);
                    response.data.forEach(function (item) {
                        var ngayBatDauFMT = formatMicrosoftJSONDate(item.ngayBatDau);
                        var ngayKetThucFMT = formatMicrosoftJSONDate(item.ngayKetThuc);
                        var ngayTaoFMT = formatMicrosoftJSONDate(item.ngayTao);
                        var giaTriFMT = formatNumber(item.giaTri);
                        var soLuongFMT = formatNumber(item.soLuong);
                        var trangThaiStr = "";
                        var textColor = "";
                        var textFront = "text-info";
                        if (item.trangThai == "DELETE") {
                            trangThaiStr = "Đã dừng";
                            textColor = "bgl-danger";
                            textFront = "text-danger";
                        } else if (item.trangThai == "UPCOMING") {
                            trangThaiStr = "Sắp diễn ra";
                            textColor = "bgl-warning";
                            textFront = "text-warning";
                        } else {
                            trangThaiStr = "Hoạt động";
                            textColor = "bgl-info";
                        }
                        if (item.trangThai == "DELETE"){
                            var card = `
                       <div class="card"  style="box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
             background-color: #fff" >
                        <div class="project-info">
                            <div class="col-xl-3 my-2 col-lg-4 col-sm-6">
                                <p class="text-primary mb-1">#\${item.ma}</p>
                                <h5 class="title font-w600 mb-2"><a href="/admin/khuyen-mai/detail/\${item.ma}" class="text-black nav-link active">\${item.ten}</a></h5>
                                <div class="text-dark"><i class="fa fa-calendar-o mr-3" aria-hidden="true"></i>Ngày tạo: \${ngayTaoFMT}</div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                                <div class="d-flex align-items-center">

                                    <div class="ml-2">
                                        <span>Giá trị</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">Giảm: \${giaTriFMT} \${item.loai == 1 ? "%": "đ"} </h5>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">
                                    <div class="ml-1">
                                        <span>Ngày bắt đầu</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${ngayBatDauFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">
                                    <div class="ml-1">
                                        <span>Ngày kết thúc</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${ngayKetThucFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-1 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">

                                    <div class="ml-2">
                                        <span>Số lượng</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${soLuongFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex project-status align-items-center">
                                    <span class="btn \${textColor} \${textFront} status-btn mr-3">\${trangThaiStr}</span>
                                    <div class="dropdown">
                                        <a href="javascript:void(0);" data-toggle="dropdown" aria-expanded="false">
                                            <svg width="24" height="24" viewbox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M12 13C12.5523 13 13 12.5523 13 12C13 11.4477 12.5523 11 12 11C11.4477 11 11 11.4477 11 12C11 12.5523 11.4477 13 12 13Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                                <path d="M12 6C12.5523 6 13 5.55228 13 5C13 4.44772 12.5523 4 12 4C11.4477 4 11 4.44772 11 5C11 5.55228 11.4477 6 12 6Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                                <path d="M12 20C12.5523 20 13 19.5523 13 19C13 18.4477 12.5523 18 12 18C11.4477 18 11 18.4477 11 19C11 19.5523 11.4477 20 12 20Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                            </svg>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                           <a class="dropdown-item btn-undelete-khuyen-mai" data-ma="\${item.ma}">Tiếp tục khuyến mãi</a>
                                            <a class="dropdown-item" href="/admin/khuyen-mai/edit/\${item.ma}" style="color: inherit;">Chỉnh sửa</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        `;
                        } else if (item.trangThai == "EXPIRED") {
                            var card = `
                       <div class="card"  style="box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
             background-color: #fff" >
                        <div class="project-info">
                            <div class="col-xl-3 my-2 col-lg-4 col-sm-6">
                                <p class="text-primary mb-1">#\${item.ma}</p>
                                <h5 class="title font-w600 mb-2"><a href="/admin/khuyen-mai/detail/\${item.ma}" class="text-black nav-link active">\${item.ten}</a></h5>
                                <div class="text-dark"><i class="fa fa-calendar-o mr-3" aria-hidden="true"></i>Ngày tạo: \${ngayTaoFMT}</div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                                <div class="d-flex align-items-center">

                                    <div class="ml-2">
                                        <span>Giá trị</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">Giảm: \${giaTriFMT} \${item.loai == 1 ? "%": "đ"} </h5>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">
                                    <div class="ml-1">
                                        <span>Ngày bắt đầu</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${ngayBatDauFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">
                                    <div class="ml-1">
                                        <span>Ngày kết thúc</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${ngayKetThucFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-1 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">

                                    <div class="ml-2">
                                        <span>Số lượng</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${soLuongFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex project-status align-items-center">
                                    <span class="btn \${textColor} \${textFront} status-btn mr-3">\${trangThaiStr}</span>
                                    <div class="dropdown">
                                        <a href="javascript:void(0);" data-toggle="dropdown" aria-expanded="false">
                                            <svg width="24" height="24" viewbox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M12 13C12.5523 13 13 12.5523 13 12C13 11.4477 12.5523 11 12 11C11.4477 11 11 11.4477 11 12C11 12.5523 11.4477 13 12 13Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                                <path d="M12 6C12.5523 6 13 5.55228 13 5C13 4.44772 12.5523 4 12 4C11.4477 4 11 4.44772 11 5C11 5.55228 11.4477 6 12 6Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                                <path d="M12 20C12.5523 20 13 19.5523 13 19C13 18.4477 12.5523 18 12 18C11.4477 18 11 18.4477 11 19C11 19.5523 11.4477 20 12 20Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                            </svg>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                           <a class="dropdown-item btn-undelete-khuyen-mai" data-ma="\${item.ma}">Tiếp tục khuyến mãi</a>
                                            <a class="dropdown-item" href="/admin/khuyen-mai/edit/\${item.ma}" style="color: inherit;">Chỉnh sửa</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        `;
                        } else {
                            var card = `
                       <div class="card"  style="box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
             background-color: #fff" >
                        <div class="project-info">
                            <div class="col-xl-3 my-2 col-lg-4 col-sm-6">
                                <p class="text-primary mb-1">#\${item.ma}</p>
                                <h5 class="title font-w600 mb-2"><a href="/admin/khuyen-mai/detail/\${item.ma}" class="text-black nav-link active">\${item.ten}</a></h5>
                                <div class="text-dark"><i class="fa fa-calendar-o mr-3" aria-hidden="true"></i>Ngày tạo: \${ngayTaoFMT}</div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                                <div class="d-flex align-items-center">

                                    <div class="ml-2">
                                        <span>Giá trị</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">Giảm: \${giaTriFMT} \${item.loai == 1 ? "%": "đ"} </h5>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">
                                    <div class="ml-1">
                                        <span>Ngày bắt đầu</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${ngayBatDauFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">
                                    <div class="ml-1">
                                        <span>Ngày kết thúc</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${ngayKetThucFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-1 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex align-items-center">

                                    <div class="ml-2">
                                        <span>Số lượng</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">\${soLuongFMT}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                <div class="d-flex project-status align-items-center">
                                    <span class="btn \${textColor} \${textFront} status-btn mr-3">\${trangThaiStr}</span>
                                    <div class="dropdown">
                                        <a href="javascript:void(0);" data-toggle="dropdown" aria-expanded="false">
                                            <svg width="24" height="24" viewbox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M12 13C12.5523 13 13 12.5523 13 12C13 11.4477 12.5523 11 12 11C11.4477 11 11 11.4477 11 12C11 12.5523 11.4477 13 12 13Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                                <path d="M12 6C12.5523 6 13 5.55228 13 5C13 4.44772 12.5523 4 12 4C11.4477 4 11 4.44772 11 5C11 5.55228 11.4477 6 12 6Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                                <path d="M12 20C12.5523 20 13 19.5523 13 19C13 18.4477 12.5523 18 12 18C11.4477 18 11 18.4477 11 19C11 19.5523 11.4477 20 12 20Z" stroke="#575757" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                            </svg>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="/admin/khuyen-mai/edit/\${item.ma}" style="color: inherit;">Chỉnh sửa</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        `;
                        }
                        khuyenMai.append(card);
                    });
                    console.log(response);
                    $('#pagination').twbsPagination('destroy');
                    $('#pagination').twbsPagination({
                        first: "First",
                        prev: "Previous",
                        next: "Next",
                        last: "Last",
                        visiblePages: 5,
                        totalPages: response.meta.totalPage,
                        startPage: response.meta.pageCurrent,
                        onPageClick: function (event, page) {
                            if (page !== pageCurrent) {
                                event.preventDefault();
                                pageCurrent = page;
                                if (value != '') {
                                    loadSearchSanPham(valueProduct)
                                } else {
                                    loadKhuyenMai();
                                }
                            }
                        },
                    });
                }
            },
            error: function (xhr, status, error) {
                console.log(error);
            }
        });
    }
</script>
