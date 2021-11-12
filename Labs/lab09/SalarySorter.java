/*
  File: TestLogin.java
  August 2002
*/

import java.io.*;
import java.util.*;
import java.sql.*;

/**
 * This program reads a user's pass.dat and connects to Oracle.
 *
 * @author Paul Werstein
 */

public class SalarySorter {


    public static void main (String[] args) {
	new SalarySorter().go();
    }

    // This is the function that does all the work
    private void go() {

	// Read pass.dat
	UserPass login = new UserPass();
	String user = login.getUserName();
	String pass = login.getPassWord();
	String host = "silver";

	Connection con = null;
	try {
	    // Register the driver and connect to Oracle
	    DriverManager.registerDriver 
		(new oracle.jdbc.driver.OracleDriver());
	    String url = "jdbc:oracle:thin:@" + host + ":1527:cosc344";
            System.out.println("url: " + url);
	    con = DriverManager.getConnection(url, user, pass);
	    System.out.println("Connected to Oracle");

	    // From here is my code
	    String command = "select fname, lname, salary from employee";
	    PreparedStatement stmt = con.prepareStatement(command);
	    ResultSet rs = stmt.executeQuery();
	    ArrayList<EmployeeSalary> employeeSalarys = new ArrayList<>();
	    while(rs.next()) {
		String fName = rs.getString("fname");
		String lName = rs.getString("lname");
		Integer salary = rs.getInt("salary");
		EmployeeSalary es = new EmployeeSalary(fName, lName, salary);
		employeeSalarys.add(es);
	    }
	    Collections.sort(employeeSalarys);
	    for(EmployeeSalary es : employeeSalarys){
		es.printEmployeeSalary();
	    }
	    
	    
	} catch (SQLException e) {
	    System.out.println(e.getMessage());
	    System.exit(1);

	} finally {
	    if (con != null) {
		try {
		    con.close();
		} catch (SQLException e) {
		    quit(e.getMessage());
		}
	    }
	}
    }  // end go()

    // Used to output an error message and exit
    private void quit(String message) {
	System.err.println(message);
	System.exit(1);
    }

} // end class TestLogin


