/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Cart;

/**
 *
 * @author Admin
 */
public class CheckOutServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            HttpSession session = request.getSession();
            List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
            Account account = (Account) session.getAttribute("account");

            String name1 = request.getParameter("name1");
            if (account != null) {
                double totalPrice = 0;
                for (Cart cart : listCart) {
                    totalPrice += cart.getProductPrice() * cart.getQuantity();
                }
                int insertOrder = new CartDAO().insertOrder(totalPrice, name1);
                if (insertOrder != 0) {
                    boolean insertOrderDetail = new CartDAO().insertOrderDetail(listCart);
                    if (insertOrderDetail) {
                        session.removeAttribute("listCart");
                        request.getRequestDispatcher("thank.jsp").forward(request, response);
                    }
                }
                request.setAttribute("totalPrice", totalPrice);
                request.setAttribute("listCart", listCart);
                request.setAttribute("account", account);
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            } else {
                response.sendRedirect("login");
            }
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
        processRequest(request, response);
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
