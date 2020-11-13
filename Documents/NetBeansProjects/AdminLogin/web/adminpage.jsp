<%
   String a="home";
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="mycssadminpage.css" type="text/css">
        <title>Business Manager Overview </title>
        <script src="https://kit.fontawesome.com/e74f1447db.js" crossorigin="anonymous"></script>
        <script src="adminpage.js" type="text/javascript"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            $(document).ready(function(){   
                $("#employeerefresh").click(function(){
                    $("#employeetable").load("updatetable.jsp #table1");
                });
                $('#save-emp').click(function (){
                    $.ajax({
                        type: "post",
                        url: "insertemp.jsp", //this is my servlet
                        data: {
                            name: $('#name-emp').val(), 
                            mail: $('#mail-emp').val(),
                            phone: $('#phone-emp').val(), 
                            address: $('#add-emp').val(), 
                            sex: $('#sex-emp').val(), 
                            salary: $('#salary-emp').val()
                        },
                        success: function ( response ){   
                            //handleData(response);
                            var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                            console.log(success); // div#success
                            alert(success);
                            clickme("employeerefresh");
                        },
                        error: function(xhr, textStatus, error){
                            console.log(xhr.statusText);
                            console.log(textStatus);
                            console.log(error);
                        }
                    });
                });
                $("#empsort-id").click(function(){
                    sortTableID('table1');
                });
                $("#empsort-name").click(function(){
                    sortTable('table1','1');
                });
            });
        </script>
    </head>
    <body >
        
        <div class="topnav" >
            
            <a> <i class="fas fa-sign-out-alt"></i></a>
            <a style="margin-right: 23.5%;font-family: Showcard Gothic,serif;width: 30%">Business Manager Overview </a>
        </div>
        <nav>
            <button onclick="openPage('home')" title="Visit Dashboard" id="default"><i class="fas fa-home"></i></button>
            <button title="View Employee" onclick="openPage('emp')" id="emppage"><i class="fas fa-user-check"></i></button>
            <button title="View Product" onclick="openPage('pro') " id = ''><i class="fas fa-money-check-alt"></i></button>
            <button title="View Statistic" onclick="openPage('sta');miniChart('chartContainer1','btnchart1')" id="stapage"><i class="fas fa-chart-line"></i></button>
            <button title="Logout" ><i class="fas fa-sign-out-alt"></i></button>
        </nav>
        <!--        Dashboard-->
        <div class="divcontent" id="home">            
            <div class="divchua">
                <div class="dashbo" id="d1">
                    <p>Dashboard</p>
                </div>
                <div class="dashbosr" >
                    <p id="time">???</p>
                </div>
                <div class="card">
                    <p><i class="fas fa-user-tie"></i></p>
                    <h3>2</h3>
                    <p>Admin</p>
                    <a>View</a>
                </div>
                <div class="card">
                    <p><i class="fas fa-id-card"></i></p>
                    <h3>55</h3>
                    <p>Employee</p>
                    <a>View</a>
                </div>
                <div class="card">
                    <p><i class="fas fa-money-bill-wave"></i></p>
                    <h3>10</h3>
                    <p>Paycheck</p>   
                    <a>View</a>
                </div>
                <div class="card">
                    <p><i class="fas fa-envelope-square"></i></p>
                    <h3>3</h3>
                    <p>Mail</p>
                    <a>View</a>
                </div>
                <div class="card">
                    <p><i class="fa fa-user"></i></p>
                    <h3>11</h3>
                    <p>Customer</p>
                    <a>View</a>
                </div>
                <div class="card">
                    <p><i class="fa fa-check"></i></p>
                    <h3>25</h3>
                    <p>Order</p>
                    <a>View</a>
                </div>
                <div class="card">
                    <p><i class="fas fa-tshirt"></i></p>
                    <h3>128</h3>
                    <p>Product</p>   
                    <a>View</a>
                </div>
                <div class="card">
                    <p><i class="fas fa-comment-dollar"></i></p>
                    <h3>3</h3>
                    <p>Sales</p>
                    <a>View</a>
                </div>

            </div>
        </div>
        <!--        Employee-->
        <div class="divcontent" id="emp" >     
            <div class="divchua">
                <div class="dashbo" id="d1">
                    <p>Employee</p>
                </div>
                <div class="dashbosr" >
                    <p id="time">???</p>
                </div>
                <div class="dashbosl" id='employeetag' >
                    <p >Employee<button class="minibtn" id="btnAd" onclick="miniTable('employeetable','btnAd')">-</button></p>                    
                </div>   

                <div class="searhbar">
                <button class="btn" onclick="openForm('form1')"><i class="fas fa-user-plus"></i></button>
                <button class="btn" id="employeerefresh" value="Refresh"><i class="fas fa-sync" ></i></button> 
                <input id="empsearchbar" type="text" class="myInput" onkeyup="FilterTable('table1','empsearchbar')" placeholder="Search for names.." title="Type in a name">
                <select class="myselect" id="empselect">
                    <option value="0" >EID</option>
                    <option value="1" selected>Name</option>
                    <option value="3" >Email</option>
                    <option value="4" >Phone</option>
                    <option value="5" >Add</option>
                </select>
                </div>
                <div id="employeetable" class="divtable">                    
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
                </div>
                <div class="dashbosl" >
                    <p id='paychecktag'>Paycheck<button class="minibtn" id="btnpay" onclick="miniTable('paycheck','btnpay')">-</button></p>
                </div>
                <div id="paycheck" class="divtable">
                    <table id="emp1" class="tabledis">
                        <tr>
                            <th >EID</th>
                            <th >Name</th>
                            <th>Salary</th>
                            <th>Paycheck</th>
                            <th colspan="2">Option</th>
                        </tr>
                        <%
                        url = "jdbc:mysql://localhost:3306/dbthuongmaidientu";
                        user = "root"; 
                        password = "QM1234"; 
                        try {
                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                connection = DriverManager.getConnection(url, user , password);
                                prestatement = connection.prepareStatement("SELECT * FROM employee");
                                resultSet = prestatement.executeQuery();
                                while (resultSet.next()) {%>
                                <tr>
                                    <td><%=resultSet.getString("EmployeeID")%></td>
                                    <td><%=resultSet.getString("EmployeeName")%></td>
                                    <td><%=resultSet.getString("Salary")%></td>
                                    <td><%=resultSet.getString("Paycheck")%></td>
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
                </div>
            </div>
        </div>
        <div class="divcontent" id="pro" >     
            <div class="divchua">
                <div class="dashbo" id="d3">
                    <p>Product</p>
                </div>
                <div class="divcon" id="d3">

                </div>
                <div class="divcon" id="d3">

                </div>
                <div class="divcon" id="d3">

                </div>
                <div class="divcon" id="d3">

                </div>
            </div>
        </div>
        <div class="divcontent" id="sta" >     
            <div class="divchua">
                <div class="dashbo" id="d4">
                    <p>Statistic</p>
                </div>
                <div class="dashbosl" >
                    <p >Paycheck<button class="minibtn" id="btnchart1" onclick="miniChart('chartContainer1','btnchart1')">-</button></p>
                </div>
                <div id="chartContainer1" style="height: 50%; width: 50%;display: none" >
                    <canvas id="chart1" style="height: 300px; width: 50%;"> </canvas>
                </div>
            </div>
        </div>
        <div class="divform" id="form1">
        <form >
            <h1>Add a new Admin</h1>
            <label ><strong>Name</strong></label>
            <input type="text" placeholder="Enter Name" name="name" id="name-emp">
            <label ><strong>E-mail</strong></label>
            <input type="text" placeholder="Enter E-mail" name="mail" id="mail-emp">
            <label ><strong>Phone</strong></label>
            <input type="text" placeholder="Enter Phone" name="phone" id="phone-emp">
            <label ><strong>Address</strong></label>
            <input type="text" placeholder="Enter Address" name="address" id="add-emp">
            <label ><strong>Salary</strong></label>
            <input type="text" placeholder="Enter Salary" name="salary" id="salary-emp">
            <label ><strong>Sex</strong></label>
            <select name="sex" id="sex-emp">
                <option selected>M</option>
                <option>F</option>
            </select><br>
            <button type="button" id="save-emp"><strong>Add</strong></button>   
            <button type="button" style="background-color: red;" onclick="closeForm('form1')" ><strong>Close</strong></button>        
        </form>  

    </div> 
        <script>  
            startTime();
            creatchart1();
            window.onload = LoadPage('<%=a%>');
            
        </script>
    </body>
</html>
