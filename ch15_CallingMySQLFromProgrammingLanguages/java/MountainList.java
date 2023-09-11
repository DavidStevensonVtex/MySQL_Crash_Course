import java.sql.* ;

public class MountainList {
    public static void main(String []args) {
        String url = "jdbc:mysql://localhost:3306/topography" ;
        String username = "root" ;
        String password = "Stevenson#1569#MySQL" ;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, username, password);
            Statement stmt = conn.createStatement();
            String sql = "select mountain_name, location, height from mountain" ;
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                System.out.println( 
                rs.getString("mountain_name") + " | " +
                rs.getString("location") + " | " + 
                rs.getString("height"));
            }
            conn.close();
        }
        catch (Exception ex ) {
            System.out.println(ex);
        }
    }
}