<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Liên hệ</title>
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

    <body>

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
                                <li>Liên hệ</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>         
        </div>
        <!--breadcrumbs area end-->


        <!--contact area start-->
        <div class="contact_area">
            <div class="container">   
                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <div class="contact_message content">
                            <h3>Liên hệ</h3>
                            <ul>
                                <li><i class="fa fa-fax"></i>  Huyện Tiền Hải - Tỉnh Thái Bình</li>
                                <li><i class="fa fa-envelope-o"> </i> <a href="mailto:doanhtnhe172637@fpt.edu.vn">doanhtnhe172637@fpt.edu.vn</a></li>
                                <li><i class="fa fa-phone"></i> 0348956373</li>                        
                            </ul>             
                        </div> 
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <div class="contact_message form">
                            <h3>Gửi thông tin phản hồi</h3>   
                            <form id="contact-form" method="GET" action="https://script.google.com/macros/s/AKfycby2HoMCJyTeclcs-4VlInS-NG_hs161qiMTiuzUOpNZp_YRsmk/exec">
                                <p>       
                                    <label>  Địa chỉ email</label>
                                    <input name="Email" pattern="[^ @]*@[^ @]*" placeholder="Nhập email của bạn ..." required="" value="" type="email">
                                </p>
                                <p>          
                                    <label>  Tiêu đề</label>
                                    <input name="Subject" placeholder="Nhập tiêu đề ..." required="" value="" type="text">
                                </p>    
                                <div class="contact_textarea">
                                    <label>  Thông tin</label>
                                    <input placeholder="Nhập thông tin ..." name="Message" required="" value="" class="form-control2" >    
                                </div>
                                <br>
                                <button type="submit"> Gửi</button>
                            </form> 
                        </div> 
                    </div>
                </div>
            </div>    
        </div>
        <!--contact area end-->

        <!--contact map start-->
        <!--contact map end-->

        <jsp:include page="layout/footer.jsp"/>

        <!-- JS
        ============================================ -->

        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>
        <script>
            function doGet(e) {
                var email = e.parameter.Email;
                var subject = e.parameter.Subject;
                var message = e.parameter.Message;

                // Tạo nội dung email
                var emailContent = 'Email: ' + email + '\n\n' + 'Subject: ' + subject + '\n\n' + 'Message: ' + message;

                // Gửi email
                MailApp.sendEmail({
                    to: 'dtran4673@gmail.com', // Thay bằng địa chỉ email của bạn
                    subject: subject,
                    body: emailContent
                });

                // Trả về phản hồi
                return ContentService.createTextOutput('Success');
            }

        </script>
    </body>

</html>