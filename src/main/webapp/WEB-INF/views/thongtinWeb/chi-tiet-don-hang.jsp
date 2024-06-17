<%@ page import="com.laptrinhjavaweb.security.utils.SecurityUtils" %><%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 12/4/2023
  Time: 8:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thông tin đơn hàng</title>
</head>
<body>
<div class="khung">
    <div class="row">
        <div class="col-4">
            <span class="fs-4">Thông tin nhận hàng</span>
            <p class="fs-5 mt-4">Người nhận:
                <strong id="tennguoinhan"></strong>
            </p>
            <p class="">Số điện thoại:
                <span id="sodienthoai"></span>
            </p>
            <p class="" >
                <span>Địa chỉ: </span>
                <span id="diachi"></span>
            </p>
        </div>
        <div class="col-8" style="border-left: 1px solid #dedede">
            <span class="fs-4">Trạng thái đơn hàng</span>
            <div  id="dstrangthai"></div>
            <%--                <div class="row mt-3">--%>
            <%--                    <div class="col-3">--%>
            <%--                        <span>09:25 07-08-2023</span>--%>
            <%--                    </div>--%>
            <%--                    <div class="col-9">--%>
            <%--                        <strong>Đã giao</strong><br>--%>
            <%--                        <span>Đơn hàng đã được giao thành công</span><br>--%>
            <%--                        <span>Người nhận hàng: Anh Tuấn</span>--%>
            <%--                    </div>--%>
            <%--                </div>--%>

        </div>
    </div>
    <div class="row">

    </div>
</div>
<div class="khung mt-3">
    <div class="row mt-3" id="dshdct">
        <%--            <div class="col-2">--%>
        <%--                <img src="/repository/0PQldf.jpg" width="90%" alt="">--%>
        <%--            </div>--%>
        <%--            <div class="col-10">--%>
        <%--                <h4>Áo</h4>--%>
        <%--                <div class="d-flex justify-content-between">--%>
        <%--                    <span>Phân loại: Đen|L </span>--%>
        <%--                    <span class="text-danger">300000₫</span></span>--%>
        <%--                </div>--%>
        <%--                <div class="d-flex justify-content-between">--%>
        <%--                    <span>x1 </span>--%>
        <%--                </div>--%>
        <%--            </div>--%>
    </div>
    <div class="row mt-5">
        <div class="col-7"></div>
        <div class="col-5">
            <div class="row d-flex justify-content-between">
                <div class="col">
                    Tổng tiền hàng:
                </div>
                <div class="col text-right">
                    <span class="text-danger" id="giaGoc"></span><span class="text-danger">đ</span>
                </div>
            </div>
            <div class="row d-flex justify-content-between ">
                <div class="col">
                    Tổng tiền giảm giá:
                </div>
                <div class="col text-right">
                    <span class="text-danger">-</span>
                    <span class="text-danger" id="giaGiam"></span><span class="text-danger">đ</span>
                </div>
            </div>
            <div class="row d-flex justify-content-between">
                <div class="col">
                    Phí vận chuyển:
                </div>
                <div class="col text-right">
                    <span class="text-danger" id="tienShip"></span><span class="text-danger">đ</span>
                </div>
            </div>
            <div class="row d-flex justify-content-between mb-5">
                <div class="col">
                    Thành tiền:
                </div>
                <div class="col text-right">
                    <span class="text-danger" style="font-size: 25px" id="tienKhachTra"></span><span class="text-danger">đ</span>
                </div>
            </div>
        <div id="tthd" style="text-align: right;">

        </div>
        </div>
    </div>
</div>
<script>
    var idkh = <%=SecurityUtils.getPrincipal().getId()%>;

    // // Lấy đối tượng URLSearchParams từ URL hiện tại
    const urlParams = new URLSearchParams(window.location.search);

    // Lấy giá trị của tham số "paramName" từ URL
    const paramValue = urlParams.get('mahd');
    function getMaHoaDon() {
        return paramValue;
    }

    function genderHuyDon(idhd) {
        $("#tthd").append(`<button class="btn btn-danger me-2 huydonttweb"  onclick="thayDoiTrangThaiHoaDon(\${idhd},'HUYDON')">Hủy đơn</button>`);
    }
    function loadChiTietHoaDon(){
        $.ajax({
            url: '/api/hoadon/alltt?mahoadon='+getMaHoaDon(),
            method: 'GET',
            success: function(data) {
                console.log(data)
                getHoaDon(data.hoaDon);
                getTrangThaiGiaoHang(data.trangThaiGiaoHang);
                getTongTien(data.tongTien);
                getHDCT(data.dsHoaDonChiTiet);
                if (data.hoaDon.trangThaiHoaDon=="Chờ nhận đơn"){
                    genderHuyDon(data.hoaDon.id)
                }
            },
            error: function(xhr, status, error) {
                alert('Có lỗi xảy ra: ' + error);
            }
        });
    }
    loadChiTietHoaDon();

    function getHoaDon(hoaDon) {
        $("#tennguoinhan").text(hoaDon.nguoiNhan)
        $("#sodienthoai").text(hoaDon.soDienThoai)
        $("#diachi").text(hoaDon.diaChi)
    }
    function getTrangThaiGiaoHang(listTrangThai) {

        let dsTrangThai = $("#dstrangthai");
        dsTrangThai.empty();
        if (listTrangThai.length == 0){
            dsTrangThai.append(
                `
                    <div class="row mt-3">
                    <div class="col-3">
                    </div>
                    <div class="col-9">
                        <span>Shop đang chuẩn bị hàng</span><br>
                    </div>
                </div>
                    `);
        }else{
            listTrangThai.forEach(function (item) {
                let ngayTaoFMT = formatTimestamp(item.ngayTao)
                dsTrangThai.append(
                    `
                    <div class="row mt-3">
                    <div class="col-3">
                        <span>\${ngayTaoFMT}</span>
                    </div>
                    <div class="col-9">
                        <b>\${item.maVanHang}</b> <br>
                        <span>\${item.tenTrangThai}</span><br>
                    </div>
                </div>
                    `
                );
            })
        }

    }
    function getHDCT(listHdct) {
        let dsHoaDonChiTiet = $("#dshdct");
        listHdct.forEach(function (item) {
            let tenFMT = formatNumber(item.tongTienHdct);
            dsHoaDonChiTiet.append(
                `<div class="row mt-3">
                                <div class="col-2">
                                    <img src="/repository/\${item.image}" width="90%" alt="">
                                </div>
                                <div class="col-10">
                                    <a style="color: black; text-decoration: none;" href="/san-pham/\${item.slugSP}"><h5 class="card-title line-clamp-2">\${item.tenSanPham}</h5></a>
                                    <div class="d-flex justify-content-between">
                                        <span>Phân loại: \${item.tenBienThe} </span>
                                        <span class="text-danger">\${tenFMT}₫</span></span>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <span>x\${item.soLuong} </span>
                                    </div>
                                </div>
                            </div>
                            <hr>`
            );
        })
    };
    function getTongTien(tongTien){
        $("#giaGoc").text(formatNumber(tongTien.giaGoc));
        $("#giaGiam").text(formatNumber(tongTien.giaGiam));
        $("#tienShip").text(formatNumber(tongTien.tienShip));
        $("#tienKhachTra").text(formatNumber(tongTien.tienKhachTra));
    };
    function formatTimestamp(timestamp) {
        // Create a Date object from the timestamp
        var date = new Date(timestamp);
        var day = date.getDate().toString().padStart(2, '0');
        var month = (date.getMonth() + 1).toString().padStart(2, '0');
        var year = date.getFullYear();
        var hours = date.getHours().toString().padStart(2, '0');
        var minutes = date.getMinutes().toString().padStart(2, '0');
        // Format the date into "HH:MM dd-MM-yyyy" format
        var formattedDate = hours + ':' + minutes + ' ' + day + '-' + month + '-' + year;
        return formattedDate;
    }
    function formatNumber(number) {
        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    }
    async function thayDoiTrangThaiHoaDon(idhd, trangThai) {
        if (!(await checkSoLanHuyTrongNgay())){
            return;
        }
        if (await showConfirm("Bạn có muốn huỷ đơn không ?")) {
            let parameter = `?idhd=\${idhd}&trangthai=\${trangThai}`;
            $.ajax({
                url: `/api/hoadon/thaydoitrangthai` + parameter,
                method: 'GET',
                success: function (req) {
                    showSuccess("Huỷ đơn thành công");
                    loadTable();
                },
                error: function (xhr, status, error) {
                    console.log("Có lỗi xảy ra")
                }
            });
        }
    }
    async function checkSoLanHuyTrongNgay() {
        let flag ;
        await $.ajax({
            url: '/api/thu3/checkhuydon/'+idkh,
            method: 'GET',
            success: function (req) {
                if (req){
                    showError("Mỗi ngày bạn chỉ có thể hủy tối đa 3 đơn");
                    flag= false;
                }else{
                    flag= true;
                }
            },
            error: function (xhr, status, error) {
                console.log("Có lỗi xảy ra")
                flag = true;
            }
        });
        return flag;
    }
</script>

</body>
</html>
