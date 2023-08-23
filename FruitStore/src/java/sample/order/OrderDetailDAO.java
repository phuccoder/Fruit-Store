/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.order;

import java.io.Serializable;
import sample.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.naming.NamingException;

/**
 *
 * @author huy
 */
public class OrderDetailDAO implements Serializable{
    public boolean addOrderDetail(int quantity, double price, String pID, int order_id) 
        throws SQLException {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            // 1. Connect DB
            con = DBUtils.getConnectionV2();
            if (con != null) {
                // 2. Create SQL String
                String sql = "INSERT INTO Order_Detail (quantity, price, product_id, order_id) "
                        + "VALUES (?, ?, ?, ?)";
                // 3. Create Statement & Assign Paramaters' values
                stmt = con.prepareStatement(sql);
                stmt.setInt(1, quantity);
                stmt.setDouble(2, price);
                stmt.setString(3, pID);
                stmt.setInt(4, order_id);
                // 4. Execute Query
                int row = stmt.executeUpdate();
                
                // 5. Process rs
                if (row > 0) {
                    return true;
                }
            } // EndIf con is connected
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (con!= null) {
                con.close();
            }
        }
        return false;
    }
}