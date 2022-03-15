/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import model.Cart;

/**
 *
 * @author Admin
 */
public class CartDAO implements Serializable{

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public int insertOrder(double total, String username) {
        try {
            String sql = "INSERT INTO [dbo].[order]\n"
                    + "           ([Customer]\n"
                    + "           ,[total_price])\n"
                    + "     VALUES\n"
                    + "           (?,?)";
            conn = new DBContext().getConnection();
            ps = conn.prepareCall(sql);
            ps.setString(1, username);
            ps.setDouble(2, total);
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean insertOrderDetail(List<Cart> cart) {
        int[] arr = {};
        try {
            String sql = "declare @cartid int select @cartid = (select top(1) id from [dbo].[order] order by id desc)\n"
                    + "INSERT INTO [dbo].[order_detail]\n"
                    + "           ([order_id]\n"
                    + "           ,[product_id]\n"
                    + "           ,[product_name]\n"
                    + "           ,[product_price]\n"
                    + "           ,[quantity]\n"
                    + "           ,[product_image])\n"
                    + "     VALUES\n"
                    + "           (@cartid,?,?,?,?,?)";
            conn = new DBContext().getConnection();
            ps = conn.prepareCall(sql);
            
            for (Cart c : cart) {
                ps.setInt(1, c.getProductId());
                ps.setString(2, c.getProductName());
                ps.setDouble(3, c.getProductPrice());
                ps.setInt(4, c.getQuantity());
                ps.setString(5, c.getProductImg());
                ps.addBatch();
            }
            arr = ps.executeBatch();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return arr.length > 0;
    }
}
