

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
   
    
    String query="select * from user where username='"+uname+"'and password='"+pwd+"'";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/weighted_graph", "root", "root");
    Statement st=con.createStatement();
    ResultSet i=st.executeQuery(query);
    
    if(i.next()){
  String id=i.getString("id");
  String email=i.getString("email");
  session.setAttribute("id",id);
  session.setAttribute("email",email);
%>
      <script type='text/javascript'>
          window.alert("Login Successful...!!");
          window.location="UserHome.jsp";
      </script>
      <%

    }else{
    
%>
      <script type='text/javascript'>
          window.alert("Login Failed..!!");
          window.location="User.jsp";
      </script>
      <%
}
}catch(Exception e){
    out.println(e);
}



%>