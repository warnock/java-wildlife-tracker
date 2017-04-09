import org.sql2o.*;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;

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

  public String getName() {
    return name;
  }

  public int getBadgeNumber() {
    return badge_number;
  }

  public String getAddress() {
    return address;
  }

  public int getId() {
    return id;
  }

  public static List<Ranger> all() {
   String sql = "SELECT id, name, badge_number, address FROM rangers";
   try(Connection con = DB.sql2o.open()) {
     return con.createQuery(sql).executeAndFetch(Ranger.class);
   }
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

  public static Ranger find(int id) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM rangers WHERE id = :id";
      Ranger stylist = con.createQuery(sql)
        .addParameter("id", id)
        .executeAndFetchFirst(Ranger.class);
      return stylist;
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

  @Override
  public boolean equals(Object otherRanger) {
    if (!(otherRanger instanceof Ranger)) {
      return false;
    } else {
      Ranger newRanger = (Ranger) otherRanger;
      return this.getName().equals(newRanger.getName())
      && this.getId() == newRanger.getId();
    }
}

}
