/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author Admin
 */
public class ProductDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public List<Product> getAll() {  // Lấy tất cả product
        try {
            String query = "SELECT * FROM product";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product P = new Product(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10)
                );

                list.add(P);
            }
            return list;
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }

    public List<Product> getAllPaging(int pageIndex, int pageSize) { //lấy tất cả product có chia trang
        try {
            String query = "SELECT * FROM product WHERE status = 1 ORDER BY id OFFSET (?*?-?) ROWS FETCH NEXT ? ROWS ONLY";
                                                         //sap xep theo id     bang ghi(so bang ghi)  fetch next: so phan tu 1 trang
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, pageIndex);
            ps.setInt(2, pageSize);
            ps.setInt(3, pageSize);
            ps.setInt(4, pageSize);

            rs = ps.executeQuery();

            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product P = new Product(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10)
                );

                list.add(P);
            }
            return list;
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }

    public int countPage(int pageSize) {  //đếm số trang
        try {
            String query = "SELECT Count(*) FROM product";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();

            int count = 0;
            if (rs.next()) {
                count = rs.getInt(1);
            }
            int numOfPage = count / pageSize;
            if (count % pageSize != 0) {
                numOfPage++;
            }
            return numOfPage;
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return 0;
    }

    public List<Product> getProductByCategoryIdPaging(int categoryId, int pageIndex, int pageSize) {   //Lấy product theo category có chia trang
        try {
            String query = "SELECT * FROM product where category_id= ? ORDER BY id OFFSET (?*?-?) ROWS FETCH NEXT ? ROWS ONLY";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, categoryId);
            ps.setInt(2, pageIndex);
            ps.setInt(3, pageSize);
            ps.setInt(4, pageSize);
            ps.setInt(5, pageSize);
            rs = ps.executeQuery();

            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product P = new Product(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10)
                );

                list.add(P);
            }
            return list;
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }

    public int countPageWhenGetProById(int categoryId, int pageSize) {  //đếm trang khi lấy theo category
        try {
            String query = "select Count(*) from product where category_id= ?";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, categoryId);
            rs = ps.executeQuery();

            int count = 0;
            if (rs.next()) {
                count = rs.getInt(1);
            }
            int numOfPage = count / pageSize;
            if (count % pageSize != 0) {
                numOfPage++;
            }
            return numOfPage;
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return 0;
    }

    public int deleteProductByCode(String code) {  // xóa product theo code
        try {
            String query = "DELETE FROM [dbo].[product]\n"
                    + "      WHERE code = ?";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, code);
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Product> getProductByCode(String code) {  // lấy product theo code
        try {
            String query = "select * from product where code =?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, code);
            rs = ps.executeQuery();

            List<Product> listProduct = new ArrayList<>();
            while (rs.next()) {
                Product P = new Product(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10)
                );
                listProduct.add(P);
            }
            return listProduct;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int updateProduct(Product product) {  //Update product theo code
        try {
            String query = "UPDATE [dbo].[product]\n"
                    + "   SET [category_id] = ?\n"
                    + "      ,[name] = ?\n"
                    + "      ,[quantity] = ?\n"
                    + "      ,[price] = ?\n"
                    + "      ,[description] = ?\n"
                    + "      ,[image] = ?\n"
                    + "      ,[status] = ?\n"
                    + " WHERE code = ?";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, product.getCategoryId());
            ps.setString(2, product.getName());
            ps.setInt(3, product.getQuantity());
            ps.setDouble(4, product.getPrice());
            ps.setString(5, product.getDescription());
            ps.setString(6, product.getImage());
            ps.setInt(7, product.getStatus());
            ps.setString(8, product.getCode());

            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public Product getProductById(int productID) {  // Lấy product theo Id
        try {
            String query = "SELECT * FROM product where id = ?";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            rs = ps.executeQuery();

            if (rs.next()) {
                Product P = new Product(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10));

                return P;
            }
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }

    public int createProduct(Product pro) {
        try {
            String query = "INSERT INTO [dbo].[product]\n"
                    + "           ([category_id]\n"
                    + "           ,[code]\n"
                    + "           ,[name]\n"
                    + "           ,[quantity]\n"
                    + "           ,[price]\n"
                    + "           ,[description]\n"
                    + "           ,[image]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?,?)";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, pro.getCategoryId());
            ps.setString(2, pro.getCode());
            ps.setString(3, pro.getName());
            ps.setInt(4, pro.getQuantity());
            ps.setDouble(5, pro.getPrice());
            ps.setString(6, pro.getDescription());
            ps.setString(7, pro.getImage());
            ps.setInt(8, pro.getStatus());

            return ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Product> search(String keyWord, int pageIndex, int pageSize) {  //Search phan trang
        try {
            String query = "select * from product where [dbo].[product].name like ? order By id\n"
                    + "                    OFFSET (?*?-?) ROWS FETCH NEXT ? ROWS ONLY";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + keyWord + "%");
            ps.setInt(2, pageIndex);
            ps.setInt(3, pageSize);
            ps.setInt(4, pageSize);
            ps.setInt(5, pageSize);

            rs = ps.executeQuery();

            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product P = new Product(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10));

                list.add(P);
            }
            return list;
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }

    public int countPageWhenSearch(String keyWord, int pageSize) {
        try {
            String query = "select Count(*) from product where [dbo].[product].name like ?";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + keyWord + "%");
            rs = ps.executeQuery();

            int count = 0;
            if (rs.next()) {
                count = rs.getInt(1);
            }
            int numOfPage = count / pageSize;
            if (count % pageSize != 0) {
                numOfPage++;
            }
            return numOfPage;
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return 0;
    }
}
