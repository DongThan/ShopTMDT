<%@page import="DAO.EmployeeDAO"%>
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
        <script src="jquery.tablePagination.js" type="text/javascript"></script>
        <script>
            $(document).ready(function(){   
                $("#employeerefresh").click(function(){
//                    $("#employeetable").load("updatetable.jsp #table1");                   
                    $("#employeetable").load( "ajax-updatetable-emp.jsp #table1", function() {
                        $('#table1').tablePagination({
                            perPage: 7,
                            showAllButton:false
                        });
                        $("button[id|='del']").click(function() {
                            if (confirm('Xóa nhân viên khỏi database database?')) {
                                $(this).closest('tr').find('td').eq(0).each(function() {
                                    var textval = $(this).text(); // this will be the text of each <td>
                                    console.log(textval);
                                    $.ajax({
                                        type: "post",
                                        url: "ajax-delete-emp.jsp", //this is my servlet
                                        data: {
                                            EID:textval               
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
                                            console.log("Fail");
                                        }
                                    });
                                }); 
                            } else {

                            }

                        });
                        $("button[id|='edit']").click(function() {
                            openForm("form2");
//                    console.log(emp_edit_eid);           
//                    console.log(emp_edit_name);
//                    console.log(emp_edit_sex);
//                    console.log(emp_edit_email);
//                    console.log(emp_edit_phone);
//                    console.log(emp_edit_add);
//                    console.log(emp_edit_pay);
//                    console.log(emp_edit_sal);
                            var emp_edit_eid=$(this).closest('tr').find('td').eq(0).text();
                            var emp_edit_name=$(this).closest('tr').find('td').eq(1).text();
                            var emp_edit_sex=$(this).closest('tr').find('td').eq(2).text();
                            var emp_edit_email=$(this).closest('tr').find('td').eq(3).text();
                            var emp_edit_phone=$(this).closest('tr').find('td').eq(4).text();
                            var emp_edit_add=$(this).closest('tr').find('td').eq(5).text();
                            var emp_edit_pay=$(this).closest('tr').find('td').eq(6).text();
                            var emp_edit_sal=$(this).closest('tr').find('td').eq(7).text();
                            FillForm2(emp_edit_name,emp_edit_sex,emp_edit_email,emp_edit_phone,emp_edit_add,
                                    emp_edit_pay,emp_edit_sal,emp_edit_eid);
                        });
                    });
                    
                });
                $('#save-emp').click(function (){
                    $.ajax({
                        type: "post",
                        url: "ajax-insertemp.jsp", //this is my servlet
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
                $('#edit-emp').click(function (){
                    $.ajax({
                        type: "post",
                        url: "ajax-edit-emp.jsp", //this is my servlet
                        data: {
                            eid: $('#eid-emp-edit').val(),
                            name: $('#name-emp-edit').val(), 
                            mail: $('#mail-emp-edit').val(),
                            phone: $('#phone-emp-edit').val(), 
                            address: $('#add-emp-edit').val(), 
                            sex: $('#sex-emp-edit').val(), 
                            salary: $('#salary-emp-edit').val(),
                            paycheck: $('#paycheck-emp-edit').val()
                        },
                        success: function ( response ){   
                            //handleData(response);
                            var success = $($.parseHTML(response)).filter("#sqlmsg").html();
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
                $('#table1').tablePagination({
                    perPage: 7,
                    showAllButton:false
                });
                $("button[id|='del']").click(function() {
                    if (confirm('Xóa nhân viên khỏi database database?')) {
                        $(this).closest('tr').find('td').eq(0).each(function() {
                            var textval = $(this).text(); // this will be the text of each <td>
                            console.log(textval);
                            $.ajax({
                                type: "post",
                                url: "ajax-delete-emp.jsp", //this is my servlet
                                data: {
                                    EID:textval               
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
                                    console.log("Fail");
                                }
                            });
                        }); 
                    } else {

                    }
                    
                });
                $("button[id|='edit']").click(function() {
                    openForm("form2");
//                    console.log(emp_edit_eid);           
//                    console.log(emp_edit_name);
//                    console.log(emp_edit_sex);
//                    console.log(emp_edit_email);
//                    console.log(emp_edit_phone);
//                    console.log(emp_edit_add);
//                    console.log(emp_edit_pay);
//                    console.log(emp_edit_sal);
                    var emp_edit_eid=$(this).closest('tr').find('td').eq(0).text();
                    var emp_edit_name=$(this).closest('tr').find('td').eq(1).text();
                    var emp_edit_sex=$(this).closest('tr').find('td').eq(2).text();
                    var emp_edit_email=$(this).closest('tr').find('td').eq(3).text();
                    var emp_edit_phone=$(this).closest('tr').find('td').eq(4).text();
                    var emp_edit_add=$(this).closest('tr').find('td').eq(5).text();
                    var emp_edit_pay=$(this).closest('tr').find('td').eq(6).text();
                    var emp_edit_sal=$(this).closest('tr').find('td').eq(7).text();
                    FillForm2(emp_edit_name,emp_edit_sex,emp_edit_email,emp_edit_phone,emp_edit_add,
                            emp_edit_pay,emp_edit_sal,emp_edit_eid);
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
            <button title="View Employee" onclick="openPage('emp')" id="emppage"><i class="fas fa-id-card"></i></button>
            <button title="View Product" onclick="openPage('pro') " id = ''><i class="fas fa-shopping-bag"></i></button>
            <button title="View Customer" onclick="openPage('cus') " id = ''><i class="fas fa-users"></i></button>
            <button title="View Sales" onclick="openPage('sales') " id = ''><i class="fas fa-money-check-alt"></i></button>
            <button title="View Statistic" onclick="openPage('sta');miniChart('chartContainer1','btnchart1')" id="stapage"><i class="fas fa-chart-line"></i></button>
            <button title="Logout" ><i class="fas fa-sign-out-alt"></i></button>
        </nav>
        <!--        Dashboard code ở đây-->
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
        <!--        Employee code ở đây-->
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
                            <th>Paycheck</th>
                            <th>Salary</th>
                            <th colspan="2">Option</th>
                        </tr>
                        <%
                        ResultSet resultSet = null;
                        try {
                                EmployeeDAO EmpDao=new EmployeeDAO();
                                resultSet = EmpDao.AllEmp();
                                while (resultSet.next()) {%>
                                <tr>
                                    <td><%=resultSet.getString("EmployeeID")%></td>
                                    <td><%=resultSet.getString("EmployeeName")%></td>
                                    <td><%=resultSet.getString("Sex")%></td>
                                    <td><%=resultSet.getString("Email")%></td>
                                    <td><%=resultSet.getString("Phone")%></td>
                                    <td><%=resultSet.getString("Address")%></td>   
                                    <td><%=resultSet.getString("Paycheck")%></td> 
                                    <td><%=resultSet.getString("Salary")%></td>
                                    <td><button class="btn" id="edit"><i class="fas fa-edit"></i></button></td>
                                    <td><button class="btn" id="del"><i class="fa fa-trash"></i></button></td>
                                </tr>                   
                                <%}
                            }        
                            catch (Exception e)
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
                        try {
                                EmployeeDAO EmpDao=new EmployeeDAO();
                                resultSet = EmpDao.AllEmp();
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
                        catch (Exception e) 
                            {
                                e.printStackTrace();
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
                    <!--Product code ở đây-->
        <div class="divcontent" id="pro" >     
            <div class="divchua">
                <div class="dashbo" id="d1">
                    <p>Employee</p>
                </div>
                <div class="dashbosr" >
                    <p id="time">???</p>
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
                    <!--Customer code ở đây-->
        <div class="divcontent" id="cus" >     
            <div class="divchua">
                <div class="dashbo" id="d1">
                    <p>Employee</p>
                </div>
                <div class="dashbosr" >
                    <p id="time">???</p>
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
                    <!--Khuyến mãi code ở đây-->
        <div class="divcontent" id="sales" >     
            <div class="divchua">
                <div class="dashbo" id="d1">
                    <p>Employee</p>
                </div>
                <div class="dashbosr" >
                    <p id="time">???</p>
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
                <div class="dashbo" id="d1">
                    <p>Employee</p>
                </div>
                <div class="dashbosr" >
                    <p id="time">???</p>
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
        <div class="divform" id="form2" >
            <form >
                <h1>Edit Employee</h1>
                <label ><strong>Name</strong></label>
                <input type="text" placeholder="Enter Name" name="name" id="name-emp-edit">
                <label ><strong>E-mail</strong></label>
                <input type="text" placeholder="Enter E-mail" name="mail" id="mail-emp-edit">
                <label ><strong>Phone</strong></label>
                <input type="text" placeholder="Enter Phone" name="phone" id="phone-emp-edit">
                <label ><strong>Address</strong></label>
                <input type="text" placeholder="Enter Address" name="address" id="add-emp-edit">
                <label ><strong>Salary</strong></label>
                <input type="text" placeholder="Enter Salary" name="salary" id="salary-emp-edit">
                <label ><strong>Sex</strong></label>
                <select name="sex" id="sex-emp-edit">
                    <option selected>M</option>
                    <option>F</option>
                </select><br>
                <label ><strong>Paycheck</strong></label>
                <input type="date" id="paycheck-emp-edit" name="paycheck"><br>
                <input type="hidden" id="eid-emp-edit">
                <button type="button" id="edit-emp"><strong>Edit</strong></button>   
                <button type="button" style="background-color: red;" onclick="closeForm('form2')" ><strong>Close</strong></button>        
            </form>  
            </div>
        <script>  
            startTime();
            creatchart1();
            window.onload = LoadPage('<%=a%>');
            
        </script>
    </body>
</html>
