<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 12/21/2023
  Time: 1:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<%@ page import="com.laptrinhjavaweb.security.utils.SecurityUtils" %>
<html>
<head>
    <title>Thông tin tích điểm</title>
</head>
<body>
<div style="box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 1px 3px 1px; padding: 20px">
    <div class="card">
        <div class="p-2">
            <ul class="nav">
                <li class="nav-item ms-5">
                    <button id="lichSuButton" class="btn btn-default">
                        <i class="bi bi-receipt fs-2"></i>
                        <h5 class="text-primary">Lịch sử</h5>
                    </button>
                </li>
                <li class="nav-item p-4 ms-auto">
                    <span class="badge bg-primary text-wrap fs-3">
                        <i class="bi bi-piggy-bank-fill me-2"></i><span class="" id="point-customer"> 0</span>
                    </span>
                </li>
            </ul>
        </div>
    </div>

    <div class="mt-4" id="lichSuContainer" style="display: none;">
        <div class="row">
            <span class="fs-4" style="border-bottom: 1px solid #dedede; padding: 20px">Lịch sử tích điểm:</span>

        </div>
        <div>
            <table class="table table-hover" id="tblLichSu">
                <thead>
                <tr class="text-center">
                    <th>#</th>
                    <th>Mã hóa đơn</th>
                    <th>Số điểm tích được</th>
                    <th>Số điểm dùng</th>
                    <th>Số điểm hoàn</th>
                    <th>Ngày tích</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        var lichSuButton = document.getElementById("lichSuButton");
        var lichSuContainer = document.getElementById("lichSuContainer");

        lichSuButton.addEventListener("click", function () {
            var isHidden = lichSuContainer.style.display === "none";

            if (isHidden) {
                lichSuContainer.style.display = "block";
            } else {
                lichSuContainer.style.display = "none";
            }
        });
    });


    let ma = $('#customer-code').val();

    function loadLSTD() {
        $.ajax({
            url: "/api/lich-su-tich-diem/" + ma,
            method: 'GET',
            success: function (response) {
                var tbody = $('#tblLichSu tbody');
                tbody.empty();
                var index = 0;
                response.forEach(function(item) {
                    var row = `
                            <tr class="text-center">
                                <td>\${++index}</td>
                                <td>\${item.maHoaDon == '' ? 'Đổi điểm' : item.maHoaDon}</td>
                                 <td>\${item.soDiemTichDuoc != null ? item.soDiemTichDuoc : 0}</td>
                                 <td>\${item.soDiemDung != null ? item.soDiemDung : 0}</td>
                                 <td>\${item.soDiemHoan != null ? item.soDiemHoan : 0}</td>
                                 <td>\${getDateTime(item.ngayTao)}</td>
                            </tr>
                        `;
                    tbody.append(row);
                });

            },
            error: function(xhr, status, error) {
                console.log('Có lỗi xảy ra: ' + error);
            }
        });
    }
    loadLSTD();

    function loadSoDiem(ma) {
        $.ajax({
            url: "/api/tich-diem/" + ma,
            method: "GET",
            dataType: "json",
            success: (response) => {
                $('#point-customer').text(response);
            },
            error: (error) => {
                console.log(error);
            }
        });
    }

    loadSoDiem(ma);

</script>
</body>
</html>
