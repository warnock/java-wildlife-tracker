import org.sql2o.*;

public class Ranger implements DatabaseManagement {
  private String name;
  private int badge_number;
  private String address;
  private int id;

  public Ranger(String name, int badge_number, String address) {
    this.name = name;
    this.badgeNumber = badge_number;
    this.address = address;
  }






  public void delete() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "DELETE FROM rangers WHERE id=:id;";
      con.createQuery(sql)
        .addParameter("id", id)
        .executeUpdate();
    }
  }
}
