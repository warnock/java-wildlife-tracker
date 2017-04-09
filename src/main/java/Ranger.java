import org.sql2o.*;

public class Ranger implements DatabaseManagement {
  private String name;
  private int badge_number;
  private String address;
  private int id;

  public Ranger(String name, int badge_number, String address) {
    this.name = name;
    this.badge_number = badge_number;
    this.address = address;
  }



  @Override
  public void save() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO rangers (name, badge_number, address) VALUES (:name, :badge_number, :address);";
      this.id = (int) con.createQuery(sql, true)
        .addParameter("name", this.name)
        .addParameter("badge_number", this.badge_number)
        .addParameter("address", this.address)
        .executeUpdate()
        .getKey();
    }
  }

  @Override
  public void delete() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "DELETE FROM rangers WHERE id=:id;";
      con.createQuery(sql)
        .addParameter("id", id)
        .executeUpdate();
    }
  }
}
