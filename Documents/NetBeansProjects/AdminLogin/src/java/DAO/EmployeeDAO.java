/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author ASUS
 */
public class EmployeeDAO {
    private int ID;
    private String Name;
    private String Sex;
    private String Email;
    private String Phone;
    private String Address;
    private int Salary;
    private String Paycheck;
    private int WorksDay;

    public EmployeeDAO() {
    }

    public EmployeeDAO(int ID, String Name, String Sex, String Email, String Phone, String Address,int Salary, String Paycheck) {
        this.ID = ID;
        this.Name = Name;
        this.Sex = Sex;
        this.Email = Email;
        this.Phone = Phone;
        this.Address = Address;
        this.Salary = Salary;
        this.Paycheck = Paycheck;
    }

    public EmployeeDAO(int ID, String Name, String Sex, String Email, String Phone, String Address, int Salary, String Paycheck, int WorksDay) {
        this.ID = ID;
        this.Name = Name;
        this.Sex = Sex;
        this.Email = Email;
        this.Phone = Phone;
        this.Address = Address;
        this.Salary = Salary;
        this.Paycheck = Paycheck;
        this.WorksDay = WorksDay;
    }

    public int getID() {
        return ID;
    }

    public String getName() {
        return Name;
    }

    public String getSex() {
        return Sex;
    }

    public String getEmail() {
        return Email;
    }

    public String getPhone() {
        return Phone;
    }

    public String getAddress() {
        return Address;
    }

    public double getSalary() {
        return Salary;
    }

    public String getPaycheck() {
        return Paycheck;
    }

    public int getWorksDay() {
        return WorksDay;
    }
    private Connection getConnection() throws ClassNotFoundException  {
        Connection conn;
        Database db=new Database();
        conn = db.getConnection();
        return conn;
    }
    public ResultSet AllEmp()
    {
        try{
            ResultSet resultSet = null;
            Connection con=getConnection();
            PreparedStatement prestatement = null;
            prestatement = con.prepareStatement("SELECT * FROM employee");
            resultSet = prestatement.executeQuery();
            return resultSet;
        }
        catch(ClassNotFoundException | SQLException e){
            return null;
        } 
    }
    public String delete(int EID)
    {
        try{
            Connection con=getConnection();
            PreparedStatement prestatement = null;
            String query="Delete FROM employee WHERE EmployeeID=?";
            prestatement = con.prepareStatement(query);
            prestatement.setInt(1, EID);
            prestatement.executeUpdate();
            return "true";
        }
        catch(ClassNotFoundException | SQLException e){
            return "false";
        }          
    }
    public String insert(EmployeeDAO A)
    {
        try{
            Connection con=getConnection();
            PreparedStatement prestatement = null;
            prestatement = con.prepareStatement("insert into employee "
                                + "values(?,?,?,?,?,?,?,?)");
            prestatement.setString(1,null);
            prestatement.setString(2,A.getName());
            prestatement.setString(3,A.getSex());
            prestatement.setString(4,A.getEmail());
            prestatement.setString(5,A.getPhone());
            prestatement.setString(6,A.getAddress());
            prestatement.setString(7,String.valueOf(A.getSalary()));
            prestatement.setString(8,A.getPaycheck());                    
            prestatement.executeUpdate();
            return "true";
        }
        catch(ClassNotFoundException | SQLException e){
            return "false";
        }          
    }
    public String edit(EmployeeDAO A)
    {
        try{
            Connection con=getConnection();
            PreparedStatement prestatement = null;
            prestatement = con.prepareStatement("update employee set EmployeeName=?,Sex=?,Email=?,"
                    + "Phone=?,Address=?,Salary=?,Paycheck=? where EmployeeID=?");
            
            prestatement.setString(1,A.getName());
            prestatement.setString(2,A.getSex());
            prestatement.setString(3,A.getEmail());
            prestatement.setString(4,A.getPhone());
            prestatement.setString(5,A.getAddress());
            prestatement.setString(6,String.valueOf(A.getSalary()));
            prestatement.setString(7,A.getPaycheck());   
            prestatement.setString(8,String.valueOf(A.getID()));
            prestatement.executeUpdate();
            return "true";
        }
        catch(ClassNotFoundException | SQLException e){
            return "false";
        }          
    }
}
