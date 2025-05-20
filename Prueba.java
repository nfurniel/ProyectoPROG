package pck1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Prueba {
	private String database = "trabajoprog";		    
    private String hostname = "localhost";
    private String port = "3306";
	private String login = "root"; 
	private String pwd = "GonzaloM90305";
	private String url = "jdbc:mysql://localhost/" + database;
	private static Connection conexion;
			
	public Prueba () {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conexion = DriverManager.getConnection(url, login, pwd);
			System.out.println(" - Conexión con BD establecida -");
		}
		catch (SQLException e) {
			System.out.println("Error de Conexión con BD: " + e.getMessage() + " -- " + e.getSQLState() + " cod.:" + e.getErrorCode());
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("– Error de Conexión con BD -");
			e.printStackTrace();
		}
	}
}