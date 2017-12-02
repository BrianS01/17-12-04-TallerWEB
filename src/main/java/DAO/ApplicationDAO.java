/*
 *  Taller WEB
 *   co-Author :::   Juan Albarracin
 *   co-Author :::  Mario BolaÃ±os
 *   co-Author ::: Sergio Orozco
 *   co-Author :::  Brian Sterling
 *     Program ::: Bases de Datos
 *  Credential ::: SIST0008-G01:SIV
 */

package DAO;

import util.DbUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import VO.Application;


public class ApplicationDAO
{
    private Connection connection;

    public ApplicationDAO()
    {
        connection = DbUtil.getConnection();
    }

    public void addUser(Application user)
    {
        try
        {
            PreparedStatement preparedStatement = connection.prepareStatement("insert into application(name,description) values (?, ?)");
            preparedStatement.setInt(1, user.getIdApplication());
            preparedStatement.setString(2, user.getName());
            preparedStatement.setString(3, user.getDescription());
            preparedStatement.executeUpdate();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    public void deleteUser(int idApplication)
    {
        try
        {
            PreparedStatement preparedStatement = connection.prepareStatement("delete from application where idApplication=?");
            preparedStatement.setInt(1, idApplication);
            preparedStatement.executeUpdate();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    public void updateUser(Application user)
    {
        try 
        {
            PreparedStatement preparedStatement = connection.prepareStatement("update application set name=?, description=?" + "where idApplication=?");
            preparedStatement.setInt(1, user.getIdApplication());
            preparedStatement.setString(2, user.getName());
            preparedStatement.setString(3, user.getDescription());
            preparedStatement.executeUpdate();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    public List<Application> getAllUsers()
    {
        List<Application> users = new ArrayList<Application>();
        try
        {
            System.out.println("Llegue hasta aca");
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from users");
            
            while (rs.next())
            {
                Application user = new Application();
                user.setIdApplication(rs.getInt("idApplication"));
                user.setName(rs.getString("name"));
                user.setDescription(rs.getString("description"));
                users.add(user);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return users;
    }

    public Application getUserById(int userId)
    {
        Application user = new Application();
        try
        {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from users where userid=?");
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next())
            {
                user.setIdApplication(rs.getInt("idApplication"));
                user.setName(rs.getString("name"));
                user.setDescription(rs.getString("description"));
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return user;
    }
}