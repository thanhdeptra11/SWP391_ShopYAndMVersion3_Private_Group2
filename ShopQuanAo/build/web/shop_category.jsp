<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Danh Mục Cửa Hàng</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <!-- Plugins CSS -->
        <link rel="stylesheet" href="assets/css/plugins.css">

        <!-- Main Style CSS -->
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    </head>

    <body>
        <!-- Main Wrapper Start -->
        <div class="off_canvars_overlay"></div>
        <jsp:include page="layout/menu.jsp"/>

        <!-- Breadcrumbs area start -->
        <div class="breadcrumbs_area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="home">Trang chủ</a></li>
                                <li>/</li>
                                <li>Cửa hàng</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumbs area end -->

        <!-- Shop area start -->
        <div class="shop_area shop_reverse">
            <div class="container">
                <div class="shop_inner_area">
                    <div class="row">
                        <div class="col-lg-3 col-md-12">
                            <!-- Sidebar widget start -->
                            <div class="sidebar_widget">
                                <div class="widget_list widget_categories">
                                    <h2><i class="fas fa-th-list"></i> Danh mục</h2>
                                    <ul>
                                        <li><a href="product">TẤT CẢ</a></li>
                                            <c:forEach items="${CategoryData}" var="c">
                                            <li><a href="product?action=listByCategory&category_id=${c.category_id}">${c.category_name}</a></li>
                                            </c:forEach>
                                    </ul>
                                    <h2><i class="fas fa-money-bill"></i> Giá</h2>
                                    <form action="product?action=searchByPrice" method="POST">
                                        <input type="checkbox" name="price" value="0"> <b>Duới 50.000Vnđ</b><br>
                                        <input type="checkbox" name="price" value="1"> <b>Từ 50.000Vnđ - 200.000Vnđ</b><br>
                                        <input type="checkbox" name="price" value="2"> <b>Từ 200.000Vnđ - 500.000Vnđ</b><br>
                                        <input type="checkbox" name="price" value="3"> <b>Từ 500.000 Vnđ - 1.000.000 Vnđ</b><br>
                                        <input type="checkbox" name="price" value="4"> <b>1 triệu Vnđ trở lên</b><br>
                                        <input type="submit" value="Tìm kiếm">
                                    </form>
                                    <br>
                                    <h2>Màu Sắc</h2>
                                    <form action="product?action=SearchByColor" method="POST">
                                        <input type="checkbox" name="colors" value="0"><b> Đỏ </b><br>
                                        <input type="checkbox" name="colors" value="1"> <b>Xanh</b><br>
                                        <input type="checkbox" name="colors" value="2"> <b>Trắng</b><br>
                                        <input type="checkbox" name="colors" value="3"> <b>Đen </b><br>
                                        <input type="submit" value="Filter">
                                    </form>
                                </div>
                            </div>
                            <!-- Sidebar widget end -->
                        </div>
                        <div class="col-lg-9 col-md-12">
                            <!-- Shop wrapper start -->
                            <div class="shop_title">
                                <h2>Sản phẩm</h2>
                            </div>
                            <div class="shop_toolbar_wrapper">
                                <div class="dropdown">
                                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Bộ lọc
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="product?action=sort&type=low">Giá từ thấp đến cao</a>
                                        <a class="dropdown-item" href="product?action=sort&type=high">Giá từ cao xuống thấp</a>
                                        <a class="dropdown-item" href="product?action=sort&type=a-z">A-Z</a>
                                    </div>
                                </div>
                            </div>
                            <div class="row shop_wrapper">
                                <c:forEach items="${ProductData}" var="p">
                                    <div class="col-lg-4 col-md-4 col-12">
                                        <div class="single_product">
                                            <div class="product_thumb">
                                                <a class="primary_img" href="product?action=productdetail&product_id=${p.product_id}"><img src="${p.img}" alt=""></a>
                                                <div class="quick_button">
                                                    <a href="product?action=productdetail&product_id=${p.product_id}" title="quick_view">Xem sản phẩm</a>
                                                </div>
                                            </div>
                                            <div class="product_content grid_content">
                                                <h3><a href="product?action=productdetail&product_id=${p.product_id}">${p.product_name}</a></h3>
                                                <span class="current_price">${p.product_price}</span>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="shop_toolbar t_bottom">
                                <div class="pagination">
                                    <ul>
                                        <c:forEach begin="${1}" end="${num}" var="i">
                                            <li class="${i==page?"current":""}"><a href="product?page=${i}">${i}</a></li>
                                            </c:forEach>
                                    </ul>
                                </div>
                            </div>
                            <!-- Shop wrapper end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="layout/footer.jsp"/>

    </body>

</html>
