/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Home;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.billDAO;
import model.Cart;
import model.User;
import java.io.IOException;
import VnPayCommon.Config;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.TimeZone;

public class Checkout extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        try {

            HttpSession session = request.getSession(true);
            Cart cart = null;
            String payment = null;
            billDAO dao = new billDAO();
            String payment_method = request.getParameter("payment_method");
            //check card
            Object o = session.getAttribute("cart");
            if (o != null) {
                cart = (Cart) o;
            } else {
                cart = new Cart();
            }
            User acc = null;
            Object u = session.getAttribute("user");
            if (o != null) {
                if (u != null) {
                    String address = request.getParameter("address");
                    String phone = request.getParameter("phone");
                    if (payment_method.equals("momo")) {
                        payment = "MOMO";
                    }
                    if (payment_method.equals("vnpay")) {
                        payment = "VNPAY";
                    }
                    if (payment_method.equals("cod")) {
                        payment = "COD";
                    }
                    int phonenumber = Integer.parseInt(phone);
                    acc = (User) u;
                    dao.addOrder(acc, cart, payment, address, phonenumber);
                    session.removeAttribute("cart");
                    session.setAttribute("size", 0);
                    if (payment_method.equals("cod")) {
                        response.sendRedirect("home");
                    }
                    if (payment_method.equals("momo")) {
                        model.Bill bill = dao.getBill();
                        int total = Math.round(bill.getTotal());
                        request.setAttribute("total", total);
                        request.setAttribute("bill", bill);
                        request.getRequestDispatcher("qrcode.jsp").forward(request, response);
                    }
                    if (payment_method.equals("vnpay")) {
                        model.Bill bill = dao.getBill();
                        int total = Math.round(bill.getTotal());
                        int billId = bill.getBill_id();
                        request.setAttribute("total", total);
                        request.setAttribute("billId", billId);
                        request.getRequestDispatcher("vnpay_pay.jsp").forward(request, response);
                    }
            } 
                else {
                response.sendRedirect("user?action=login");
            }
        }else {
                if (payment_method.equals("momo")) {
                    model.Bill bill = dao.getBill();
                    int total = Math.round(bill.getTotal());
                    request.setAttribute("total", total);
                    request.setAttribute("bill", bill);
                    request.getRequestDispatcher("qrcode.jsp").forward(request, response);
                }
                if (payment_method.equals("cod")) {
                    response.sendRedirect("home");
                }
            }
    }
    catch (Exception e) {
            request.getRequestDispatcher("404.jsp").forward(request, response);
    }
}

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
/**
 * Handles the HTTP <code>GET</code> method.
 *
 * @param request servlet request
 * @param response servlet response
 * @throws ServletException if a servlet-specific error occurs
 * @throws IOException if an I/O error occurs
 */
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Object u = session.getAttribute("user");
        if (u != null) {
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        } else {
            response.sendRedirect("user?action=login");
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
