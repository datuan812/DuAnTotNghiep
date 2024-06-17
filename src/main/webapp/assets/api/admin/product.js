function validateProduct() {
    let ten = $("#ten").val();
    let gia = $("#gia").val();
    if (ten === "") {
        showError("Tên sản phẩm không được để trống");
        return false;
    }
    if (gia === "") {
        showError("Giá không được để trống");
        return false;
    }
    if(isNaN(gia)){
        showError("Giá không hợp lệ. Vui lòng nhập số");
        return false;
    }
    return true;
}

$(".btn-add-product").on("click", function (event) {
    event.preventDefault();
    let method = "POST";
    let message = "Thêm sản phẩm thành công";
    if (validateProduct()) {
        let data = getDataFromForm();
        data["id"] = $('#product-id').val();
        data["anh"] = getImageOfProduct();
        if (data["anh"].length === 0) {
            showError("Vui lòng chọn hình ảnh của sản phẩm");
            return false;
        }
        data["thuocTinh"] = getAttributeValues();

        if(data["thuocTinh"].length === 0){
            showError("Vui lòng nhập thuộc tính của sản phẩm");
            return false;
        }

        let hasEmptyGiaTris = false;
        $.each(data["thuocTinh"], function (index, item) {
            if (item.giaTris.length === 0) {
                hasEmptyGiaTris = true;
                return false;
            }
        });
        if (hasEmptyGiaTris) {
            showError("Vui lòng nhập giá trị thuộc tính của sản phẩm");
            return false;
        }
        data["bienThe"] = getVariants();
        $.each(data["bienThe"], function (index, item) {
            if (isNumber(item.gia) === false || isNumber(item.soLuong) === false) {
                hasEmptyGiaTris = true;
                return false;
            }
        });
        if (hasEmptyGiaTris) {
            showError("Số lượng hoặc giá không đúng định dạng. Xin kiểm tra lại");
            return false;
        }

        if(data["id"] !== "")
        {
            data["id"] = parseInt(data["id"]);
            method = "PUT";
            message = "Cập nhật sản phẩm thành công";
        }

        $.ajax({
            url: "/api/san-pham",
            method: method,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: JSON.stringify(data),
            success: (response) => {
                showSuccess(message);
                window.location.href = "/admin/san-pham";
            },
            error: (error) => {
                showError(error.responseJSON.error)
            }
        });
    }
});
