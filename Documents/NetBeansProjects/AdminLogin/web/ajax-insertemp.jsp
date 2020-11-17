<%-- 
    Document   : testjsp
    Created on : Nov 8, 2020, 10:35:42 AM
    Author     : ASUS
--%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
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
        <%
            String errorsql="";
            String salary = request.getParameter("salary");
            if(salary==""||salary==null)
            {
                errorsql="Lỗi : Chưa nhập lương nhân viên";
            }
            try{
                int salint=Integer.parseInt(salary);  
                if(salint<0)
                {
                    errorsql="Lỗi : Lương nhân viên không hợp lệ (phải lớn hơn 0)";
                }
            }
            catch(Exception e)
            {
                errorsql="Lỗi : Lương nhân viên không hợp lệ (nhập số)";
            }
            String add = request.getParameter("address");
            if(add==""||add==null)
            {
                errorsql="Lỗi : Chưa nhập địa chỉ nhân viên";
            }
            String phone = request.getParameter("phone");
            if(phone==""||phone==null)
            {
                errorsql="Lỗi : Chưa nhập số điện thoại nhân viên";
            }
            String mail = request.getParameter("mail");
            if(mail==""||mail==null)
            {
                errorsql="Lỗi : Chưa nhập mail nhân viên";
            }
            String name = request.getParameter("name");
            if(name==""||name==null)
            {
                errorsql="Lỗi : Chưa nhập tên nhân viên";
            }
            String sex = request.getParameter("sex");
            Calendar c = Calendar.getInstance();
            c.setTime(new Date()); // Now use today date.
            c.add(Calendar.DATE, 30); // Adding 30 days
            SimpleDateFormat ft = 
            new SimpleDateFormat ("yyyy-MM-dd");
            String date=ft.format(c.getTime());
            
            if(errorsql=="")
            {
                String url = "jdbc:mysql://localhost:3306/webdb";
                String user = "root";
                String password = "QM1234";
                Connection connection = null;
                PreparedStatement prestatement = null;
                url = "jdbc:mysql://localhost:3306/dbthuongmaidientu";
                user = "root"; 
                password = "QM1234"; 
                try {
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        connection = DriverManager.getConnection(url, user , password);
                        prestatement = connection.prepareStatement("insert into employee "
                                + "values(?,?,?,?,?,?,?,?)");
                        prestatement.setString(1,null);
                        prestatement.setString(2,name);
                        prestatement.setString(3,sex);
                        prestatement.setString(4,mail);
                        prestatement.setString(5,phone);
                        prestatement.setString(6,add);
                        prestatement.setString(7,salary);
                        prestatement.setString(8,date);                    
                        prestatement.executeUpdate();
                        errorsql="Thêm nhân viên thành công";
                    }        
                catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException e) 
                    {
                        e.printStackTrace();
                        errorsql=String.valueOf(e);
                    }
            }
            

        %>
        <p id="msg">
        <%=name%><br>   
        <%=mail%><br>  
        <%=phone%><br>  
        <%=add%><br>  
        <%=sex%><br>  
        <%=salary%><br> 
        <%=date%><br> 
        <%=errorsql%><br> 
        </p>
        <div id="errormsg">
            <%=errorsql%>
        </div>
        <p id="sqlmsg"> <%=errorsql%></p>
    </body>
</html>
