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
    <title>Thêm mới sản phẩm</title>
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
            Thêm sản phẩm mới
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
                        <label for="ten" class="form-label">Giá</label>
                        <input name="gia" type="text" class="form-control" id="gia"/>
                    </div>

                    <div class="col-6 mt-4">
                        <label for="slug" class="form-label">Danh mục</label>
                        <select class="form-select" name="danhMucSlug">
                            <option value="" selected>Vui lòng chọn danh mục</option>
                            <c:forEach var="item" items="${categoriesProduct}">
                                <option value="${item.slug}">${item.ten}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col-6 mt-4">
                        <label for="slug" class="form-label">Thương hiệu</label>
                        <select class="form-select" name="thuongHieuSlug">
                            <option selected>Vui lòng chọn thương hiệu</option>
                            <c:forEach var="item" items="${brandsProduct}">
                                <option value="${item.slug}">${item.ten}</option>
                            </c:forEach>
                        </select>
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
                                                        class="form-control"
                                                        placeholder="Thiết lập giá cho tất cả thuộc tính"
                                                        id="price-all"
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
                                        <tbody class="table-variant-body" id="variants"></tbody>
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

                    <div class="col-3">
                        <button type="button" class="btn btn-success mb-4 btn-add-product">Submit</button>
                    </div>
                </div>
            </form>
        </div>

    </div>
</div>
<input type="hidden" name="" value="" id="product-id">
<script src="<c:url value='/template/admin/ckeditor/ckeditor.js'/>"></script>
<script>
    let ckeChiTietSanPham = CKEDITOR.replace("chitietsanpham");
    let ckeMoTaSanPham = CKEDITOR.replace("motasanpham");
</script>
<script src="<c:url value='/assets/js/defined.js'/>"></script>
<script src="<c:url value='/assets/js/validate.js'/>"></script>
<script src="<c:url value='/assets/js/product-attribute.js'/>"></script>
<script src="<c:url value='/assets/api/admin/product.js'/>"></script>
</body>
</html>
