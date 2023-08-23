
package sample.order;

import sample.utils.DBUtils;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.naming.NamingException;


public class OrderDAO implements Serializable{
     public int addOrder(String cusName, Timestamp time, String cusAddrress, String cusPhone_no, Double total) 
        throws SQLException {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnectionV2();
            if (con != null) {
                String sql = "INSERT INTO tblOrder (order_date, total, customer_name, customer_address, customer_phone) "
                        + "VALUES (?, ?, ?, ?, ?)";
                stmt = con.prepareStatement(sql);
                stmt.setTimestamp(1, time);
                stmt.setDouble(2, total);
                stmt.setString(3, cusName);
                stmt.setString(4, cusAddrress);
                stmt.setString(5, cusPhone_no);
                int row = stmt.executeUpdate();
                
                if (row > 0) {
                    sql = "SELECT TOP 1 order_id FROM tblOrder ORDER BY order_id DESC ";
                    stmt = con.prepareStatement(sql);
                    rs = stmt.executeQuery();
                    if (rs.next()) {
                        return rs.getInt("order_id");
                    }
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
        return 0;
    }
}