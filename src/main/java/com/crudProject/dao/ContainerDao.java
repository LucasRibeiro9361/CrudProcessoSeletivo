package com.crudProject.dao;

import com.mysql.jdbc.PreparedStatement;
import com.crudProject.bean.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.*;

public class ContainerDao {
	public static Connection getConnection() {
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crud","root","");
		} catch (Exception e) {
			System.out.println();
		}
		return con;
	}
	
	public static List<Container> getAllContainers(){
		List<Container> list = new ArrayList<Container>();
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("select * from container");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(new Container(
						rs.getString("nmContainer"),
						rs.getString("cliente"),
						rs.getInt("tipo"),
						rs.getInt("status"),
						rs.getInt("categoria")
						));
			}
		} catch (Exception e) {
			System.out.println();
		}
		return list;
	}
	
	public static void insert(Container c) {
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("insert into container values(?,?,?,?,?)");
			ps.setString(1, c.getNmContainer() );
			ps.setString(2, c.getCliente());
			ps.setInt(3, c.getTipo());
			ps.setInt(4, c.getStatus());
			ps.setInt(5, c.getCategoria());
			ps.execute();
		} catch (Exception e) {
			
		}
	}
	
	public static void delete(String id ) {
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("delete from container where nmContainer = ? ");
			ps.setString(1, id);
			ps.execute();
		} catch (Exception e) {
			System.out.println();
		}
	}
}
