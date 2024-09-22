package com.net.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.net.Bean.adminBean;
import com.net.connection.Connect;

public class adminDAO {
    static Connection con = null;
    static PreparedStatement ps = null;
    static int rowCount = 0;
    static ResultSet rs = null;

    public static int Login(adminBean sb) {
        try {
            con = Connect.getConnection();
            String sql = "SELECT * FROM admin WHERE Username = ? AND Password = ?";
            ps = con.prepareStatement(sql);
            
            ps.setString(1, sb.getUname());
            ps.setString(2, sb.getPassword());
            
            rs = ps.executeQuery();
            
            if (rs.next()) {
                rowCount = 1;
            } else {
                rowCount = 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return rowCount;
    }
}
