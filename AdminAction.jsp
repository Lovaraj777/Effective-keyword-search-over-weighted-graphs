

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.database.Dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{

   
    String uname=request.getParameter("username");
    String pwd=request.getParameter("password");
   
    
    String query="select * from admin where username='"+uname+"'and password='"+pwd+"'";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/weighted_graph", "root", "root");
    Statement st=con.createStatement();
    ResultSet i=st.executeQuery(query);
    
    if(i.next()){
  
%>
      <script type='text/javascript'>
          window.alert("Login Successful...!!");
          window.location="AdminHome.jsp";
      </script>
      <%

    }else{
    
%>
      <script type='text/javascript'>
          window.alert("Login Failed..!!");
          window.location="Admin.jsp";
      </script>
      <%
}
}catch(Exception e){
    out.println(e);
}



%>