<%--
  Created by IntelliJ IDEA.
  User: huydq
  Date: 14-10-2023
  Time: 11:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Chi tiết khuyến mại</title>
<section>
    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-12 col-lg-12">
                    <div class="card project-card">
                        <div class="card-body">
                            <div class="d-flex mb-4 align-items-start">
                                <%--                                <div class="dz-media mr-3">--%>
                                <%--&lt;%&ndash;                                    <img src="images/logos/pic1.jpg" class="img-fluid" alt="">&ndash;%&gt;--%>
                                <%--                                </div>--%>
                                <div class="mr-auto">
                                    <p class="text-primary mb-1">#<span id="maKM"></span></p>
                                    <h5 class="title font-w600 mb-2"><a class="text-black" id="tenKM"></a></h5>
                                    <span>Người tạo: <span id="nguoiTao"></span></span>
                                </div>
                                <div id="cardTrangThai"></div>

                            </div>

                            <div class="row mb-4">
                                <div class="col-sm-3 mb-sm-0 mb-3 d-flex">
                                    <div class="dt-icon bgl-info mr-3">
                                        <svg width="24" height="24" viewbox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M19 5H18V3C18 2.73478 17.8946 2.48043 17.7071 2.29289C17.5196 2.10536 17.2652 2 17 2C16.7348 2 16.4804 2.10536 16.2929 2.29289C16.1054 2.48043 16 2.73478 16 3V5H8V3C8 2.73478 7.89464 2.48043 7.70711 2.29289C7.51957 2.10536 7.26522 2 7 2C6.73478 2 6.48043 2.10536 6.29289 2.29289C6.10536 2.48043 6 2.73478 6 3V5H5C4.20435 5 3.44129 5.31607 2.87868 5.87868C2.31607 6.44129 2 7.20435 2 8V9H22V8C22 7.20435 21.6839 6.44129 21.1213 5.87868C20.5587 5.31607 19.7957 5 19 5Z" fill="#92caff"></path>
                                            <path d="M2 19C2 19.7956 2.31607 20.5587 2.87868 21.1213C3.44129 21.6839 4.20435 22 5 22H19C19.7957 22 20.5587 21.6839 21.1213 21.1213C21.6839 20.5587 22 19.7956 22 19V11H2V19Z" fill="#51A6F5"></path>
                                        </svg>
                                    </div>
                                    <div>
                                        <span>Ngày bắt đầu</span>
                                        <p class="mb-0 pt-1 font-w500 text-black" id="ngayBatDauFMT"></p>
                                    </div>
                                </div>
                                <div class="col-sm-3 d-flex">
                                    <div class="dt-icon mr-3 bgl-danger">
                                        <svg width="19" height="24" viewbox="0 0 19 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M18.6601 8.6858C18.5437 8.44064 18.2965 8.28427 18.025 8.28427H10.9728L15.2413 1.06083C15.3697 0.843469 15.3718 0.573844 15.2466 0.354609C15.1214 0.135375 14.8884 -9.37014e-05 14.6359 4.86277e-08L8.61084 0.000656299C8.3608 0.000750049 8.12957 0.1335 8.00362 0.349453L0.0958048 13.905C-0.0310859 14.1224 -0.0319764 14.3911 0.0934142 14.6094C0.218805 14.8277 0.451352 14.9624 0.703117 14.9624H7.71037L5.66943 23.1263C5.58955 23.4457 5.74213 23.7779 6.03651 23.9255C6.13691 23.9757 6.24459 24 6.35123 24C6.55729 24 6.75923 23.9094 6.89638 23.7413L18.5699 9.43186C18.7415 9.22148 18.7766 8.93105 18.6601 8.6858V8.6858Z" fill="#FF4C41"></path>
                                        </svg>
                                    </div>
                                    <div>
                                        <span>Ngày kết thúc</span>
                                        <p class="mb-0 pt-1 font-w500 text-black" id="ngayketThucFMT"></p>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex flex-wrap align-items-center">

                                <div class="d-flex align-items-center mb-4">
                                    <div class="text-center border-bx mr-3">
                                        <span>Tổng số lượng</span>
                                        <p class="mb-0 pt-1 font-w600 text-black">
                                            <span id="tong"></span>
                                        </p>
                                    </div>
                                    <div class="text-center border-bx">
                                        <span>Đã dùng</span>
                                        <p class="mb-0 pt-1 font-w600 text-black">
                                            <span id="soLuongSuDung"></span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <div class="mb-3">Giá trị:<span class="text-black ml-1 font-w550" id="giaTriGiam"></span><span class="text-black ml-1 font-w550" id="loai"></span></div>
                                    <div class="mb-3">Số lượng còn lại:<span class="text-black ml-1 font-w550" id="soLuong"></span></div>
                                    <div class="mb-3">
                                        <div class="mb-3">Sản phẩm khuyến mại:</div>

                                        <table class="table table-hover table-striped">
                                            <tbody class="tbody-product-select">
                                            <div id="cardSanPham">

                                            </div>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div>

                                </div>
                            </div>
                            <br>
                            <div>
                                    <div class="form-group row">
                                        <div id="cardBtn">
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
                <%--                <div class="col-xl-6 col-lg-12">--%>
                <%--                    <div class="card project-card">--%>
                <%--                        <div class="card-header">--%>
                <%--                            <h4 class="card-title">Biểu đồ tổng quát</h4>--%>
                <%--                        </div>--%>
                <%--                        <div class="card-body">--%>
                <%--                            <div id="flotLine1" class="flot-chart"></div>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>

            </div>
        </div>
    </div>
</section>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>

    var url = window.location.pathname.split("/");
    var maKM = url[url.length - 1];
    $.ajax({
        url: '/api/khuyen-mai/detail/'+maKM,
        method: 'GET',
        success: function(data) {
            console.log(data);
            // $("#maKM").attr("maKM", data.maKM);
            $("#maKM").text(data.ma);
            $("#tenKM").text(data.ten);
            $("#nguoiTao").text(data.nguoiTao);
            var ngayBatDauFMT = formatMicrosoftJSONDate(data.ngayBatDau);
            var ngayKetThucFMT = formatMicrosoftJSONDate(data.ngayKetThuc);
            var ngayTaoFMT = formatMicrosoftJSONDate(data.ngayTao);
            $("#ngayBatDauFMT").text(ngayBatDauFMT);
            $("#ngayketThucFMT").text(ngayKetThucFMT);
            $("#tong").text(data.tong);
            $("#giaTriGiam").text(formatNumber(data.giaTri));
            var thongKe = data.thongKe;


            if(thongKe.soLuongSuDung === null){
                $("#soLuongSuDung").text("0");
            }else{
                $("#soLuongSuDung").text(thongKe.soLuongSuDung);
            }

            if(thongKe.soTienThuDuoc === null){
                $("#soTienThuDuoc").text("0");
            }else{
                $("#soTienThuDuoc").text(formatNumber(thongKe.soTienThuDuoc));
            }
            if(thongKe.soTienGiam === null){
                $("#soTienGiam").text("0");
            }else{
                $("#soTienGiam").text(formatNumber(thongKe.soTienGiam));
            }
            if(data.loai == 1){
                $("#loai").text("%");
            }else{
                $("#loai").text("đ");
            }
            let conlai = data.tong - thongKe.soLuongSuDung;
            $("#soLuong").text(conlai);
            var dsSanPhamKhuyenMai = data.listSanPham;
            console.log(dsSanPhamKhuyenMai)
            let html = '';
            var i = 0
            dsSanPhamKhuyenMai.forEach(function (item){
                i++;
                if(item.trangThai === "ACTIVE" || item.trangThai === "INACTIVE"){
                    let isChecked = item.trangThai === "ACTIVE" ? "checked" : "";
                    html +=  `<tr>
                                <td>\${i}</td>
                                <td>
                                    <img src='/repository/\${item.sanPhamResponse.anh[0].hinhAnh}' style="width: 80px;">
                                </td>
                                <td>\${item.sanPhamResponse.ten}</td>
                                <td class="text-center">
                                    <label class="switch">
                                        <input class="checked-update-status" type="checkbox" \${isChecked}>
                                        <span class="slider"></span>
                                    </label>
                                </td>
                            <input class="product-discount-id" type="hidden" value="\${item.id}">
                            </tr>`
                }else{
                    html +=  `<tr>
                                <td>\${i}</td>
                                <td>
                                    <img src='/repository/\${item.sanPhamResponse.anh[0].hinhAnh}' style="width: 80px;">
                                </td>
                                <td>\${item.sanPhamResponse.ten}</td>
                            </tr>`
                }


            })
            $('.tbody-product-select').html(html);
            var cardBtn = $('#cardBtn');
            cardBtn.empty();
            // if(data.trangThai == "DELETE"){
            //     var card1 = `
            //         <div class="col-lg-3 ml-right mb-3">
            //             <a class="btn btn-danger btn-undelete-khuyen-mai " data-ma="\${data.ma}">Tiếp tục khuyến mại</a>
            //         </div>
            //     `;
            // }else if(data.trangThai != "EXPIRED"){
            //     var card1 = `
            //         <div class="col-lg-3 ml-right mb-3">
            //             <a class="btn btn-danger btn-delete-khuyen-mai " data-ma="\${data.ma}">Dừng khuyến mại</a>
            //
            //         </div>
            //     `;
            //     cardBtn.append(card1);
            // }
                var card2 = `
                    <div class="col-lg-3 ml-right">
                        <a class="btn btn-info" href="/admin/khuyen-mai/edit/\${data.ma}" >Cập nhật</a>
                    </div>
                `;
            cardBtn.append(card2);
            var trangThaiStr = "";
            var badgeColor = "";
            if(data.trangThai == "EXPIRED"){
                trangThaiStr = "Đã kết thúc";
                badgeColor = "badge-success";
            }else if(data.trangThai == "UPCOMING"){
                trangThaiStr = "Sắp diễn ra";
                badgeColor ="badge-warning";
            }else if(data.trangThai == "DELETE"){
                trangThaiStr = "Đã dừng";
                badgeColor ="badge-danger";
            }else{
                trangThaiStr = "Đang diễn ra";
                badgeColor="badge-primary";
            }
            var cardTrangThai = $('#cardTrangThai');
            cardTrangThai.empty();
            var trangThai = `
                <span class="badge \${badgeColor} d-sm-inline-block d-none">\${trangThaiStr}</span>
                `
            cardTrangThai.append(trangThai);

            $('.checked-update-status').on('change', function () {
                const id = $(this).closest("tr").find('.product-discount-id').val();
                if ($(this).is(":checked")) {
                    updateTrangThai(id, "ACTIVE");
                } else {
                    updateTrangThai(id, "INACTIVE");
                }
            })

        },
        error: function(xhr, status, error) {
            alert('Có lỗi xảy ra: ' + error);
        }
    });

    function formatMicrosoftJSONDate(jsonDate) {
        // Create a Date object from the timestamp
        var date = new Date(jsonDate);
        var day = date.getDate().toString().padStart(2, '0');
        var month = (date.getMonth() + 1).toString().padStart(2, '0');
        var year = date.getFullYear();
        var hours = date.getHours().toString().padStart(2, '0');
        var minutes = date.getMinutes().toString().padStart(2, '0');
        // Format the date into "HH:MM dd-MM-yyyy" format
        var formattedDate = hours + ':' + minutes + ' ' + day + '/' + month + '/' + year;
        return formattedDate;
    }
    $('#cardBtn').on('click', (e) => {
        if ($(e.target).hasClass('btn-delete-khuyen-mai')) {
            let ma = $(e.target).data('ma');
            showConfirm("Bạn có muốn dừng khuyến mại?", ma)
                .then((confirmed) => {
                    if (confirmed) {
                        $.ajax({
                            url: '/api/khuyen-mai/delete/' + ma,
                            method: 'DELETE',
                            success: function (req) {
                                console.log(req);
                                loadKhuyenMai();
                                showSuccess("Dừng khuyến mại thành công!");
                            },
                            error: function (xhr, status, error) {
                                showError("Cập nhật không thành công");
                            }
                        });
                    }
                })
        }
    });
    $('#cardBtn').on('click', (e) => {
        if ($(e.target).hasClass('btn-delete-khuyen-mai')) {
            let ma = $(e.target).data('ma');
            showConfirm("Bạn có muốn tiếp tục khuyến mại?", ma)
                .then((confirmed) => {
                    if (confirmed) {
                        $.ajax({
                            url: '/api/khuyen-mai/undelete/' + ma,
                            method: 'DELETE',
                            success: function (req) {
                                console.log(req);
                                loadKhuyenMai();
                                showSuccess("Cập nhật thành công!");
                            },
                            error: function (xhr, status, error) {
                                showError("Cập nhật không thành công");
                            }
                        });
                    }
                })
        }
    });
    function formatNumber(number) {
        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    }
    function updateTrangThai(id, trangThai) {
        console.log(id);
        console.log(trangThai);
        $.ajax({
            url: "/api/khuyen-mai/update-status/" + id,
            method: "POST",
            contentType: "application/json; charset=utf-8",
            data: trangThai,
            success: (response) => {
                showSuccess("Cập nhật sản phẩm khuyến mãi thành công!");
            },
            error: (error) => {
            }
        })
    }

</script>