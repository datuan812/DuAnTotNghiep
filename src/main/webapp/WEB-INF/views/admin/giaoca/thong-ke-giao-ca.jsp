<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 10/22/2023
  Time: 6:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thống kê giao ca</title>
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
         Thống kê giao ca
        </h4>

                <div class="project-nav">
                    <div class="card-action card-tabs  mr-auto">
                        <ul class="nav nav-tabs style-2">
                            <li class="nav-item">
                                <a href="#navpills-1" class="nav-link active" data-toggle="tab" aria-expanded="false">All Projects <span class="badge badge-pill shadow-primary badge-primary">154</span></a>
                            </li>
                            <li class="nav-item">
                                <a href="#navpills-2" class="nav-link" data-toggle="tab" aria-expanded="false">On Progress <span class="badge badge-pill badge-info shadow-info">2</span></a>
                            </li>
                            <li class="nav-item">
                                <a href="#navpills-3" class="nav-link" data-toggle="tab" aria-expanded="true">Pending <span class="badge badge-pill badge-warning shadow-warning">4</span></a>
                            </li>
                            <li class="nav-item">
                                <a href="#navpills-4" class="nav-link" data-toggle="tab" aria-expanded="true">Closed <span class="badge badge-pill badge-danger shadow-danger">1</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="tab-content project-list-group" id="myTabContent">
                    <div class="tab-pane fade active show" id="cardCaLam">

                    </div>
                    <ul id="pagination" class="d-flex justify-content-center"></ul>
                </div>
    </div>
</div>


<script>

    function getDateTimeFromTimestamp(unixTimeStamp) {
        let date = new Date(unixTimeStamp);
        return ('0' + date.getDate()).slice(-2) + '/' + ('0' + (date.getMonth() + 1)).slice(-2) + '/' + date.getFullYear() + ' ' + ('0' + date.getHours()).slice(-2) + ':' + ('0' + date.getMinutes()).slice(-2) + ':' + ('0' + date.getSeconds()).slice(-2);
    }


    let pageCurrent = 1;
    function loadCaLam() {
        $.ajax({
            url: "/api/ca-lam?page=" + pageCurrent,
            method: 'GET',
            success: function (response) {
                console.log(response)
                var caLam = $('#cardCaLam');
                caLam.empty();
                response.data.forEach(function(item) {
                    var card =
                        ` <div class="card">
                                <div class="project-info">
                                <div class="col-xl-3 my-2 col-lg-4 col-sm-6">
                                    <h5 class="title font-w600 mb-2"><a href="#" class="text-black text-decoration-none">Nhân viên: \${item.maNhanVien}</a></h5>
                                    <div class="text-dark"><i class="fa fa-calendar-o mr-3" aria-hidden="true"></i>Mở ca: \${getDateTimeFromTimestamp(item.ngayTao)}</div>
                                    <div class="text-dark"><i class="fa fa-calendar-o mr-3" aria-hidden="true"></i>Đóng ca: \${getDateTimeFromTimestamp(item.ngaySua)}</div>
                                </div>
                                <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                                    <div class="d-flex align-items-center">
                                        <div class="ml-2">
                                            <span>Số tiền đầu ca</span>
                                            <h5 class="mb-0 pt-1 font-w50 text-black">\${item.soTienDauCa} đ</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                                    <div class="d-flex align-items-center">
                                        <div class="ml-2">
                                            <span>Số tiền cuối ca</span>
                                            <h5 class="mb-0 pt-1 font-w500 text-black">\${item.soTienCuoiCa} đ</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                    <div class="d-flex align-items-center">
                                        <div class="ml-2">
                                            <span>Tiền mặt bàn giao </span>
                                            <h5 class="mb-0 pt-1 font-w500 text-black">\${item.tienMatBanGiao} đ</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                    <div class="d-flex align-items-center">
                                        <div class="ml-2">
                                            <span>Số tiền chênh lệch</span>
                                            <h5 class="mb-0 pt-1 font-w500 text-black">\${item.tienChenhLech} đ</h5>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xl-1 my-2 col-lg-6 col-sm-6">
                                    <div class="dropdown">
                                        <a href="javascript:void(0);" data-toggle="dropdown" aria-expanded="false">
                                            <svg width="24" height="24" viewbox="0 0 24 24" fill="none"
                                                 xmlns="http://www.w3.org/2000/svg">
                                                <path d="M12 13C12.5523 13 13 12.5523 13 12C13 11.4477 12.5523 11 12 11C11.4477 11 11 11.4477 11 12C11 12.5523 11.4477 13 12 13Z"
                                                      stroke="#575757" stroke-width="2" stroke-linecap="round"
                                                      stroke-linejoin="round"></path>
                                                <path d="M12 6C12.5523 6 13 5.55228 13 5C13 4.44772 12.5523 4 12 4C11.4477 4 11 4.44772 11 5C11 5.55228 11.4477 6 12 6Z"
                                                      stroke="#575757" stroke-width="2" stroke-linecap="round"
                                                      stroke-linejoin="round"></path>
                                                <path d="M12 20C12.5523 20 13 19.5523 13 19C13 18.4477 12.5523 18 12 18C11.4477 18 11 18.4477 11 19C11 19.5523 11.4477 20 12 20Z"
                                                      stroke="#575757" stroke-width="2" stroke-linecap="round"
                                                      stroke-linejoin="round"></path>
                                            </svg>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="/admin/giao-ca/chi-tiet-ca-lam/\${item.id}">Xem chi tiết</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                            `;
                    caLam.append(card);

                })
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
                                loadCaLam();
                        }
                    },
                });
            },
            error: function (xhr, status, error) {
                alert('Lỗi khi lấy danh sách ca làm: ' + error);
            }
        });
    }
    loadCaLam();
</script>

</body>
</html>
