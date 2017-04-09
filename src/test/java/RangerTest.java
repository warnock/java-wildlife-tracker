import org.junit.*;
import static org.junit.Assert.*;
import org.sql2o.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;

public class RangerTest {

  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
  public void ranger_instantiatesCorrectly_true() {
    Ranger testRanger = new Ranger("Tom", 34, "salmon creek dr");
    assertEquals(true, testRanger instanceof Ranger);
  }

  @Test
  public void getName_instantiatesCorrectly_true() {
    Ranger testRanger = new Ranger("Tom", 34, "salmon creek dr");
    assertEquals("Tom", testRanger.getName());
  }

  @Test
  public void getBadgeNumber_instantiatesCorrectly_true() {
    Ranger testRanger = new Ranger("Tom", 34, "salmon creek dr");
    assertEquals(34, testRanger.getBadgeNumber());
  }

  @Test
  public void getAddress_instantiatesCorrectly_true() {
    Ranger testRanger = new Ranger("Tom", 34, "salmon creek dr");
    assertEquals("salmon creek dr", testRanger.getAddress());
  }

  @Test
  public void getId_returnsInstanceOfId_1() {
    Ranger newRanger = new Ranger("Tom", 34, "salmon creek dr");
    newRanger.save();
    assertTrue(newRanger.getId() > 0);
 }

}
