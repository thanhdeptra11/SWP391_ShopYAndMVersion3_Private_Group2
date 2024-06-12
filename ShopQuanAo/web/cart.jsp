<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Giỏ hàng</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <!-- CSS 
        ========================= -->
        <!-- Plugins CSS -->
        <link rel="stylesheet" href="assets/css/plugins.css">
        <!-- Main Style CSS -->
        <link rel="stylesheet" href="assets/css/style.css">
    </head>
 <style>
        .empty-cart {
            text-align: center;
            padding: 50px 0;
        }

        .empty-cart img {
            width: 150px;
            margin-bottom: 20px;
        }

        .empty-cart p {
            font-size: 20px;
            color: #333;
        }
    </style>
    <body>

        <!-- Main Wrapper Start -->
        <!--Offcanvas menu area start-->
        <div class="off_canvars_overlay"></div>
        <jsp:include page="layout/menu.jsp"/>
        <!--breadcrumbs area start-->
        <div class="breadcrumbs_area other_bread">
            <div class="container">   
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="home">Trang chủ</a></li>
                                <li>/</li>
                                <li>Giỏ hàng</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>         
        </div>
        <!--breadcrumbs area end-->
        <!-- shopping cart area start -->
        <div class="shopping_cart_area">
            <div class="container">  
                <c:choose>
                    <c:when test="${empty sessionScope.cart.items}">
                        <div class="empty-cart">
                            <img src="assets/img/logo/no-products-found.jpg" alt="Không có sản phẩm trong giỏ hàng">
                            <p>Không có sản phẩm nào trong giỏ hàng</p>
                            <a href="index.jsp" class="button">MUA NGAY</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="row">
                            <div class="col-12">
                                <div class="table_desc">
                                    <div class="cart_page table-responsive">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th class="product_remove">Xóa</th>
                                                    <th class="product_thumb">Ảnh</th>
                                                    <th class="product_name">Sản phẩm</th>
                                                    <th class="product-price">Giá</th>
                                                    <th class="product_quantity">Kích thước</th>
                                                    <th class="product-price">Màu</th>
                                                    <th class="product_quantity">Số lượng</th>
                                                    <th class="product_total">Tổng tiền</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="o" value="${sessionScope.cart}" />
                                                <c:forEach items="${o.items}" var="i">
                                                    <tr>
                                                        <td class="product_remove"><a href="cart?action=deletecart&product_id=${i.product.product_id}"><i class="fa fa-trash-o"></i></a></td>
                                                        <td class="product_thumb"><a href="product?action=productdetail&product_id=${i.product.product_id}"><img src="${i.product.img}" alt=""></a></td>
                                                        <td class="product_name"><a href="product?action=productdetail&product_id=${i.product.product_id}">${i.product.product_name}</a></td>
                                                        <td class="product-price"><fmt:formatNumber pattern="##########" value="${i.product.product_price}" /></td>
                                                        <td class="product-price">${i.size}</td>
                                                        <td class="product-price">${i.color}</td>
                                                        <td class="product_quantity"><input name="quantity" min="1" max="100" value="${i.quantity}" type="number"></td>
                                                        <td class="product_total"><fmt:formatNumber pattern="##########" value="${i.product.product_price * i.quantity}" /> VNĐ</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- <div class="cart_submit">
                                        <button type="submit">update cart</button>
                                    </div> -->
                                </div>
                            </div>
                        </div>
                        <!-- Coupon code area start -->
                        <c:if test="${sessionScope.cart != null}">
                            <div class="coupon_area">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                        <div class="coupon_code right">
                                            <h3>Hóa đơn</h3>
                                            <div class="coupon_inner">
                                                <div class="cart_subtotal">
                                                    <p>Tổng đơn hàng</p>
                                                    <p class="cart_amount"><fmt:formatNumber pattern="##########" value="${sessionScope.total}" />Vnđ</p>
                                                </div>
                                                <div class="cart_subtotal ">
                                                    <p>Phí vận chuyển </p>
                                                    <p class="cart_amount">30000Vnđ</p>
                                                </div>

                                                <div class="cart_subtotal">
                                                    <p>Tổng tiền</p>
                                                    <p class="cart_amount"><fmt:formatNumber pattern="##########" value="${sessionScope.total + 30000}" />Vnđ</p>
                                                </div>
                                                <div class="checkout_btn">
                                                    <a href="checkout">Thanh toán</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <!-- Coupon code area end -->
                    </c:otherwise>
                </c:choose>
                <!--coupon code area end-->
                </form> 
            </div>     
        </div>
        <!-- shopping cart area end -->

        <!--footer area start-->
        <jsp:include page="layout/footer.jsp"/>
        <!--footer area end-->
        <!-- JS
        ============================================ -->
        <!--map js code here-->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAdWLY_Y6FL7QGW5vcO3zajUEsrKfQPNzI"></script>
        <script  src="https://www.google.com/jsapi"></script>
        <script src="assets/js/map.js"></script>
        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>
        <!-- Main JS -->
        <script src="assets/js/main.js"></script>
    </body>
</html>