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
import model.Category;

/**
 *
 * @author Admin
 */
public class CategoryDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public List<Category> getAll() {
        try {
            String sql = "select * from category ";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            List<Category> list = new ArrayList<>();
            while (rs.next()) {
                Category C = new Category(rs.getInt(1), rs.getString(2), rs.getInt(3));
                list.add(C);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
