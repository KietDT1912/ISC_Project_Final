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
public class UpdateProductController extends HttpServlet {

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

            Product updatePro = new Product();
            updatePro.setCategoryId(cateory_id);
            updatePro.setName(name);
            updatePro.setCode(code);
            updatePro.setQuantity(quantity);
            updatePro.setPrice(price);
            updatePro.setDescription(description);
            updatePro.setImage(imageLink);
            updatePro.setStatus(status);

            DuplicateProduct dup1 = new DuplicateProduct();
            boolean checkCreate = true;
            try {
                if (!imageLink.contains(".jpg") && !imageLink.contains(".png")) {
                    System.out.println(cateory_id);
                    checkCreate = false;
                    dup1.setImageErr("Please choose right format of picture");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (checkCreate == true) {
                int updateCheck = new ProductDAO().updateProduct(updatePro);
                if (updateCheck != 0) {
                    response.sendRedirect("product-manager");
                }
            } else {
                List<Product> updateProduct = new ProductDAO().getProductByCode(code);
                request.setAttribute("updatePro", updateProduct);
                request.setAttribute("ERROR", dup1);
                request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
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
        String code = request.getParameter("code");
        //System.out.println(code);
        List<Product> updateProduct = new ProductDAO().getProductByCode(code);
        //System.out.println(updatePro);
        request.setAttribute("updatePro", updateProduct);
        request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
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
