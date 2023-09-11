import java.sql.* ;

public class MountainNew {
    public static void main(String []args) {
        String url = "jdbc:mysql://localhost:3306/topography" ;
        String username = "root" ;
        String password = "Stevenson#1569#MySQL" ;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, username, password);
            String sql = "insert into mountain ( mountain_name, location, height ) values ( ?, ?, ? )" ;
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, "Kangchenjunga");
            stmt.setString(2, "Asia");
            stmt.setInt(3, 28169);
            stmt.executeUpdate();
            conn.close();
        }
        catch (Exception ex ) {
            System.out.println(ex);
        }
    }
}