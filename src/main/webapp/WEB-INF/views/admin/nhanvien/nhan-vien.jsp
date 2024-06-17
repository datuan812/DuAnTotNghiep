<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 9/26/2023
  Time: 11:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Nhân viên</title>
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
            Danh sách thông tin nhân viên
        </h4>
        <div class="row">
            <div class="col-xl-12">
                <div class="card ">
                    <div class=" card-body d-flex mb-3 ">
                        <div class="p-2">
                            <a class="Btnaddkh" type="button" href="/admin/nhan-vien/create" style="text-decoration: none">Add
                                <svg xmlns="http://www.w3.org/2000/svg" class="svg" height="1em" viewBox="0 0 448 512"><style>svg{fill:#ffffff}</style>
                                    <path d="M256 80c0-17.7-14.3-32-32-32s-32 14.3-32 32V224H48c-17.7 0-32 14.3-32 32s14.3 32 32 32H192V432c0 17.7 14.3 32 32 32s32-14.3 32-32V288H400c17.7 0 32-14.3 32-32s-14.3-32-32-32H256V80z"/></svg>
                            </a>
                        </div>

                        <div class="p-2 ms-auto">
                            <div class="InputContainer">
                                <input type="text" id="searchAll"  name="text" class="input"  placeholder="Search">

                                <div class="border"></div>

                                <button id="searchButton" class="micButton">
                                    <svg viewBox="0 0 512 512" class="searchIcon"><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"></path></svg>
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <p class="mt-3" id="iemty"></p>

        <div class="row" id="cardNhanVien">

        </div>
    </div>
    <ul id="pagination" class="d-flex justify-content-center"></ul>
</div>
<script>
    let param = '';
    let pageCurrent = 1;
    function loadNhanVien() {
        $.ajax({
            url: "/api/nhan-vien?page=" + pageCurrent + "&role=STAFF",
            method: 'GET',
            success: function (response) {
                console.log(response)
                var nhanVien = $('#cardNhanVien ');
                nhanVien.empty();
                response.data.forEach(function(item) {
                    var card =
                        ` <div class="col-xl-4 col-xxl-4 col-sm-6">
                                <div class="card user-card">
                                    <div class="card-body pb-0">
                                           <div class="d-flex mb-3 align-items-center">
                                                    <div class="dz-media mr-3 rounded-circle">
                                                         <img src="/repository/\${item.anh}" alt="">
                                                    </div>
                                                     <div>
                                                       <h5 class="title">\${item.ten}</h5>
                                                     <span class="" style="color: #eb8153">\${item.chucVu.ten}</span>
                                                     </div>
                                             </div>
                                            <div class="mb-2">
                                                <span>Username: \${item.ma}</span>
                                            </div>
                                            <span>Email: \${item.email}</span>

                                            <div class="mt-2">
                                                <span>Phone: \${item.soDienThoai}</span>
                                            </div>
                                            <div class="d-flex justify-content-between my-3">
                                                 <a class="btn btn-secondary"  href="/admin/nhan-vien/detail/\${item.ma}" style="text-decoration: none;color: white;">Chi tiết</a>
                                            </div>

                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                            <a class="edit-button"  href="/admin/nhan-vien/edit/\${item.ma}" style="text-decoration: none">
                                               <svg class="edit-svgIcon" viewBox="0 0 512 512">
                                               <path d="M410.3 231l11.3-11.3-33.9-33.9-62.1-62.1L291.7 89.8l-11.3 11.3-22.6 22.6L58.6 322.9c-10.4 10.4-18 23.3-22.2 37.4L1 480.7c-2.5 8.4-.2 17.5 6.1 23.7s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L387.7 253.7 410.3 231zM160 399.4l-9.1 22.7c-4 3.1-8.5 5.4-13.3 6.9L59.4 452l23-78.1c1.4-4.9 3.8-9.4 6.9-13.3l22.7-9.1v32c0 8.8 7.2 16 16 16h32zM362.7 18.7L348.3 33.2 325.7 55.8 314.3 67.1l33.9 33.9 62.1 62.1 33.9 33.9 11.3-11.3 22.6-22.6 14.5-14.5c25-25 25-65.5 0-90.5L453.3 18.7c-25-25-65.5-25-90.5 0zm-47.4 168l-144 144c-6.2 6.2-16.4 6.2-22.6 0s-6.2-16.4 0-22.6l144-144c6.2-6.2 16.4-6.2 22.6 0s6.2 16.4 0 22.6z"></path>
                                             </svg>
                                            </a>
                                             <button type="button" class="delete-button btn-delete-nhan-vien" value="\${item.ma}">
                                             <svg class="delete-svgIcon" viewBox="0 0 448 512">
                                            <path d="M135.2 17.7L128 32H32C14.3 32 0 46.3 0 64S14.3 96 32 96H416c17.7 0 32-14.3 32-32s-14.3-32-32-32H320l-7.2-14.3C307.4 6.8 296.3 0 284.2 0H163.8c-12.1 0-23.2 6.8-28.6 17.7zM416 128H32L53.2 467c1.6 25.3 22.6 45 47.9 45H346.9c25.3 0 46.3-19.7 47.9-45L416 128z"></path>
                                            </svg>
                                            </button>
                                      </div>
                                    </div>
                         </div>
                            `;
                    nhanVien.append(card);

                })
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
                            if(param != ''){
                                searchNhanVien(param)
                            }else{
                                loadNhanVien();
                            }

                        }
                    },
                });
            },
            error: function (xhr, status, error) {
                alert('Lỗi khi lấy danh sách nhân viên: ' + error);
            }
        });
    }
    loadNhanVien();


    $('#cardNhanVien').on('click', (e) => {
        if($(e.target).hasClass('btn-delete-nhan-vien')){
            let ma = $(e.target).val();
            showConfirm("Bạn có muốn xóa?", ma)
                .then((confirmed) => {
                    if (confirmed) {
                        $.ajax({
                            url: '/api/nhan-vien/' + ma,
                            method: 'DELETE',
                            success: function (req) {
                                console.log(req);
                                loadNhanVien()
                                showSuccess("Delete success");
                            },
                            error: function (xhr, status, error) {
                                showError("Delete fail");
                            }
                        });
                    }
                })
        }
    })


    function searchNhanVien(){
        $.ajax({
            url: '/api/nhan-vien/search?q=' + param + "&page=" + pageCurrent,
            method: 'GET',
            dataType: 'json',
            success: function (response) {
                if(response.data.length === 0){
                    $('#iemty').removeClass('d-none')
                    $('#iemty').text("Không tìm thấy nhân viên nào như thế !")
                    $('#cardNhanVien').addClass('d-none');
                    $('#pagination').addClass('d-none');
                }else {
                    $('#iemty').addClass('d-none')
                    $('#cardNhanVien').removeClass('d-none');
                    $('#pagination').removeClass('d-none');
                    var nhanVien = $('#cardNhanVien ');
                    nhanVien.empty();
                    response.data.forEach(function (item) {
                        var card =
                            ` <div class="col-xl-4 col-xxl-4 col-sm-6">
                                <div class="card user-card">
                                    <div class="card-body pb-0">
                                           <div class="d-flex mb-3 align-items-center">
                                                    <div class="dz-media mr-3 rounded-circle">
                                                         <img src="/assets/images/nhanvien/\${item.anh}" alt="">
                                                    </div>
                                                     <div>
                                                       <h5 class="title">\${item.ten}</h5>
                                                     <span class="" style="color: #eb8153">\${item.chucVu.ten}</span>
                                                     </div>
                                             </div>
                                            <div class="mb-2">
                                                <span>Username: \${item.ma}</span>
                                            </div>
                                            <span>Email: \${item.email}</span>

                                            <div class="mt-2">
                                                <span>Phone: \${item.soDienThoai}</span>
                                            </div>
                                            <div class="d-flex justify-content-between my-3">
                                                 <a class="btn btn-secondary"  href="/admin/nhan-vien/detail/\${item.ma}" style="text-decoration: none;color: white;">Chi tiết</a>
                                            </div>

                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                            <a class="edit-button"  href="/admin/nhan-vien/edit/\${item.ma}" style="text-decoration: none">
                                               <svg class="edit-svgIcon" viewBox="0 0 512 512">
                                               <path d="M410.3 231l11.3-11.3-33.9-33.9-62.1-62.1L291.7 89.8l-11.3 11.3-22.6 22.6L58.6 322.9c-10.4 10.4-18 23.3-22.2 37.4L1 480.7c-2.5 8.4-.2 17.5 6.1 23.7s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L387.7 253.7 410.3 231zM160 399.4l-9.1 22.7c-4 3.1-8.5 5.4-13.3 6.9L59.4 452l23-78.1c1.4-4.9 3.8-9.4 6.9-13.3l22.7-9.1v32c0 8.8 7.2 16 16 16h32zM362.7 18.7L348.3 33.2 325.7 55.8 314.3 67.1l33.9 33.9 62.1 62.1 33.9 33.9 11.3-11.3 22.6-22.6 14.5-14.5c25-25 25-65.5 0-90.5L453.3 18.7c-25-25-65.5-25-90.5 0zm-47.4 168l-144 144c-6.2 6.2-16.4 6.2-22.6 0s-6.2-16.4 0-22.6l144-144c6.2-6.2 16.4-6.2 22.6 0s6.2 16.4 0 22.6z"></path>
                                             </svg>
                                            </a>
                                             <button type="button" class="delete-button btn-delete-nhan-vien" value="\${item.ma}">
                                             <svg class="delete-svgIcon" viewBox="0 0 448 512">
                                            <path d="M135.2 17.7L128 32H32C14.3 32 0 46.3 0 64S14.3 96 32 96H416c17.7 0 32-14.3 32-32s-14.3-32-32-32H320l-7.2-14.3C307.4 6.8 296.3 0 284.2 0H163.8c-12.1 0-23.2 6.8-28.6 17.7zM416 128H32L53.2 467c1.6 25.3 22.6 45 47.9 45H346.9c25.3 0 46.3-19.7 47.9-45L416 128z"></path>
                                            </svg>
                                            </button>
                                      </div>
                                    </div>
                         </div>
                            `;
                        nhanVien.append(card);

                    })
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
                                if(param != ''){
                                    searchNhanVien(param)
                                }else{
                                    loadNhanVien();
                                }
                            }
                        },
                    });
                }
            },
            error: function (xhr, status, error) {
                console.log(error)
            }
        });
    }

    $('#searchButton').on('click', (e) =>{
        e.preventDefault();
        param = $('#searchAll').val().trim();
        if(pageCurrent > 1){
            pageCurrent = 1;
        }
        searchNhanVien();
    })
</script>
</body>
</html>