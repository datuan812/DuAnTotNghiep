<%--
  Created by IntelliJ IDEA.
  User: MMC
  Date: 10/25/2023
  Time: 11:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.laptrinhjavaweb.security.utils.SecurityUtils" %>
<html>
<head>
    <title>Tất cả</title>
</head>

<body>
<div class="menu">
    <ul class="nav justify-content-center">
        <li class="nav-item">
            <a class="nav-link active" href="/web/all">Tất cả</a>
        </li>
        <li class="nav-item ms-5">
            <a class="nav-link" href="/web/cho-xac-nhan">Chờ xác nhận</a>
        </li>
        <li class="nav-item ms-5">
            <a class="nav-link" href="/web/cho-giao-hang">Chờ giao hàng</a>
        </li>
        <li class="nav-item ms-5">
            <a class="nav-link" href="/web/dang-giao">Đang giao</a>
        </li>
        <li class="nav-item ms-5">
            <a class="nav-link" href="/web/hoan-thanh">Hoàn thành</a>
        </li>
        <li class="nav-item ms-5">
            <a class="nav-link" href="/web/da-huy">Đã hủy</a>
        </li>
    </ul>
</div>

<div class="mt-3 ">
    <input class="inputTT w-100"  name="text" placeholder="Search..." type="search">
</div>

<div class="row mt-1" id="dshd">

</div>

<script>
    var idkh = <%=SecurityUtils.getPrincipal().getId()%>;

    function loadTable() {
        $.ajax({
            url: '/api/hoadon/dshoadondamua/' + idkh,
            method: "GET",
            dataType: "json",
            success: async (response) => {
                console.log(response)
                let dshd = $('#dshd');
                dshd.empty();
                for (const item of response.data) {
                    let idhd = item.id;
                    try {
                        const res = await $.ajax({
                            url: '/api/hdct/' + idhd,
                            method: "GET",
                            dataType: "json",
                        });

                        let html = `<div class="col-12 mt-3">
                                <div class="khung">
                                    <div class="d-flex justify-content-between" style="border-bottom: 1px solid #D19C97; padding-bottom: 10px">
                                        <span><i class="bi bi-truck"></i> Đơn hàng đang được xác nhận</span>
                                        <span class="text-danger text-uppercase">\${item.trangThai}</span>
                                    </div>`;
                        $.each(res.data, (index, item) => {
                            html += `<div class="row mt-3">
                                <div class="col-2">
                                    <img src="/repository/\${item.image}" width="90%" alt="">
                                </div>
                                <div class="col-10">
                                    <a style="color: black; text-decoration: none;" href="/san-pham/\${item.slugSP}"><h5 class="card-title line-clamp-2">\${item.tenSanPham}</h5></a>
                                    <div class="d-flex justify-content-between">
                                        <span>Phân loại: \${item.tenBienThe} </span>
                                        <span class="text-danger">\${formatNumber(item.tongTienHdct)}₫</span></span>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <span>x\${item.soLuong} </span>
                                    </div>
                                </div>
                            </div>
                            <hr>`;
                        });
                        let genderHtml = genderTrangThaiHd(item.id,item.ma,item.trangThai);
                        html += `<div class="row">
                            <div class="col-9"></div>
                            <div class="col-3">
                                <div class="row d-flex justify-content-between">
                                    <div class="col">
                                        Phí ship:
                                    </div>
                                    <div class="col text-right">
                                        <span class="text-danger">\${formatNumber(item.tienShip)}₫</span>
                                    </div>
                                </div>
                                <div class="row d-flex justify-content-between">
                                    <div class="col">
                                        Thành tiền:
                                    </div>
                                    <div class="col text-right">
                                        <span class="text-danger" style="font-size: 25px">\${formatNumber(item.tongTien)}₫</span>
                                    </div>
                                </div>
                                \${genderHtml}
                            </div>
                        </div>
                    </div>
                </div>`;
                        dshd.append(html);
                    } catch (error) {
                        console.error(error);
                    }
                }
            },
            error: (error) => {
                console.log(error);
            }
        });
    }
    loadTable()
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