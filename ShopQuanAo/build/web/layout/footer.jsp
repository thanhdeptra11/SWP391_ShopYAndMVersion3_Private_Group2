<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>/* General Styles */
    .widgets_container {
        background-color: #f9f9f9;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        text-align: center;
    }

    .widgets_container h3 {
        color: #333;
        margin-bottom: 20px;
    }

    /* Contact Us Section */
    .contact_us p {
        margin-bottom: 10px;
    }

    .contact_us a {
        color: #007bff;
        text-decoration: none;
    }

    .contact_us a:hover {
        text-decoration: underline;
    }

    .contact_us ul {
        list-style-type: none;
        padding: 0;
        margin-top: 20px;
    }

    .contact_us ul li {
        display: inline-block;
        margin-right: 10px;
    }

    .contact_us ul li a {
        color: #333;
        font-size: 20px;
        transition: color 0.3s ease;
    }

    .contact_us ul li a:hover {
        color: #007bff;
    }

    /* Bank Cards Section */
    .bank_cards_content {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-wrap: wrap;
    }

    .bank_card_images {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-wrap: wrap;
    }

    .bank-card {
        max-width: 80px;
        max-height: 50px;
        margin: 10px;
        transition: transform 0.3s ease;
    }

    .bank-card:hover {
        transform: scale(1.1);
    }
    .contact_us {
    background-color: #f2f2f2;
    padding: 20px;
    border-radius: 5px;
}

/* Payment Background Color */
.bank_cards {
    background-color: #f2f2f2;
    padding: 20px;
    border-radius: 5px;
}
</style>
<footer class="footer_widgets">
    <div class="footer_top">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4">
                    <div class="widgets_container contact_us">
                        <h3 style="font-size: 30px">Liên hệ chúng tôi</h3>
                        <div class="footer_contact">
                            <p style="font-size: 16px;">Địa chỉ: Huyện Tiền Hải - Tỉnh Thái Bình</p>
                            <p style="font-size: 16px;">Điện thoại: <a href="tel:+(+84)888195313" style="font-size: 16px;">0348956373</a> </p>
                            <p style="font-size: 16px;">Email: <a href="mailto:doanhtnhe172637@fpt.edu.vn" style="font-size: 16px;">doanhtnhe172637@fpt.edu.vn</a></p>
                            <ul>
                                <li><a href="https://twitter.com/?lang=vi" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#" title="google-plus"><i class="fa fa-google"></i></a></li>
                                <li><a href="https://www.facebook.com/" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="https://www.youtube.com/channel/UCL_FgBkk8fR3F5DkF4G8tfw" title="Youtube"><i class="fa fa-youtube"></i></a></li>
                            </ul>

                        </div>
                    </div>
                </div>
                 <div class="col-lg-4 col-md-4">
                    <div class="thank-you-image">
                        <img src="https://www.wordstream.com/wp-content/uploads/2022/07/thank-you-for-your-purchase-template-10.png" alt="Thank You" />
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="widgets_container bank_cards">
                        <h3 style="font-size: 30px">Thanh Toán</h3>
                        <div class="bank_cards_content">
                            <div class="bank_card_images">
                                <!-- Example bank card images -->
                                <img src="https://upload.wikimedia.org/wikipedia/commons/2/25/Logo_MB_new.png" alt="" class="bank-card" />
                                <img src="https://cdn.tuoitre.vn/thumb_w/1200/471584752817336320/2023/2/23/logo-vietcombank-inkythuatso-10-10-41-18-16771235759271889182462.jpg" alt="" class="bank-card" />
                                <img src="https://wikiland.vn/wp-content/uploads/Logo-TPBank-Sl.png" alt="" class="bank-card" />
                                <img src="https://image.bnews.vn/MediaUpload/Org/2022/04/26/logo-bidv-20220426071253.jpg" alt="" class="bank-card" />
                                <!-- Add more bank card images as needed -->
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
        <div class="map-area">                         
            <iframe id="googleMap" style="border: none;"  src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3131.9208139151415!2d105.51924235129374!3d21.01256992523427!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abc60e7d3f19%3A0x2be9d7d0b5abcbf4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgSMOgIE7hu5lp!5e0!3m2!1svi!2s!4v1718041269304!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
</footer>
