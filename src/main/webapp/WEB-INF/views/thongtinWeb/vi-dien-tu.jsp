<%@ page import="com.laptrinhjavaweb.security.utils.SecurityUtils" %>
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 11/17/2023
  Time: 2:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Long idkh = SecurityUtils.getPrincipal().getId();
%>

<title>Ví Điện Tử</title>

<section>
    <div style="box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 1px 3px 1px; padding: 20px">
        <div class="card">
            <div class="p-2">
                <ul class="nav">
                    <li class="nav-item">
                        <a class="btn btn-default" href="/vi-dien-tu/nap-tien">
                            <i class="bi bi-cash-coin fs-2"></i>
                            <h5 class="text-primary">Nạp tiền</h5>
                        </a>
                    </li>
                    <li class="nav-item ms-5">
                        <a class="btn btn-default" href="/vi-dien-tu/doi-diem">
                            <i class="bi bi-arrow-left-right fs-2"></i>
                            <h5 class="text-primary">Đổi điểm</h5>
                        </a>
                    </li>
                    <li class="nav-item ms-5">
                        <button id="lichSuButton" class="btn btn-default">
                            <i class="bi bi-receipt fs-2"></i>
                            <h5 class="text-primary">Lịch sử</h5>
                        </button>
                    </li>
                    <li class="nav-item p-4 ms-auto">
                        <span class="fs-5 text-primary">Số dư ví : </span><span class="fs-2" id="soDuVi"></span>đ
                    </li>
                </ul>
            </div>
        </div>

        <div class="mt-4" id="lichSuContainer" style="display: none;">
            <div class="row">
                <span class="fs-4" style="border-bottom: 1px solid #dedede; padding: 20px">Giao dịch gần đây:</span>
            </div>
            <div id="cardLichSu">

            </div>
        </div>
    </div>

</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var lichSuButton = document.getElementById("lichSuButton");
        var lichSuContainer = document.getElementById("lichSuContainer");
        lichSuButton.addEventListener("click", function () {
            lichSu();
            var isHidden = lichSuContainer.style.display === "none";

            if (isHidden) {
                lichSuContainer.style.display = "block";
            } else {
                lichSuContainer.style.display = "none";
            }
        });
    });


    var idkh = '<%= idkh %>';
    var idVi = -1;
    console.log(idkh);
    $.ajax({
        url: '/api/vi-dien-tu/'+idkh,
        method: 'GET',
        success: function(data) {
            console.log(data);
            idVi = data.id;
            $("#soDuVi").text(formatNumber(data.soTien));
            // $("#lichSuButton").trigger("click")
        },
        error: function(xhr, status, error) {
            alert('Có lỗi xảy ra: ' + error);
        }
    });
    function lichSu() {
        $.ajax({
            url: '/api/chi-tieu/' + idVi,
            method: 'GET',
            success: function (data) {
                console.log(data);
                var lichSuCT = $('#cardLichSu');
                lichSuCT.empty();

                data.forEach(function (item) {
                    var soTienFMT = formatNumber(item.soTien);
                    var loaiChiTieuStr = "";
                    if (item.loaiChiTieu == 0) {
                        loaiChiTieuStr = "Thanh toán";
                    }else if (item.loaiChiTieu == 2) {
                        loaiChiTieuStr = "Hoàn tiền";
                    }else if (item.loaiChiTieu == 3) {
                        loaiChiTieuStr = "Đổi điểm";
                    } else{
                        loaiChiTieuStr = "Nạp tiền";
                    }
                    var ngayTaoFMT = formatTimestamp(item.ngayTao);
                    console.log(ngayTaoFMT);
                    var card = `
                        <div>
                            <div class="d-flex justify-content-between p-3" style="border-bottom: 1px solid #dedede;">
                                <div>
                                    <div class="row">
                                        <div class="col-3 mt-2">
                                            <i class="bi bi-wallet2 fs-4"></i>
                                        </div>
                                        <div class="col">
                                            <span class="fs-5">\${loaiChiTieuStr}</span>
                                            <p class="fs-6">\${ngayTaoFMT}</p>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <span class="fs-4">\${soTienFMT}₫</span>

                                </div>
                            </div>
                        </div>
        `;
                    lichSuCT.append(card);
                });
            },
            error: function (xhr, status, error) {
                console.log(error);
            }
        });
    }
    // cập nhật value
    function formatNumber(number) {
        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    }
    function formatTimestamp(timestamp) {
        // Create a Date object from the timestamp
        var date = new Date(timestamp);
        var day = date.getDate().toString().padStart(2, '0');
        var month = (date.getMonth() + 1).toString().padStart(2, '0');
        var year = date.getFullYear();
        var hours = date.getHours().toString().padStart(2, '0');
        var minutes = date.getMinutes().toString().padStart(2, '0');
        // Format the date into "HH:MM dd-MM-yyyy" format
        var formattedDate = hours + ':' + minutes + ' ' + day + '/' + month + '/' + year;
        return formattedDate;
    }


</script>