<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/e74f1447db.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="mycssadminpage.css" type="text/css">
        <script src="testjavascript.js" type="text/javascript"></script>
        <style>
            .tabledis{
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
            margin-left: 1%;
            margin-bottom: 1%;
            font-size: 14px;
        }
        .tabledis td,th{
            border: 1px solid #ddd;
            padding: 8px;
        }
        .tabledis tr:nth-child(even){background-color: #f2f2f2;}
        .tabledis tr:hover{background-color: #ddd;}
        .tabledis th{
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #4CAF50;
            color: white;
        }
        .btn {
            background-color: DodgerBlue;
            border: none; 
            color: white; 
            padding: 12px 16px;
            font-size: 12px; 
            cursor: pointer;
            margin-left: 1%;
            margin-bottom: 1%;
          }
        </style>
        <script>
            
            
        </script>
        <title>Testing</title>
    </head>
    <body>
        <table id="table1" class="tabledis">
            <tr>
                <th>EID</th>
                <th>Name</th>
                <th>Sex</th>
                <th>E-mail</th>
                <th>Phone</th>
                <th>Address</th>
                <th colspan="2">Option</th>
            </tr>
            <%
            String url = "jdbc:mysql://localhost:3306/webdb";
            String user = "root";
            String password = "QM1234";
            Connection connection = null;
            PreparedStatement prestatement = null;
            ResultSet resultSet = null;
            url = "jdbc:mysql://localhost:3306/dbthuongmaidientu";
            user = "root"; 
            password = "QM1234"; 
            System.out.println("Init Firing: ");
           try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    connection = DriverManager.getConnection(url, user , password);
                    prestatement = connection.prepareStatement("SELECT * FROM employee");
                    resultSet = prestatement.executeQuery();
                    while (resultSet.next()) {%>
                    <tr>
                        <td><%=resultSet.getString("EmployeeID")%></td>
                        <td><%=resultSet.getString("EmployeeName")%></td>
                        <td><%=resultSet.getString("Sex")%></td>
                        <td><%=resultSet.getString("Email")%></td>
                        <td><%=resultSet.getString("Phone")%></td>
                        <td><%=resultSet.getString("Address")%></td>   
                        <td><button class="btn"><i class="fas fa-edit"></i></button></td>
                        <td><button class="btn"><i class="fa fa-trash"></i></button></td>
                    </tr>                   
                    <%}
                }          
            catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException e) 
                {
                    e.printStackTrace();
                }
            %>
        </table>
    </body>
</html>
