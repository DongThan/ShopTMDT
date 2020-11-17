<%-- 
    Document   : ajax-edit-emp
    Created on : Nov 17, 2020, 1:15:07 PM
    Author     : ASUS
--%>

<%@page import="DAO.EmployeeDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%
            String errorsql="";
            String eid=request.getParameter("eid");
            String salary = request.getParameter("salary");
            String pay=request.getParameter("paycheck");
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
            if(errorsql=="")
            {
                try{
                    int inteid=Integer.valueOf(eid);
                    int intsal=Integer.valueOf(salary);
                    EmployeeDAO EmpDao=new EmployeeDAO(inteid,name,sex,mail,phone,add,intsal,pay);
                    EmpDao.edit(EmpDao);
                    errorsql="Chỉnh sửa thành công";
                }
                catch(Exception e)
                {
                    errorsql="Lỗi DAO";
                }

            }
        %>
        <p id="sqlmsg"> <%=errorsql%></p>
        <div id="debug">
            <p><%=errorsql%></p>
            <p><%=eid%></p>
            <p><%=name%></p>
            <p><%=sex%></p>
            <p><%=mail%></p>
            <p><%=phone%></p>
            <p><%=add%></p>
            <p><%=salary%></p>
            <p><%=pay%></p>
        </div>

        
    </body>
</html>