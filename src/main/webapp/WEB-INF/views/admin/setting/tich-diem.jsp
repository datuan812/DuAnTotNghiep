<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 10/31/2023
  Time: 3:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tích điểm</title>
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
            Thiết lập tích điểm
        </h4>

        <div class="card"
             style="box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;padding: 20px;">
            <form id="tien-quy-ra-diem">
                <div class="row">
                    <div class="col-lg-2">
                        <span>Tỉ lệ quy đổi điểm thưởng:</span>
                    </div>
                    <input type="hidden" name="id" value="">
                    <div class="col-lg-2">
                        <div class="input-wrapper1">
                            <input class="input-box1" type="text" name="tien">
                            <span class="underline1"></span>
                        </div>
                    </div>
                    <div class="col-lg-1">
                        <span style="color: white; background-color: #3AB54B; border: 1px solid #3AB54B; padding: 5px">VND</span>
                    </div>
                    <div class="col-lg-1">
                        =
                    </div>
                    <div class="col-lg-2">
                        <div class="input-wrapper1">
                            <input class="input-box1" type="text" name="diem">
                            <span class="underline1"></span>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <span style="color: white; background-color: #c17a74; border: 1px solid #c17a74; padding: 5px">Điểm</span>
                    </div>
                    <input type="hidden" value="TIENQUYDIEM" name="loai">
                </div>
            </form>

            <form id="diem-quy-ra-tien">
                <div class="row mt-4">
                    <div class="col-lg-2">
                        <span>Thanh toán bằng điểm:</span>
                    </div>
                    <div class="col-lg-2">
                        <input type="hidden" name="id" value="">
                        <div class="input-wrapper1">
                            <input class="input-box1" type="text" name="diem">
                            <span class="underline1"></span>
                        </div>
                    </div>
                    <div class="col-lg-1">
                        <span style="color: white; background-color: #c17a74; border: 1px solid #c17a74; padding: 5px">Điểm</span>
                    </div>
                    <div class="col-lg-1">
                        =
                    </div>
                    <div class="col-lg-2">
                        <div class="input-wrapper1">
                            <input class="input-box1" type="text" name="tien">
                            <span class="underline1"></span>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <span style="color: white; background-color: #3AB54B; border: 1px solid #3AB54B; padding: 5px">VND</span>
                    </div>
                    <input type="hidden" value="DIEMQUYTIEN" name="loai">
                </div>
            </form>

            <div class="row mt-4">
                <div>
                    <button id="submit" class="btn btn-success"><i class="bi bi-floppy"></i> Lưu</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    function loadQuyDoi() {
        $.ajax({
            url: '/api/quy-doi-diem',
            method: 'GET',
            contentType: "application/json; charset=utf-8",
            success: function (req) {
                if (req.length === 0) {
                    console.log("Empty")
                } else {
                    $.each(req, (index, item) => {
                        console.log(item)
                        if (item.loai === 'TIENQUYDIEM') {
                            $("#tien-quy-ra-diem input[name='id']").val(item.id),
                            $("#tien-quy-ra-diem input[name='tien']").val(item.tien),
                            $("#tien-quy-ra-diem input[name='diem']").val(item.diem),
                            $("#tien-quy-ra-diem input[name='loai']").val(item.loai)
                        } else {
                            $("#diem-quy-ra-tien input[name='id']").val(item.id),
                            $("#diem-quy-ra-tien input[name='tien']").val(item.tien),
                            $("#diem-quy-ra-tien input[name='diem']").val(item.diem),
                            $("#diem-quy-ra-tien input[name='loai']").val(item.loai)
                        }
                    })

                }
            },
            error: function (xhr, status, error) {
                alert('Có lỗi xảy ra: ' + error);
            }
        });
    }

    loadQuyDoi();


    $(document).ready(function () {

        if(role === "STAFF"){
            $('#submit').remove();
        }

        $("#submit").on("click", function (e) {
            e.preventDefault();

            var tienQuyDiem = {
                id: $("#tien-quy-ra-diem input[name='id']").val(),
                tien: $("#tien-quy-ra-diem input[name='tien']").val(),
                diem: $("#tien-quy-ra-diem input[name='diem']").val(),
                loai: $("#tien-quy-ra-diem input[name='loai']").val()
            };

            var diemQuyTien = {
                id: $("#diem-quy-ra-tien input[name='id']").val(),
                tien: $("#diem-quy-ra-tien input[name='tien']").val(),
                diem: $("#diem-quy-ra-tien input[name='diem']").val(),
                loai: $("#diem-quy-ra-tien input[name='loai']").val()
            };

            var formData = [
               tienQuyDiem, diemQuyTien
            ];
            console.log(formData);
            $.ajax({
                url: '/api/quy-doi-diem',
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify(formData),
                success: function (response) {
                    showSuccess("Quy đổi thành công");
                },
                error: function (error) {
                    showError("Quy đổi thất bại. Lỗi: " + error.statusText);
                },
            });
        });

    });
</script>
</body>
</html>
