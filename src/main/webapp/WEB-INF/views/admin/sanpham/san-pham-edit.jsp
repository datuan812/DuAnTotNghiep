<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 11/11/2023
  Time: 10:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Cập nhật sản phẩm</title>
</head>
<body>
<div class="content-body">
    <div class="container-fluid">
        <h4 style="margin-top: 0;
    margin-bottom: 30px;
    border-bottom: 2px solid #FFD43B;
    padding-bottom: 10px;
    padding-left: 5px;
    color: black;">
            Cập nhật sản phẩm
        </h4>

        <div class="container mt-3">
            <form action="" method="POST" class="form-submit-product">
                <div class="row mb-4">
                    <label class="form-label">Chọn hình ảnh</label>
                    <input type="file" id="uploadImage"/>
                    <div class="list-images mt-4">
                    </div>
                </div>

                <div class="row">
                    <div class="col-4">
                        <label for="slug" class="form-label">Slug</label>
                        <input name="slug" type="text" class="form-control" id="slug" readonly/>
                    </div>

                    <div class="col-4">
                        <label for="ten" class="form-label">Tên</label>
                        <input name="ten" type="text" class="form-control" id="ten"/>
                    </div>

                    <div class="col-4">
                        <label for="gia" class="form-label">Giá</label>
                        <input name="gia" type="text" class="form-control" id="gia"/>
                    </div>

                    <div class="col-6 mt-4">
                        <select class="form-select" name="danhMucSlug" id="danh-muc">
                            <option value="" selected>Vui lòng chọn danh mục</option>
                            <c:forEach var="item" items="${categoriesProduct}">
                                <option value="${item.slug}">${item.ten}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col-6 mt-4">
                        <select class="form-select" name="thuongHieuSlug" id="thuong-hieu">
                            <option selected>Vui lòng chọn thương hiệu</option>
                            <c:forEach var="item" items="${brandsProduct}">
                                <option value="${item.slug}">${item.ten}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="row mt-4 mb-4">
                    <div class="col-6">
                        <div class="card" id="card-attribute">
                            <div
                                    class="d-flex justify-content-between align-items-center card-header"
                            >
                                <p>Thuộc tính</p>
                                <div class="col-4">
                                    <div class="input-group">
                                        <input
                                                type="text"
                                                class="form-control input-name-atrribute"
                                                placeholder="Nhập thuộc tính"
                                        />
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <p class="card-text card-text-none-attribute">
                                    Chưa có thuộc tính
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-6">
                        <div class="card" id="card-variant">
                            <div
                                    class="d-flex justify-content-between align-items-center card-header"
                            >
                                <p>Biến thể</p>
                            </div>
                            <div class="card-body">
                                <div class="row mb-4 d-flex align-items-center">
                                    <div class="col-8">
                                        <div class="input-group">
                                            <input
                                                    type="text"
                                                    id="price-all"
                                                    class="form-control"
                                                    placeholder="Thiết lập giá cho tất cả thuộc tính"
                                            />
                                            <button
                                                    class="btn btn-primary"
                                                    type="button"
                                                    id="btn-set-price"
                                            >
                                                Xác nhận!
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <table class="table table-bordered table-variant">
                                    <thead>
                                    <tr>
                                        <th class="text-center" scope="col">Tên biến thể</th>
                                        <th class="text-center" scope="col">Giá</th>
                                        <th class="text-center" scope="col">Số lượng</th>
                                        <th class="text-center" scope="col">Chọn hình ảnh</th>
                                    </tr>
                                    </thead>
                                    <tbody class="table-variant-body" id="variants">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mb-4">
                    <div class="col-6">
                        <label for="chitietsanpham" class="form-label"
                        >Thông tin chi tiết</label
                        >
                        <textarea
                                class="form-control"
                                id="chitietsanpham"
                                name="thongTinChiTiet"
                        ></textarea>
                    </div>

                    <div class="col-6">
                        <label for="motasanpham" class="form-label">Mô tả sản phẩm</label>
                        <textarea
                                class="form-control"
                                id="motasanpham"
                                name="moTa"
                        ></textarea>
                    </div>
                </div>

                <div class="khuyenmai-sanpham m-0 mt-2 mb-2" id="khuyenmai-sanpham"></div>

                <button type="button" class="btn btn-success mb-4 btn-add-product">Update</button>
            </form>

        </div>


    </div>
</div>
<input type="hidden" name="" value="" id="product-id">
<script src="<c:url value='/template/admin/ckeditor/ckeditor.js'/>"></script>

<script>
    let ckeChiTietSanPham = CKEDITOR.replace("chitietsanpham");
    let ckeMoTaSanPham = CKEDITOR.replace("motasanpham");

    function detailSP() {
        var url = window.location.pathname.split("/");
        var slug = url[url.length - 1];
        $.ajax({
            url: '/api/san-pham/' + slug,
            method: 'GET',
            dataType: 'json',
            success: function (req) {
                $('#product-id').val(req.id);
                $("#slug").val(req.slug);
                $("#ten").val(req.ten);
                $("#gia").val(req.gia);
                $("#motasanpham").val(req.moTa);
                $("#chitietsanpham").val(req.thongTinChiTiet);
                $("#danh-muc").val(req.danhMuc.slug)
                $("#thuong-hieu").val(req.thuongHieu.slug)
                let htmlImage = '';
                $.each(req.anh, (index, item) => {
                    htmlImage += `<img src="/repository/\${item.hinhAnh}" class="view-image me-4" style="border: 1px solid #ddd;border-radius: 4px; padding: 5px;width: 150px;"/>`;
                })
                $(".list-images").append(htmlImage)

                let htmlThuocTinh = '';
                if (req.thuocTinh.length > 0) {
                    $('.card-text-none-attribute').hide()
                }
                $.each(req.thuocTinh, (index, item) => {
                    htmlThuocTinh += `<div class="product-has-attribute mb-3" data-slug="\${item.slug}">
                                            <div class="name-attribute">
                                              <button type="button" class="btn btn-success position-relative">
                                                  \${item.ten}
                                                <span class="btn-remove-parent position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                                    <i class="fa fa-trash-o btn-remove-parent-trash" aria-hidden="true"></i>
                                                </span>
                                              </button>
                                            </div>
                                            <div class="list-value-attribute mt-3">`;
                    $.each(item.giaTriThuocTinh, (index, item1) => {
                        htmlThuocTinh += `
                                                <button type="button" class="btn btn-secondary btn-sm position-relative me-3 btn-value-attr">
                                                         \${item1.giaTri}
                                                    <span class="btn-remove-children position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                                       <i class="fa fa-trash-o btn-remove-children-trash" aria-hidden="true"></i>
                                                    </span>
                                                </button>

                                           `;
                    })
                    htmlThuocTinh += `  </div><div class="input-group mt-3">
                                              <input type="text" class="form-control input-value-attribute" placeholder="Nhập giá trị">
                                          </div>
                                            </div> `;
                })
                $("#card-attribute .card-body").append(htmlThuocTinh)

                let htmlBienThe = '';
                $.each(req.bienThe, (index, item) => {
                    htmlBienThe += `
                        <tr>
                              <td class="text-center name-variant">\${item.ten}</td>
                              <td>
                                <input type="text" value="\${item.gia}" class="form-control price-variant">
                              </td>
                              <td>
                                <input type="text"  value="\${item.soLuong}" class="form-control quantity-variant">
                              </td>
                              <td>
                                <input class="form-control image-variant"  type="file">`;
                    htmlBienThe += `<img src="/repository/\${item.hinhAnh}" class="image-variant mt-2 hinhanhbase64" style="width: 150px;" />
                             </td>
                            </tr>`;
                })
                $("#variants").append(htmlBienThe)
                let khuyenMaiSanPham = req.khuyenMaiHienThiResponse;
                if(khuyenMaiSanPham != null){
                    let htmlKhuyenMai = '';
                    if(khuyenMaiSanPham.trangThai === "ACTIVE"){
                        htmlKhuyenMai += `
                        <div class="col-10">
                                    <a style="color: black; text-decoration: none;" href="/admin/khuyen-mai/detail/\${khuyenMaiSanPham.ma}" target="_blank"><p class=""> <span>Đang áp dụng Khuyến mãi: </span><strong>\${khuyenMaiSanPham.ten}</strong></p></a>
                                </div>
                    `
                    }else
                    if(khuyenMaiSanPham.trangThai === "UPCOMING"){
                        htmlKhuyenMai += `
                        <div class="col-10">
                                    <a style="color: black; text-decoration: none;" href="/admin/khuyen-mai/detail/\${khuyenMaiSanPham.ma}" target="_blank"><p class=""> <span>Sắp hoạt động Khuyến mãi: </span><strong>\${khuyenMaiSanPham.ten}</strong></p></a>
                                </div>
                    `
                    }

                    $("#khuyenmai-sanpham").append(htmlKhuyenMai)
                }
            },
            error: function (xhr, status, error) {
                console.log(error);
            }
        });
    }

    detailSP();
</script>
<script src="<c:url value='/assets/js/defined.js'/>"></script>
<script src="<c:url value='/assets/js/validate.js'/>"></script>
<script src="<c:url value='/assets/js/product-attribute.js'/>"></script>
<script src="<c:url value='/assets/api/admin/product.js'/>"></script>
</body>
</html>
