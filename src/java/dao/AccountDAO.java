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
import model.Account;

/**
 *
 * @author Admin
 */
public class AccountDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public Account login(String username, String password) {  // DAO đăng nhập
        try {
            String query = "select * from account where userName = ? and password= ? and status=1";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();

            while (rs.next()) {
                Account A = new Account(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getString(10));

                return A;
            }
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }

    public int register(String username, String password, String displayName, String address, String email, String phone) {   //DAO đăng kí
        try {
            String query = "INSERT INTO [dbo].[account]\n"
                    + "           ([userName]\n"
                    + "           ,[password]\n"
                    + "           ,[displayName]\n"
                    + "           ,[address]\n"
                    + "           ,[email]\n"
                    + "           ,[phone]\n"
                    + "           ,[role_id]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,0,1)";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, displayName);
            ps.setString(4, address);
            ps.setString(5, email);
            ps.setString(6, phone);

            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
     public List<Account> getInfoAccount() {   //DAO lấy thông tin account để check trùng account khi đăng kí
        try {
            String query = "select * from account";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
           
            rs = ps.executeQuery();
            
            List<Account> list = new ArrayList<>();
            while (rs.next()) {
                Account A = new Account(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getString(10));

                list.add(A);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Account getAccountByUsername(String username) {  //lấy account bằng username
        try {
            String query = "select * from account where userName = ?";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();

            while (rs.next()) {
                Account A = new Account(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getString(10));

                return A;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Account> getListUser() {      //lấy list user trừ Admin 
        try {
            String query = "select * from account where role_id =0 ";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            //ps.setString(1, username);
            rs = ps.executeQuery();
            List<Account> listAccount = new ArrayList<>();
            while (rs.next()) {
                Account A = new Account(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getString(10));
                listAccount.add(A);

            }
            return listAccount;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public int banUserbyUserName(String userName) {  // Ban user
        try {
            String query = "UPDATE [dbo].[account]\n"
                    + "   SET \n"
                    + "      [status] = 0\n"
                    + "\n"
                    + " WHERE userName = ?";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userName);

            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
        public int unBanUserbyUserName(String userName) {  //UnBan user
        try {
            String query = "UPDATE [dbo].[account]\n"
                    + "   SET \n"
                    + "      [status] = 1\n"
                    + "\n"
                    + " WHERE userName = ?";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userName);

            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
