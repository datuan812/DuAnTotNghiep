<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 11/22/2023
  Time: 1:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lịch sử tích điểm</title>
</head>
<body>
<div class="content-body" >
    <div class="container-fluid">
        <div class="card" style="box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
        padding: 20px; background-color: #fff">
            <div class=" hstack gap-3">
                <div class="p-2">
                    <h4>Lịch sử tích điểm</h4>
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
            <hr>
            <div class="d-flex justify-content-between">
                <hr>
                <table class="table table-hover" id="tbllstd" >
                    <thead>
                    <tr class="text-center">
                        <th scope="col">STT</th>
                        <th scope="col">Mã Hóa đơn</th>
                        <th scope="col">Tên khách hàng</th>
                        <th scope="col">Số điện thoại</th>
                        <th scope="col">Số điểm tích được</th>
                        <th scope="col">Số điểm dùng</th>
                        <th scope="col">Số điểm hoàn</th>
                        <th scope="col">Ngày tích</th>
                    </tr>
                    </thead>
                    <tbody >

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script>
    function getLSTD() {
        $.ajax({
            url: '/api/lich-su-tich-diem',
            method: 'GET',
            success: function (response) {

                var tbody = $('#tbllstd tbody');
                tbody.empty();
                var index = 0;
                response.forEach(function (item) {
                    console.log(response)
                    var row = `
                            <tr class="text-center">
                                 <td>\${++index}</td>
                                 <td>\${item.maHoaDon}</td>
                                 <td>\${item.tenKhachHang}</td>
                                 <td>\${item.soDienThoai}</td>
                                 <td>\${item.soDiemTichDuoc != null ? item.soDiemTichDuoc : 0}</td>
                                 <td>\${item.soDiemDung != null ? item.soDiemDung : 0}</td>
                                 <td>\${item.soDiemHoan != null ? item.soDiemHoan : 0}</td>
                                 <td>\${formatDateInput(item.ngayTao)}</td>
                            </tr>
                        `;
                    tbody.append(row);
                });
            },
            error: function (xhr, status, error) {
                showError("Lỗi xảy ra ");
            }
        });
    }
    getLSTD();

    $('#searchButton').on('click', (e) =>{
        e.preventDefault();
        param = $('#searchAll').val().trim();
        if(param != ''){
            searchLichSu(param);
        }else{
            getLSTD();
        }
    })

    function searchLichSu(){
        $.ajax({
            url: '/api/lich-su-tich-diem/search?sdtKhachHang=' + param,
            method: 'GET',
            dataType: 'json',
            success: function (response) {

                    var tbody = $('#tbllstd tbody');
                    tbody.empty();
                    var index = 0;
                    response.forEach(function (item) {
                        var row = `
                           <tr class="text-center">
                                <td>\${++index}</td>
                                 <td>\${item.maHoaDon}</td>
                                 <td>\${item.tenKhachHang}</td>
                                 <td>\${item.soDienThoai}</td>
                                 <td>\${item.soDiemTichDuoc != null ? item.soDiemTichDuoc : 0}</td>
                                 <td>\${item.soDiemDung != null ? item.soDiemDung : 0}</td>
                                 <td>\${item.soDiemHoan != null ? item.soDiemHoan : 0}</td>
                                 <td>\${formatDateInput(item.ngayTao)}</td>
                            </tr>
                        `;
                        tbody.append(row);
                    });

            },
            error: function (xhr, status, error) {
                showError("Không tìm thấy khách hàng nào như thế!")
            }
        });
    }
</script>
</body>
</html>
