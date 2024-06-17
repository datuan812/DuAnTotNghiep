<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 11/11/2023
  Time: 10:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sản phẩm</title>
</head>
<body>
<div class="content-body">
    <div class="container-fluid">
        <div class="card card-body hstack gap-3 mt-3">
            <div class="p-2">
                <a href="/admin/san-pham/create" class="btn btn-primary">Thêm mới</a>
            </div>
            <div class="p-2 ms-auto">
                <select id="filter-quantity" class="form-control">
                    <option value="5">5</option>
                    <option value="10">10</option>
                    <option value="50">50</option>
                </select>
            </div>
        </div>

        <div class="group123 ">
            <svg id="searchButton" xmlns="http://www.w3.org/2000/svg" class="icon" aria-hidden="true"
                 viewBox="0 0 512 512">
                <style>svg {
                    fill: #ebeef4
                }</style>
                <path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/>
            </svg>
            <input placeholder="Tìm sản phẩm" id="searchAll" type="search" class="inputghichu w-100">
        </div>

        <p class="mt-3" id="iemty"></p>

        <div class="card mt-4" id="cardSP" style="box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
        padding: 20px; background-color: #fff">
            <div class="row col-12">
                <h4>Danh sách sản phẩm</h4>
            </div>
            <hr>
            <div class="d-flex justify-content-between">
                <hr>
                <table class="table table-hover table-striped">
                    <thead>
                    <tr class="text-center">
                        <th scope="col">STT</th>
                        <th scope="col">Hình ảnh</th>
                        <th scope="col">Tên SP</th>
                        <th scope="col">Giá</th>
                        <th scope="col">Danh muc</th>
                        <th scope="col">Thương hiệu</th>
                        <th scope="col" colspan="2">Thao tác</th>
                    </tr>
                    </thead>
                    <tbody class="tbody-product">
                    </tbody>
                </table>
            </div>
        </div>
        <ul class="pagination d-flex justify-content-center" id="pagination"></ul>
    </div>
</div>
<script>
    let param = '';
    let pageCurrent = 1;
    let limit = 5;
    loadAllProduct();

    function loadAllProduct() {
        $.ajax({
            url: "/api/san-pham?page=" + pageCurrent + "&limit=" + limit,
            method: "GET",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: (response) => {
                let html = '';
                $.each(response.data, (index, item) => {
                    let isChecked = item.trangThai === "ACTIVE" ? "checked" : "";
                    html += `<tr>
                                    <td class="text-center">\${index+1}</td>
                                    <td class="text-center">
                                        <a style="text-decoration: none;color: black" href="/admin/san-pham/edit/\${item.slug}">
                                            <img src='/repository/\${item.anh[0].hinhAnh}' style="width: 120px;">
                                        </a>
                                    </td>
                                    <td style="max-width: 400px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
                                        <a style="text-decoration: none;color: black" href="/admin/san-pham/edit/\${item.slug}">\${item.ten}</a>
                                    </td>
                                    <td class="text-center">\${item.gia}</td>
                                    <td class="text-center">\${item.danhMuc.ten}</td>
                                    <td class="text-center">\${item.thuongHieu.ten}</td>
                                    <td class="text-center">
                                        <label class="switch">
                                            <input class="checked-update-status" type="checkbox" \${isChecked}>
                                            <span class="slider"></span>
                                        </label>
                                    </td>
                                    <input class="product-slug" type="hidden" value="\${item.slug}">
                                </tr>
                            `;
                })
                $('.tbody-product').html(html);
                $('#pagination').twbsPagination('destroy');

                $('#pagination').twbsPagination({
                    visiblePages: 5,
                    totalPages: response.meta.totalPage,
                    startPage: response.meta.pageCurrent,
                    onPageClick: function (event, page) {
                        if (page !== pageCurrent) {
                            event.preventDefault();
                            pageCurrent = page;
                            if (param != '') {
                                searchSanPham(param)
                            } else {
                                loadAllProduct();
                            }
                        }
                    },
                });

                $('.checked-update-status').on('change', function () {
                    const slug = $(this).closest("tr").find('.product-slug').val();
                    if ($(this).is(":checked")) {
                        updateTrangThai(slug, "ACTIVE");
                    } else {
                        updateTrangThai(slug, "INACTIVE");
                    }
                })
            },
            error: (error) => {
                console.log(error);
            }
        });
    }

    function searchSanPham(param) {
        $.ajax({
            url: '/api/san-pham/search?q=' + param + "&page=" + pageCurrent + "&limit=" + limit,
            method: "GET",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: (response) => {
                if (response.data.length === 0) {
                    $('#iemty').removeClass('d-none')
                    $('#iemty').text("Không tìm thấy sản phẩm nào như thế !")
                    $('#cardSP').addClass('d-none');
                    $('#pagination').addClass('d-none');
                } else {
                    $('#iemty').addClass('d-none')
                    $('#cardSP').removeClass('d-none');
                    $('#pagination').removeClass('d-none');
                    let html = '';
                    $.each(response.data, (index, item) => {
                        let isChecked = item.trangThai === "ACTIVE" ? "checked" : "";
                        html += `<tr>
                                    <td class="text-center">\${index+1}</td>
                                    <td class="text-center">
                                        <a style="text-decoration: none;color: black" href="/admin/san-pham/edit/\${item.slug}">
                                            <img src='/repository/\${item.anh[0].hinhAnh}' style="width: 120px;">
                                        </a>
                                    </td>
                                    <td style="max-width: 400px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
                                        <a style="text-decoration: none;color: black" href="/admin/san-pham/edit/\${item.slug}">\${item.ten}</a>
                                    </td>
                                    <td class="text-center">\${item.gia}</td>
                                    <td class="text-center">\${item.danhMuc.ten}</td>
                                    <td class="text-center">\${item.thuongHieu.ten}</td>
                                    <td class="text-center">
                                        <label class="switch">
                                            <input class="checked-update-status" type="checkbox" \${isChecked}>
                                            <span class="slider"></span>
                                        </label>
                                    </td>
                                    <input class="product-slug" type="hidden" value="\${item.slug}">
                                </tr>
                            `;
                    })
                    $('.tbody-product').html(html);

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
                                if (param != '') {
                                    searchSanPham(param)
                                } else {
                                    loadAllProduct();
                                }
                            }
                        },
                    });

                    $('.checked-update-status').on('change', function () {
                        const slug = $(this).closest("tr").find('.product-slug').val();
                        if ($(this).is(":checked")) {
                            updateTrangThai(slug, "ACTIVE");
                        } else {
                            updateTrangThai(slug, "INACTIVE");
                        }
                    })
                }
            },
            error: (error) => {
                console.log(error);
            }
        });
    }

    $(document).ready(function () {
        var searchButton = $('#searchAll');
        pageCurrent = 1;
        searchButton.on('keydown', function (event) {
            if (event.which === 13) {
                param = searchButton.val().trim();
                if (pageCurrent > 1) {
                    pageCurrent = 1;
                }
                searchSanPham(param);
            }
        });
    });

    $(document).ready(function () {
        // Xác định thẻ table và thẻ th
        var table = $("table");
        var th = table.find("th");
        // Bắt đầu sắp xếp khi thẻ th được nhấp
        th.click(function () {
            var table = $(this).parents("table").eq(0);
            var rows = table.find('tr:gt(0)').toArray().sort(compare($(this).index()));

            // Đảm bảo sắp xếp theo chiều tăng hoặc giảm dần
            this.asc = !this.asc;
            if (!this.asc) {
                rows = rows.reverse();
            }
            // Sắp xếp các dòng
            for (var i = 0; i < rows.length; i++) {
                table.append(rows[i]);
            }
        });

        // Hàm so sánh để sắp xếp dữ liệu
        function compare(index) {
            return function (a, b) {
                var valA = getCellValue(a, index);
                var valB = getCellValue(b, index);
                return $.isNumeric(valA) && $.isNumeric(valB) ? valA - valB : valA.toString().localeCompare(valB);
            };
        }

        // Lấy giá trị của ô cụ thể trong dòng
        function getCellValue(row, index) {
            return $(row).children('td').eq(index).text();
        }
    });

    $('#filter-quantity').on('change', function () {
        let quantity = $(this).val();
        limit = quantity;
        if (param !== "") {
            searchSanPham(param)
        } else {
            loadAllProduct()
        }
    });

    function updateTrangThai(slug, trangThai) {
        $.ajax({
            url: "/api/san-pham/update/" + slug,
            method: "POST",
            contentType: "application/json; charset=utf-8",
            data: trangThai,
            success: (response) => {
                showSuccess("Updated sản phẩm thành công");
            },
            error: (error) => {
            }
        })
    }
</script>
</body>
</html>
