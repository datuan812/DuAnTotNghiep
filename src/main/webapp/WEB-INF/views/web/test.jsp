<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 11/11/2023
  Time: 4:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .color-selector {
            display: flex;
            align-items: center;
            margin: 10px 0;
        }
        label {
            margin-right: 10px;
        }
        .color-buttons {
            display: flex;
        }
        .color-button {
            border: 1px solid #ccc;
            padding: 5px 10px;
            cursor: pointer;
            background: #fff;
            margin-right: 10px;
            transition: border-color 0.3s;
        }
        .color-button:hover {
            border-color: red;
        }
        .color-button.active {
            border-color: red;
        }
        .size-button {
            border: 1px solid #ccc;
            padding: 5px 10px;
            cursor: pointer;
            background: #fff;
            margin-right: 10px;
            transition: border-color 0.3s;
        }
        .size-button:hover {
            border-color: red;
        }
        .size-button.active {
            border-color: red;
        }
    </style>
</head>
<body>

<div class="row mt-2" style="border-bottom: 1px solid #dedede">
    <div class="col-5">
        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
            <input type="checkbox" class="custom-control-input" checked id="price-2">
            <label class="custom-control-label" for="price-2">
                <div class="mb-3" style="max-width: 540px;">
                    <div class="row g-0">
                        <div class="col-lg-3">
                            <img src="/template/web/img/anh3.png" class="img-fluid rounded-start" alt="...">
                        </div>
                        <div class="col-lg-9">
                            <div class="card-body">
                                <h5 class="card-title">Áo polo nam </h5>
                                <div class="btn-group">
                                                    <span class="dropdown-toggle"  data-bs-toggle="dropdown" data-bs-auto-close="false" aria-expanded="false" >
                                                        Phân loại hàng
                                                    </span>
                                    <ul class="dropdown-menu p-3">
                                        <li>
                                            <div class="color-selector">
                                                <label>Color:</label>
                                                <div class="color-buttons">
                                                    <button class="color-button" data-color="black">Black</button>
                                                    <button class="color-button" data-color="red">Red</button>
                                                    <button class="color-button" data-color="blue">BLue</button>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="color-selector">
                                                <label>Size:</label>
                                                <div class="color-buttons">
                                                    <button class="size-button" data-color="s">Size S</button>
                                                    <button class="size-button" data-color="m">Size M</button>
                                                    <button class="size-button" data-color="l">Size L</button>
                                                    <button class="size-button" data-color="xl">Size XL</button>
                                                    <button class="size-button" data-color="xxl">Size XXL</button>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="text-right ">
                                            <button type="button" class="btn btn-light" id="cancelButton" >Cancel</button>
                                            <button type="button" class="btn text-light" style="background-color: #C3817B" >Submit</button>
                                        </li>
                                    </ul>

                                </div>
                                <p id="selectedItems"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </label>
        </div>
    </div>
    <div class="col-2">
        <span>99.000₫</span>
    </div>
    <div class="col-2">
                    <span>
                        <div class="input-group quantity" style="width: 100px;">
                                    <div class="input-group-btn">
<button class="btn btn-sm btn-primary btn-minus" >
                                            <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                    <input type="text" class="form-control form-control-sm bg-secondary text-center" value="1">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-plus">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                    </span>
    </div>
    <div class="col-2">
        <span>99.000₫</span>
    </div>
    <div class="col-1">
        <a>Xóa</a>
    </div>
</div>

<script>
    $(document).ready(function () {
        var selectedColor = null;
        var selectedSize = null;

        $(".color-button").on("click", function () {
            // Xóa lớp 'active' từ tất cả các nút
            $(".color-button").removeClass("active");
            // Thêm lớp 'active' vào nút đang được chọn
            $(this).addClass("active");

            selectedColor = $(this).data("color");
            updateSelectedItems();
        });

        $(".size-button").on("click", function () {
            $(".size-button").removeClass("active");
            $(this).addClass("active");

            selectedSize = $(this).data("color");
            updateSelectedItems();
        });

        $('#cancelButton').on('click', function () {
            // Ẩn dropdown khi nhấn nút "Cancel"
            $('.dropdown-menu').removeClass('show');
        });

        function updateSelectedItems() {
            // Cập nhật nội dung thẻ <span> với màu sắc và kích thước đã chọn
            var selectedItems = "Color: " + (selectedColor ? selectedColor : "Chưa chọn");
            selectedItems += " - Size: " + (selectedSize ? selectedSize : "Chưa chọn");
            $("#selectedItems").text(selectedItems);
        }
    });
</script>
</body>
</html>
