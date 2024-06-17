<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Slider</title>
</head>
<body>
<div class="content-body">
    <div class="container-fluid">
        <form action="" id="form-slider">
            <div class="row mt-3">
                <label>Chọn hình ảnh:</label>
                <div class="form-group col-md-12">
                    <input type="file" id="upload-image" name="ImageUpload">
                    <div id="thumbbox" class="mt-4">
                        <img height="300" width="300" alt="Thumb image" id="thumbimage" style="display: none" />
                    </div>
                </div>
            </div>

            <button type="submit" class="btn" id="them"  style="background-color: #A6edab; color: #00852d">Add</button>
        </form>

        <div class="card mt-4" id="cardSlider" style="box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
        padding: 20px; background-color: #fff">
            <div class="row col-12">
                <h4>Quản lý slider</h4>
            </div>
            <hr>
            <div class="d-flex justify-content-between">
                <hr>
                <table class="table table-hover table-striped"  id="slider">
                    <thead>
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">Hình ảnh</th>
                            <th scope="col">Thao tác</th>
                        </tr>
                    </thead>
                        <tbody>
                        </tbody>
                </table>
            </div>
        </div>
        <ul class="pagination d-flex justify-content-center"  id="pagination"></ul>
    </div>
</div>

<script>
    let pageCurrent = 1;
    function loadSlider() {
        $.ajax({
            url: "/api/slider?page=" + pageCurrent,
            method: 'GET',
            success: function (response) {
                var tbody = $('#slider tbody');
                tbody.empty();
                var index = 0;
                response.data.forEach(function(item) {
                   console.log(response.data);
                    var row = `
                            <tr>
                                <td>\${++index}</td>
                                <td>
                                    <img src='/repository/\${item.image}' style="width: 120px;">
                                </td>
                                <td>
                                    <button type="button" class="btn btn-danger btn-delete" value="\${item.id}">Xóa</button>
                                </td>
                            </tr>`;
                    tbody.append(row);
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
                        if(page !== pageCurrent){
                            event.preventDefault();
                            pageCurrent = page;
                            loadSlider();
                        }
                    },
                });
            },
            error: function(xhr, status, error) {
                console.log('Có lỗi xảy ra: ' + error);
            }
        });
    }
    loadSlider();

    let image = {};
    $("#upload-image").change(function (event) {
        var reader = new FileReader();
        var file = $(this)[0].files[0];
        reader.onload = function (e) {
            let imageBase64 = e.target.result;
            let name = file.name;

            image["base64"] = imageBase64;
            image["image"] = name;
        };
        reader.readAsDataURL(file);
        openImage(this);
    });

    function openImage(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#thumbimage').attr("src", reader.result);
                $('#thumbimage').show();
            };
            reader.readAsDataURL(input.files[0]);
        }
    }

    $('#them').on('click', (e) => {
        e.preventDefault();
            let data = getDataFromForm();
            console.log(data);
            $.ajax({
                url: "/api/slider",
                method: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify(data),
                success: (response) => {
                    window.location.href = '/admin/slider';
                    console.log("success");
                },
                error: (error) => {
                    showError(error.responseJSON.error);
                }
            });
    });

    function getDataFromForm() {
        let dataFromForm = $("#form-slider").serializeArray();
        let data = {};
        $.each(dataFromForm, (index, value) => {
            let propertyName = value.name;
            let propertyValue = value.value;
            data[propertyName] = propertyValue;
        });
        data['image'] = image.image;
        data['base64'] = image.base64;
        return data;
    }

    $('#slider').on('click', (e) => {
        if($(e.target).hasClass('btn-delete')){
            let id = $(e.target).val();
            showConfirm("Bạn có muốn xóa slider này không?")
                .then((confirmed) => {
                    if (confirmed) {
                        $.ajax({
                            url: '/api/slider/' + id,
                            method: 'DELETE',
                            success: function (req) {
                                showSuccess("Delete success");
                                loadSlider();
                            },
                            error: function (xhr, status, error) {
                                showError("Delete fail");
                            }
                        });
                    }
                })
        }
    })
</script>
</body>
</html>
