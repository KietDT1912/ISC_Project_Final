/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.DuplicateAccount;

/**
 *
 * @author Admin
 */
public class RegisterController extends HttpServlet {

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
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String displayName = request.getParameter("displayName");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

            DuplicateAccount dup = new DuplicateAccount();
            boolean checkErr = false;
            List<Account> acctmp = new AccountDAO().getInfoAccount();
            try {
                for (Account acc : acctmp) {
                    if (username.equals(acc.getUserName())) {
                        checkErr = true;
                        dup.setUsernameDup("Username has existed !!!");
                    }
                    if (email.equals(acc.getEmail())) {
                        checkErr = true;
                        dup.setEmailDup("Email has existed !!!");
                    }
                    if (phone.equals(acc.getPhone())) {
                        checkErr = true;
                        dup.setPhoneDup("Phone has existed !!!");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (checkErr == false) {
                int registerCheck = new AccountDAO().register(username, password, displayName, address, email, phone);
                if (registerCheck != 0) {
                    response.sendRedirect("login");
                } else {
                    request.setAttribute("err", "Register Fail, Please Check Again All Information !!");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("Err", dup);
                request.getRequestDispatcher("register.jsp").forward(request, response);
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
        request.getRequestDispatcher("register.jsp").forward(request, response);
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
