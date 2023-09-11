import java.sql.* ;

public class MountainAsia {
    public static void main(String []args) {
        String url = "jdbc:mysql://localhost:3306/topography" ;
        String username = "root" ;
        String password = "Stevenson#1569#MySQL" ;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, username, password);
            String sql = "{call p_get_mountain_by_loc(?)}" ;
            CallableStatement stmt = conn.prepareCall(sql);
            stmt.setString(1, "Asia");
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                System.out.println( 
                rs.getString("mountain_name") + " | " +
                rs.getInt("height"));
            }
            conn.close();
        }
        catch (Exception ex ) {
            System.out.println(ex);
        }
    }
}