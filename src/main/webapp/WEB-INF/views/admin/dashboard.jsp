<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Trang chủ</title>
</head>
<body>
<div class="content-body">
    <div class="container-fluid">
        <div class="modal fade chitiethoadon" tabindex="-1" aria-labelledby="chitiethoadon" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-4" id="chitiethoadon">Chi tiết hóa đơn</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="card" style="box-shadow: rgba(0, 0, 0, 0.06) 0px 2px 4px 0px inset;padding: 20px; background-color: #fff">
                            <div class="">
                                <h5>Thông tin khách hàng</h5>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col">
                                    <strong>Mã Khách hàng đặt:</strong> <span id="makh">KH01</span>
                                </div>
                                <div class="col">
                                    <strong>Tên người nhận:</strong> <span id="tennguoinhan">Đinh Tuấn Anh</span>
                                </div>
                            </div>
                            <div class="row my-2">
                                <div class="col">
                                    <strong>Địa chỉ:</strong> <span id="diachi">Yên trị, Yên Thuỷ, Hoà bình</span>
                                </div>
                                <div class="col">
                                    <strong>Số điện thoại:</strong> <span id="sodienthoai">0325808823</span>
                                </div>
                            </div>
                            <div class="row my-2">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="luuy">Lưu ý cho shop</label>
                                        <textarea class="form-control" id="luuy" rows="3" disabled></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="" style="height: 300px; overflow-y: scroll;" id="cart">
                            <div class="card">
                                <div class="project-info">
                                    <div class="col-xl-1 my-2 col-lg-4 col-sm-6">
                                        <span>#</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">1</h5>
                                    </div>
                                    <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Mã biến thể</span>
                                                <h5 class="mb-0 pt-1 font-w500 text-black" >SP03</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 my-2 col-lg-6 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Tên sản phẩm</span>
                                                <h5 class="mb-0 pt-1 font-w500 text-black">Áo polo nam aelimited</h5>
                                                <div class="text-success" >Màu hồng, M</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Số lượng</span>
                                                <input type="text" class="form-control w-50" style="text-align: center; height: 30px" value="2">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Đơn giá</span>
                                                <h5 class="mb-0 pt-1 font-w500 text-black">150000</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Thành tiền</span>
                                                <h5 class="mb-0 pt-1 font-w500 text-black" >150000</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="project-info">
                                    <div class="col-xl-1 my-2 col-lg-4 col-sm-6">
                                        <span>#</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">1</h5>
                                    </div>
                                    <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Mã sản phẩm</span>
                                                <h5 class="mb-0 pt-1 font-w500 text-black">SP03</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 my-2 col-lg-6 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Tên sản phẩm</span>
                                                <h5 class="mb-0 pt-1 font-w500 text-black">Áo polo nam aelimited</h5>
                                                <div class="text-success">Màu hồng, M</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Số lượng</span>
                                                <input type="text" class="form-control w-50" style="text-align: center; height: 30px" value="2">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Đơn giá</span>
                                                <h5 class="mb-0 pt-1 font-w500 text-black">150000</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Thành tiền</span>
                                                <h5 class="mb-0 pt-1 font-w500 text-black">150000</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="project-info">
                                    <div class="col-xl-1 my-2 col-lg-4 col-sm-6">
                                        <span>#</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">1</h5>
                                    </div>
                                    <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Mã sản phẩm</span>
                                                <h5 class="mb-0 pt-1 font-w500 text-black">SP03</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 my-2 col-lg-6 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Tên sản phẩm</span>
                                                <h5 class="mb-0 pt-1 font-w500 text-black">Áo polo nam aelimited</h5>
                                                <div class="text-success">Màu hồng, M</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Số lượng</span>
                                                <input type="text" class="form-control w-50" style="text-align: center; height: 30px" value="2">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Đơn giá</span>
                                                <h5 class="mb-0 pt-1 font-w500 text-black">150000</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Thành tiền</span>
                                                <h5 class="mb-0 pt-1 font-w500 text-black">150000</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="project-info">
                                    <div class="col-xl-1 my-2 col-lg-4 col-sm-6">
                                        <span>#</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">1</h5>
                                    </div>
                                    <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Mã sản phẩm</span>
                                                <h5 class="mb-0 pt-1 font-w500 text-black">SP03</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 my-2 col-lg-6 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Tên sản phẩm</span>
                                                <h5 class="mb-0 pt-1 font-w500 text-black">Áo polo nam aelimited</h5>
                                                <div class="text-success">Màu hồng, M</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Số lượng</span>
                                                <input type="text" class="form-control w-50" style="text-align: center; height: 30px" value="2">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Đơn giá</span>
                                                <h5 class="mb-0 pt-1 font-w500 text-black">150000</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Thành tiền</span>
                                                <h5 class="mb-0 pt-1 font-w500 text-black">150000</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="project-info">
                                    <div class="col-xl-1 my-2 col-lg-4 col-sm-6">
                                        <span>#</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">1</h5>
                                    </div>
                                    <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Mã sản phẩm</span>
                                                <h5 class="mb-0 pt-1 font-w500 text-black">SP03</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 my-2 col-lg-6 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Tên sản phẩm</span>
                                                <h5 class="mb-0 pt-1 font-w500 text-black">Áo polo nam aelimited</h5>
                                                <div class="text-success">Màu hồng, M</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Số lượng</span>
                                                <input type="text" class="form-control w-50" style="text-align: center; height: 30px" value="2">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Đơn giá</span>
                                                <h5 class="mb-0 pt-1 font-w500 text-black">150000</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Thành tiền</span>
                                                <h5 class="mb-0 pt-1 font-w500 text-black">150000</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="project-info">
                                    <div class="col-xl-1 my-2 col-lg-4 col-sm-6">
                                        <span>#</span>
                                        <h5 class="mb-0 pt-1 font-w500 text-black">1</h5>
                                    </div>
                                    <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Mã sản phẩm</span>
                                                <h5 class="mb-0 pt-1 font-w500 text-black">SP03</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 my-2 col-lg-6 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Tên sản phẩm</span>
                                                <h5 class="mb-0 pt-1 font-w500 text-black">Áo polo nam aelimited</h5>
                                                <div class="text-success">Màu hồng, M</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Số lượng</span>
                                                <input type="text" class="form-control w-50" style="text-align: center; height: 30px" value="2">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Đơn giá</span>
                                                <h5 class="mb-0 pt-1 font-w500 text-black">150000</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                                        <div class="d-flex align-items-center">
                                            <div class="ml-2">
                                                <span>Thành tiền</span>
                                                <h5 class="mb-0 pt-1 font-w500 text-black">150000</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8"></div>
                            <div class="col-4">
                                <div class="d-flex justify-content-between">
                                    <h6>Tiền sản phẩm:</h6>
                                    <h6 id="tiensp">500.000 VND</h6>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <h6>Tiền ship:</h6>
                                    <h6 id="tienship">25.000 VND</h6>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <h6>Tổng tiền hàng:</h6>
                                    <h6 id="tienhang">525.000 VND</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer" id="trangthaibutton">
                        <button type="button" class="btn btn-outline-warning" data-bs-dismiss="modal">Đóng</button>
                    </div>
                </div>

            </div>
        </div>

        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane"
                        type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true"><h5>Thống kê doanh thu</h5>
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane"
                        type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false"><h5>Thống kê hoá đơn</h5>
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane"
                        type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false"><h5>Thống kê hoá đơn theo ngày</h5>
                </button>
            </li>

        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab"
                 tabindex="0">
                <div class="container-fluid">
                    <div class="form-head mb-sm-5 mb-3">
                        <div class="d-flex justify-content-end">
                            <h5 class="mt-1 mb-2 me-2">Thống kê theo: </h5>
                            <div>
                                <select id="cbbthongke" class="form-control">
                                    <option value="1">Ngày</option>
                                    <option value="2">Tuần</option>
                                    <option value="3">Tháng</option>
                                    <option value="4">Năm</option>
                                </select>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-xl-3 col-sm-6 m-t35">
                            <div class="card card-coin h-100">
                                <div class="card-body text-center h-50">
                                    <svg class="mb-3 currency-icon" width="80" height="80" viewbox="0 0 80 80"
                                         fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <circle cx="40" cy="40" r="40" fill="white"></circle>
                                        <path d="M40 0C17.9083 0 0 17.9083 0 40C0 62.0917 17.9083 80 40 80C62.0917 80 80 62.0917 80 40C80 17.9083 62.0917 0 40 0ZM40 72.5C22.0783 72.5 7.5 57.92 7.5 40C7.5 22.08 22.0783 7.5 40 7.5C57.9217 7.5 72.5 22.0783 72.5 40C72.5 57.9217 57.92 72.5 40 72.5Z"
                                              fill="#FFAB2D"></path>
                                        <path d="M42.065 41.2983H36.8133V49.1H42.065C43.125 49.1 44.1083 48.67 44.7983 47.9483C45.52 47.2566 45.95 46.275 45.95 45.1833C45.9517 43.0483 44.2 41.2983 42.065 41.2983Z"
                                              fill="#FFAB2D"></path>
                                        <path d="M40 10.8333C23.9167 10.8333 10.8333 23.9166 10.8333 40C10.8333 56.0833 23.9167 69.1666 40 69.1666C56.0833 69.1666 69.1667 56.0816 69.1667 40C69.1667 23.9183 56.0817 10.8333 40 10.8333ZM45.935 53.5066H42.495V58.9133H38.8867V53.5066H36.905V58.9133H33.28V53.5066H26.9067V50.1133H30.4233V29.7799H26.9067V26.3866H33.28V21.0883H36.905V26.3866H38.8867V21.0883H42.495V26.3866H45.6283C47.3783 26.3866 48.9917 27.1083 50.1433 28.26C51.295 29.4116 52.0167 31.025 52.0167 32.775C52.0167 36.2 49.3133 38.995 45.935 39.1483C49.8967 39.1483 53.0917 42.3733 53.0917 46.335C53.0917 50.2816 49.8983 53.5066 45.935 53.5066Z"
                                              fill="#FFAB2D"></path>
                                        <path d="M44.385 36.5066C45.015 35.8766 45.3983 35.0316 45.3983 34.08C45.3983 32.1916 43.8633 30.655 41.9733 30.655H36.8133V37.52H41.9733C42.91 37.52 43.77 37.12 44.385 36.5066Z"
                                              fill="#FFAB2D"></path>
                                    </svg>
                                    <h4 class="text-danger-emphasis"><i>Doanh thu bán hàng online <span
                                            class="thoiGian"></span></i></h4>

                                    <h2 class="text-black mb-2 font-w600" id="doanhthuonline">$168,331.09</h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6 m-t35">
                            <div class="card card-coin h-100">
                                <div class="card-body text-center">
                                    <svg class="mb-3 currency-icon" width="80" height="80" viewbox="0 0 80 80"
                                         fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <circle cx="40" cy="40" r="40" fill="white"></circle>
                                        <path d="M40 0C17.9083 0 0 17.9083 0 40C0 62.0917 17.9083 80 40 80C62.0917 80 80 62.0917 80 40C80 17.9083 62.0917 0 40 0ZM40 72.5C22.0783 72.5 7.5 57.92 7.5 40C7.5 22.08 22.0783 7.5 40 7.5C57.9217 7.5 72.5 22.0783 72.5 40C72.5 57.9217 57.92 72.5 40 72.5Z"
                                              fill="#FFAB2D"></path>
                                        <path d="M42.065 41.2983H36.8133V49.1H42.065C43.125 49.1 44.1083 48.67 44.7983 47.9483C45.52 47.2566 45.95 46.275 45.95 45.1833C45.9517 43.0483 44.2 41.2983 42.065 41.2983Z"
                                              fill="#FFAB2D"></path>
                                        <path d="M40 10.8333C23.9167 10.8333 10.8333 23.9166 10.8333 40C10.8333 56.0833 23.9167 69.1666 40 69.1666C56.0833 69.1666 69.1667 56.0816 69.1667 40C69.1667 23.9183 56.0817 10.8333 40 10.8333ZM45.935 53.5066H42.495V58.9133H38.8867V53.5066H36.905V58.9133H33.28V53.5066H26.9067V50.1133H30.4233V29.7799H26.9067V26.3866H33.28V21.0883H36.905V26.3866H38.8867V21.0883H42.495V26.3866H45.6283C47.3783 26.3866 48.9917 27.1083 50.1433 28.26C51.295 29.4116 52.0167 31.025 52.0167 32.775C52.0167 36.2 49.3133 38.995 45.935 39.1483C49.8967 39.1483 53.0917 42.3733 53.0917 46.335C53.0917 50.2816 49.8983 53.5066 45.935 53.5066Z"
                                              fill="#FFAB2D"></path>
                                        <path d="M44.385 36.5066C45.015 35.8766 45.3983 35.0316 45.3983 34.08C45.3983 32.1916 43.8633 30.655 41.9733 30.655H36.8133V37.52H41.9733C42.91 37.52 43.77 37.12 44.385 36.5066Z"
                                              fill="#FFAB2D"></path>
                                    </svg>
                                    <h4 class="text-danger-emphasis"><i>Doanh thu bán hàng offline <span
                                            class="thoiGian"></span></i></h4>

                                    <h2 class="text-black mb-2 font-w600" id="doanhthuoffline">$24,098</h2>

                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6 m-t35">
                            <div class="card card-coin h-100">
                                <div class="card-body text-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="mb-3 currency-icon" fill="none"
                                         width="80" height="80" viewBox="0 0 512 512">
                                        <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.-->
                                        <path d="M504 256c0 137-111 248-248 248S8 393 8 256 119 8 256 8s248 111 248 248zm-141.7-35.3c4.9-33-20.2-50.7-54.6-62.6l11.1-44.7-27.2-6.8-10.9 43.5c-7.2-1.8-14.5-3.5-21.8-5.1l10.9-43.8-27.2-6.8-11.2 44.7c-5.9-1.3-11.7-2.7-17.4-4.1l0-.1-37.5-9.4-7.2 29.1s20.2 4.6 19.8 4.9c11 2.8 13 10 12.7 15.8l-12.7 50.9c.8 .2 1.7 .5 2.8 .9-.9-.2-1.9-.5-2.9-.7l-17.8 71.3c-1.3 3.3-4.8 8.4-12.5 6.5 .3 .4-19.8-4.9-19.8-4.9l-13.5 31.1 35.4 8.8c6.6 1.7 13 3.4 19.4 5l-11.3 45.2 27.2 6.8 11.2-44.7a1038.2 1038.2 0 0 0 21.7 5.6l-11.1 44.5 27.2 6.8 11.3-45.1c46.4 8.8 81.3 5.2 96-36.7 11.8-33.8-.6-53.3-25-66 17.8-4.1 31.2-15.8 34.7-39.9zm-62.2 87.2c-8.4 33.8-65.3 15.5-83.8 10.9l14.9-59.9c18.4 4.6 77.6 13.7 68.8 49zm8.4-87.7c-7.7 30.7-55 15.1-70.4 11.3l13.5-54.3c15.4 3.8 64.8 11 56.8 43z"
                                              fill="#FFAB2D"/>
                                    </svg>
                                    <h4 class="text-danger-emphasis"><i>Tổng sản phẩm đã bán <span
                                            class="thoiGian"></span></i></h4>
                                    <h2 class="text-black mb-2 font-w600" id="tongsanphamdaban">370</h2>

                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6 m-t35">
                            <div class="card card-coin h-100">
                                <div class="card-body text-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="mb-3 currency-icon" fill="none"
                                         width="80" height="80" viewBox="0 0 512 512">
                                        <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.-->
                                        <path d="M504 256c0 137-111 248-248 248S8 393 8 256 119 8 256 8s248 111 248 248zm-141.7-35.3c4.9-33-20.2-50.7-54.6-62.6l11.1-44.7-27.2-6.8-10.9 43.5c-7.2-1.8-14.5-3.5-21.8-5.1l10.9-43.8-27.2-6.8-11.2 44.7c-5.9-1.3-11.7-2.7-17.4-4.1l0-.1-37.5-9.4-7.2 29.1s20.2 4.6 19.8 4.9c11 2.8 13 10 12.7 15.8l-12.7 50.9c.8 .2 1.7 .5 2.8 .9-.9-.2-1.9-.5-2.9-.7l-17.8 71.3c-1.3 3.3-4.8 8.4-12.5 6.5 .3 .4-19.8-4.9-19.8-4.9l-13.5 31.1 35.4 8.8c6.6 1.7 13 3.4 19.4 5l-11.3 45.2 27.2 6.8 11.2-44.7a1038.2 1038.2 0 0 0 21.7 5.6l-11.1 44.5 27.2 6.8 11.3-45.1c46.4 8.8 81.3 5.2 96-36.7 11.8-33.8-.6-53.3-25-66 17.8-4.1 31.2-15.8 34.7-39.9zm-62.2 87.2c-8.4 33.8-65.3 15.5-83.8 10.9l14.9-59.9c18.4 4.6 77.6 13.7 68.8 49zm8.4-87.7c-7.7 30.7-55 15.1-70.4 11.3l13.5-54.3c15.4 3.8 64.8 11 56.8 43z"
                                              fill="#FFAB2D"/>
                                    </svg>
                                    <h4 class="text-danger-emphasis"><i>Số lượng khuyến mãi đã bán <span
                                            class="thoiGian"></span></i></h4>

                                    <h2 class="text-black mb-2 font-w600" id="soluongkhuyenmai">555</h2>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-3">
                        <div class="col-xl-6 col-xxl-12">
                            <div class="row">
                                <div class="col-sm-6 ">
                                    <div class="card">
                                        <div class="card-header border-0 pb-0">
                                            <h4 class="mb-0 text-black fs-20">Danh sách sản phẩm bán được nhiều
                                                nhất</h4>
                                        </div>
                                        <div class="card-body p-3">
                                            <div class="table-responsive">
                                                <table class="table  bg-info-hover tr-rounded order-tbl"
                                                       id="tbldsbannhieunhat">
                                                    <thead>
                                                    <tr class="text-center">
                                                        <th>STT</th>
                                                        <th>Tên sản phẩm</th>
                                                        <th>Tổng sản phẩm</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6 m-t25">
                                    <div class="card">
                                        <div class="card-header border-0 pb-0">
                                            <h4 class="mb-0 text-black fs-20">Danh sách khách hàng mua nhiều nhất</h4>
                                        </div>
                                        <div class="card-body p-3">
                                            <div class="table-responsive">
                                                <table class="table text-center bg-info-hover tr-rounded order-tbl"
                                                       id="dskhachhang">
                                                    <thead>
                                                    <tr>
                                                        <th>STT</th>
                                                        <th>Mã khách hàng</th>
                                                        <th>Tên khách hàng</th>
                                                        <th>Số điện thoại</th>
                                                        <th>Số lượt mua</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">

                <form id="formsearchhd">
                    <div class="row" style="box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 1px 3px 1px; padding: 20px">
                        <div class="col-2">
                            <label for="pttt">Phương thức thanh toán:</label>
                            <select class="form-select" name="phuongThucThanhToan" aria-label="Default select example" id="pttt">
                                <option value="">Tất cả</option>
                                <option value="THANHTOANNHANHANG">Thanh toán khi nhận hàng</option>
                                <option value="VIDIENTU">Ví điện tử</option>
                                <option value="CHUYENKHOAN">Paypal</option>
                            </select>
                        </div>
                        <div class="col-2">
                            <label for="trangthaihd">Trạng thái:</label>
                            <select class="form-select" name="trangThai" aria-label="Default select example" id="trangthaihd">
                                <option value="">Tất cả</option>
                                <option value="CHONHANDON">Chờ nhận đơn</option>
                                <option value="DANHANDON">Đã nhận đơn</option>
                                <option value="DANGGIAOHANG">Đang giao hàng</option>
                                <option value="DANHANHANG">Đã nhận hàng</option>
                                <option value="HUYDON">Huỷ đơn</option>
                            </select>
                        </div>
                        <div class="col-2">
                            <label for="startDate">Bắt đầu:</label>
                            <input id="startDate" class="form-control" name="startDate" type="date" />
                            <span id="startDateSelected"></span>
                        </div>
                        <div class="col-2">
                            <label for="endDate">Kết thúc:</label>
                            <input id="endDate" name="endDate" class="form-control" type="date" />
                            <span id="endDateSelected"></span></div>
                        <div class="col-2 pt-4 mt-2">
                            <button type="submit" id="searchhd" class="btn btn-success">Search</button>
                        </div>
                    </div>
                </form>

                <div class="row mt-3" style="box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 1px 3px 1px; padding: 20px">
                    <div class="row mb-2">
                        <div class="col-6">
                            <h4>Danh sách hoá đơn</h4>
                        </div>
                        <hr>

                    </div>
                    <table class="table table table-striped" id="tblhoadon" >
                        <thead>
                        <tr class="text-center">
                            <th scope="col">#</th>
                            <th scope="col">Mã hoá đơn</th>
                            <th scope="col">Ngày đặt</th>
                            <th scope="col">Ngày thanh toán</th>
                            <th scope="col">Mã khách hàng</th>
                            <th scope="col">Tên người đặt</th>
                            <th scope="col">Tổng tiền hàng</th>
                            <th scope="col">Tiền khách trả</th>
                            <th scope="col">Phương thức thanh toán</th>
                            <th scope="col">Trạng thái</th>
                            <th scope="col">Chi tiết</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>


            </div>
            <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
                <div class="row mt-4">

                    <div class="card">
                        <h4 class="mt-3">Danh sách hoá đơn theo ngày</h4>
                        <hr>
                        <table class="table table-hover table-striped" id="tblThongKeHoaDon">
                            <thead>
                            <tr class="text-center">
                                <th scope="col">#</th>
                                <th scope="col">Ngày</th>
                                <th scope="col">Tổng hóa đơn</th>
                                <th scope="col">Tổng sản phẩm đã bán</th>
                                <th scope="col">Số lượng khuyến mãi đã bán</th>
                                <th scope="col">Tổng doanh thu</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>

                    </div>

                </div>
            </div>
        </div>
    </div>


</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<script>
    $('#cbbthongke').on('change', function () {
        loadThongKe($(this).val())
    });
    loadThongKe(1);

    function loadThongKe(val) {
        let thoiGian = $(".thoiGian");
        if (val == 1) {
            thoiGian.text("hôm nay")
        } else if (val == 2) {
            thoiGian.text("tuần này")

        } else if (val == 3) {
            thoiGian.text("tháng này")
        } else {
            thoiGian.text("năm nay")
        }
        $.ajax({
            url: '/api/hoadon/thongke?thoigian=' + val,
            method: 'GET',
            success: function (req) {
                console.log(req)
                setElementThongKe(req.doanhThuBanHang);
                setElementDanhSachSanPham(req.dsSanPhamBanChayNhat)
                setElementDanhSachKhachHang(req.dsKhachHangMuaNhieuNhat)
            },
            error: function (xhr, status, error) {
                console.log("Có lỗi xảy ra")
            }
        });
    }
    function setElementThongKe(item) {
        $("#doanhthuonline").text(convertVND(item.doanhThuOnline))
        $("#doanhthuoffline").text(convertVND(item.doanhThuOffline))
        $("#tongsanphamdaban").text(checknull(item.tongSoSanPhamDaBan))
        $("#soluongkhuyenmai").text(checknull(item.soLuongKhuyenMaiDaBan))
    }

    function setElementDanhSachSanPham(data) {
        let tbody = $("#tbldsbannhieunhat tbody");
        tbody.empty();
        data.forEach(function (item, index) {
            tbody.append(`
            <tr>
                <td class="text-center">\${index+1}</td>
                <td>\${item.ten}</td>
                <td class="text-center">\${item.tong}</td>
            </tr>
            `);
        })
    }

    function setElementDanhSachKhachHang(data) {
        let tbody = $("#dskhachhang tbody");
        tbody.empty();
        data.forEach(function (item, index) {
            tbody.append(`
            <tr>
                <td>\${index+1}</td>
                <td>\${item.ma}</td>
                <td>\${item.ten}</td>
                <td>\${item.thongTin}</td>
                <td>\${item.tong}</td>
            </tr>
            `);
        })
    }

    function checknull(val) {
        if (!val) {
            return 0;
        } else {
            return val;
        }
    }
    function chiTietHoaDon(idhd) {
        $.ajax({
            url: '/api/hdct/'+idhd,
            method: 'GET',
            success: function (req) {
                var data  = req.data[0];
                $("#makh").text(data.maKhachHang)
                $("#tennguoinhan").text(data.tenNguoiNhan)
                $("#sodienthoai").text(data.soDienThoai)
                $("#diachi").text(data.diaChiNguoiNhan)
                $("#tiensp").text(convertVND(data.tongTienSanPham))
                $("#tienship").text(convertVND(data.tienShip))
                $("#tienhang").text(convertVND(data.tongTien))
                var luuy = $("#luuy");
                luuy.val(data.moTa);
                let cart = $("#cart")
                cart.empty();
                let html = "";
                req.data.forEach(function (item,index) {
                    let htmlGia = htmlGiaTien(item.giaTien,item.giaTienKm);
                    html+=`
                     <div class="card">
                        <div class="project-info">
                        <div class="col-xl-1 my-2 col-lg-4 col-sm-6">
                        <span>#</span>
                    <h5 class="mb-0 pt-1 font-w500 text-black">\${index+1}</h5>
                </div>
                    <div class="col-xl-2 my-2 col-lg-4 col-sm-6">
                        <div class="d-flex align-items-center">
                            <div class="ml-2">
                               <span>Hình ảnh</span>
                                <a class="text-decoration-none" href="/san-pham/\${item.slugSP}">
                                    <img src='/repository/\${item.image}' style="width: 120px;">
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 my-2 col-lg-6 col-sm-6">
                        <div class="d-flex align-items-center">
                            <div class="ml-2">
                                <span>Tên sản phẩm</span>
                            <a style="text-decoration: none;color: black" href="/san-pham/\${item.slugSP}">
                                <h5 class="mb-0 pt-1 font-w500 text-black line-clamp-2">\${item.tenSanPham}</h5>
                                <div class="text-success mt-2" >\${item.tenBienThe}</div>
                            </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                        <div class="d-flex align-items-center">
                            <div class="ml-2">
                                <span>Đơn giá</span>
                                \${htmlGia}
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                        <div class="d-flex align-items-center">
                            <div class="ml-2">
                                <span>Số lượng</span>
                                <input type="text" class="form-control w-50" style="text-align: center; height: 30px" value="\${item.soLuong}" disabled >
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-2 my-2 col-lg-6 col-sm-6">
                        <div class="d-flex align-items-center">
                            <div class="ml-2">
                                <span>Thành tiền</span>
                                <h5 class="mb-0 pt-1 font-w500 text-black" >\${convertVND(item.tongTienHdct)}</h5>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                    `
                })
                cart.append(html);
                // setTrangThaiHoaDon(idhd,data.trangThaiHoaDon)
            },
            error: function(xhr, status, error) {
                console.log("Có lỗi xảy ra")
            }
        });
    }
    function htmlGiaTien(giaTien,giaTienKm) {
        let html = '';
        if(!giaTienKm){
            html+=
                `
            <h6 class="mb-0 pt-1 font-w500 text-black">\${convertVND(giaTien)}</h6>
                `
        }else{
            html+=`
            <h6 class="mb-0 pt-1 font-w500 text-black">\${convertVND(giaTienKm)}</h6>
            <h6 class="mb-0 pt-1 font-w500 text-black"><del>\${convertVND(giaTien)}</del></h6>
            `
        }
        return html;
    }

    $('#formsearchhd').submit(function(event) {
        event.preventDefault(); // Ngăn chặn việc submit form mặc định

        var formData = $('#formsearchhd').serializeArray(); // Lấy dữ liệu từ form

        var jsonObject = {};
        $.each(formData, function() {
            jsonObject[this.name] = this.value || '';
        });

        var startDate = moment(jsonObject.startDate);
        var endDate = moment(jsonObject.endDate);

        if (!startDate.isValid()) {
            startDate = moment('1990-01-01');
        }

        if (!endDate.isValid()) {
            endDate = moment().add(1, 'day');
        }

        jsonObject.startDate = startDate.format('YYYY-MM-DD');
        jsonObject.endDate = endDate.format('YYYY-MM-DD');


        var queryParams = $.param(jsonObject);
        var url = `/api/hoadon/dshoadonresponse?\${queryParams}`;
        $.ajax({
            url: url,
            method: 'GET',
            success: function(req) {
                console.log(req);
                let tbody = $("#tblhoadon tbody");
                tbody.empty();
                req.forEach(function (item,index){
                    tbody.append(`
                    <tr class="text-center">
                        <td>\${index+1}</td>
                        <td>\${item.ma}</td>
                        <td>\${formatDate(item.ngayDat)}</td>
                        <td>\${formatDate(item.ngayThanhToan)}</td>
                        <td>\${item.maKhachHang}</td>
                        <td>\${item.tenNguoiDat}</td>
                        <td>\${convertVND(item.tongTienHang)}</td>
                        <td>\${convertVND(item.tienKhachTra)}</td>
                        <td>\${item.phuongThucThanhToan}</td>
                        <td>\${item.trangThai}</td>
                        <td>
<button class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target=".chitiethoadon" onclick="chiTietHoaDon(\${item.id})">Chi tiết</button>
</td>
                    </tr>
                    `);
                })
            },
            error: function(xhr, status, error) {
                console.log("Có lỗi xảy ra")
            }
        });

    });

    $("#formsearchhd").submit();
    function formatDate(date) {
        if (!date){
            return "";
        }
        date = new Date(date)
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day = String(date.getDate()).padStart(2, '0');
        return `\${year}-\${month}-\${day}`;
    }

    function loadThongKeHoaDon() {
        $.ajax({
            url: "/api/hoadon/thongkehoadon",
            method: 'GET',
            success: function (response) {
                var tbody = $('#tblThongKeHoaDon tbody');
                tbody.empty();
                var index = 0;
                response.forEach(function (item) {
                    var row = `
                            <tr class="text-center">
                                <td>\${++index}</td>
                                <td>\${getFormattedDate(item.ngay)}</td>
                                <td>\${item.tongHoaDonBanDuoc}</td>
                                <td>\${item.soLuong}</td>
                                <td>\${item.soLuongKhuyenMai}</td>
                                <td>\${convertVND(item.tongTienHang)}</td>
                            </tr>
                        `;
                    tbody.append(row);
                });
            },
            error: function (xhr, status, error) {
                console.log('Có lỗi xảy ra: ' + error);
            }
        });
    }

    loadThongKeHoaDon();

</script>
</body>
</html>