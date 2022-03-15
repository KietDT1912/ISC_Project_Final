/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DuplicateProduct;
import model.Product;

/**
 *
 * @author Admin
 */
public class CreatorController extends HttpServlet {

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
            int cateory_id = Integer.parseInt(request.getParameter("category_id"));
            String name = request.getParameter("name");
            String code = request.getParameter("code");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double price = Double.parseDouble(request.getParameter("price"));
            String description = request.getParameter("description");
            String imageLink = request.getParameter("imageLink");
            int status = Integer.parseInt(request.getParameter("status"));

            Product createPro = new Product();
            createPro.setCategoryId(cateory_id);
            createPro.setName(name);
            createPro.setCode(code);
            createPro.setQuantity(quantity);
            createPro.setPrice(price);
            createPro.setDescription(description);
            createPro.setImage(imageLink);
            createPro.setStatus(status);

            List<Product> list = new ProductDAO().getAll();
            DuplicateProduct dup = new DuplicateProduct();
            boolean checkCreate = true;
            try {
                for (Product product : list) {
                    if (code.equals(product.getCode())) {
                        checkCreate = false;
                        dup.setCodeDup("Code of your product has existed in DB, please choose another");
                    }
                    if (name.equals(product.getName())) {
                        checkCreate = false;
                        dup.setNameDup("Code of your product has existed in DB, please choose another");
                    }
                    if ( !imageLink.contains(".jpg") && !imageLink.contains(".png")) {
                        System.out.println(cateory_id);
                        checkCreate = false;
                        dup.setImageErr("Please choose right format of picture");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (checkCreate == true) {
                int createCheck = new ProductDAO().createProduct(createPro);
                if (createCheck != 0) {
                    response.sendRedirect("home");
                }
            } else {
                request.setAttribute("ERR", dup);
                request.getRequestDispatcher("create.jsp").forward(request, response);

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
        request.getRequestDispatcher("create.jsp").forward(request, response);
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
