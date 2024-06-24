<%-- 
    Document   : CreateNewPayment
    Created on : Jun 24, 2024, 3:19:24 PM
    Author     : Thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
   <body>
    <div class="container mt-5">
        
            <form action="PaymentController" id="frmCreateOrder" method="post">
                <legend>Tao moi don thanh toan</legend>
                <div class="col-md-4 col-lg-3">
                  <div class="mb-3">
                      <label for="disabledTextInput" class="form-label">Ma don hang</label>
                      <input type="text" id="disabledTextInput" class="form-control" disabled value="${requestScope.billId}" name="billId">
                    </div>
                </div>
                
                <div class="col-md-4 col-lg-3">
                    <div class="mb-3">
                        <label for="disabledTextInput" class="form-label">Gia tien</label>
                        <input type="text" id="disabledTextInput" class="form-control" value="${requestScope.total}" disabled name="amount">
                      </div>
                </div>
                
                <div class="col-md-4 col-lg-3">
                    <div class="mb-3">
                        <label  class="form-label">Chọn phương thức thanh toán</label>
                        <select name="bankCode"  class="form-select">
                          <option value="">Cổng thanh toán VNPAYQR </option>
                          <option value="VNPAYQR">Thanh toán bằng ứng dụng hỗ trợ VNPAYQR</option>
                          <option value="VNBANK">Thanh toán qua thẻ ATM/Tài khoản nội địa</option>
                          <option value="INTCARD">Thanh toán qua thẻ quốc tế</option>
                        </select>
                      </div>
                </div>
                <div class="col-md-4 col-lg-3">
                    <div class="mb-3">
                        <label  class="form-label">Chọn ngôn ngữ giao diện thanh toán</label>
                        <select name="language"  class="form-select">
                          <option value="vn">Tiếng việt</option>
                          <option value="en">Tiếng anh</option>
                        </select>
                      </div>
                </div>
                
                <div class="mb-3 form-check">
                  <input type="checkbox" class="form-check-input" id="exampleCheck1" required>
                  <label class="form-check-label" for="exampleCheck1">Xac nhan thong tin</label>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
    

      
    </div>
    <script type="text/javascript">
        $("#frmCreateOrder").submit(function () {
            var postData = $("#frmCreateOrder").serialize();
            var submitUrl = $("#frmCreateOrder").attr("action");
            $.ajax({
                type: "POST",
                url: submitUrl,
                data: postData,
                dataType: 'JSON',
                success: function (x) {
                    if (x.code === '00') {
                        if (window.vnpay) {
                            vnpay.open({width: 768, height: 600, url: x.data});
                        } else {
                            location.href = x.data;
                        }
                        return false;
                    } else {
                        alert(x.Message);
                    }
                }
            });
            return false;
        });
    </script>       
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
