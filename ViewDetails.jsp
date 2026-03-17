
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.database.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Effective Keyword Search over Weighted Graphs</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="layout/styles/layout.css" type="text/css" />
<link rel="stylesheet" href="table.css" type="text/css" />
</head>
<body id="top">
<div class="wrapper col1">
  <div id="header">
    <div id="logo" style="width:1000px;">
      <h1><a href="#">Effective Keyword Search over Weighted Graphs</a></h1>
     
    </div>
    <div id="info" >
      
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col2">
  <div id="topbar">
    <div id="topnav">
      <ul>
        <li><a href="UserHome.jsp">Home</a></li>
        <li><a href="ViewProfile.jsp">View Profile</a></li>
        <li class="active"><a href="SearchPost.jsp">Search Post</a></li>
         <li><a href="ViewSearchPost.jsp">View Searched Post</a></li>
          <li><a href="User.jsp">Logout</a></li>
       
      </ul>
    </div>
    <div id="search">
     
    </div>
    <br class="clear" />
  </div>
</div>
<style>
    
</style>
<!-- #########
############################################################################################## -->

<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div id="container">
    <div id="services">
      
      <br class="clear" />
    </div>
    <div id="content" style='margin-bottom:300px;'>
      <h2>Search Result</h2>
      <p align="justify">
          <%String id=(String)session.getAttribute("id");
          String email=(String)session.getAttribute("email");
          
          String sid=request.getParameter("id");
          String keyword=request.getParameter("keyword");%>
          
          
          <table>
              <tr><th>Page URL</th><th>Source</th><th>Followers</th><th>Date of Post</th><th>Post Type</th><th>Interactions</th><th>Post Messages</th></tr>
              <%
              try{
               Connection con=Dbconnection.getcon();
               Statement st=con.createStatement();
               Statement st1=con.createStatement();
               Statement st2=con.createStatement();
              Date d=new Date();
             SimpleDateFormat sm=new SimpleDateFormat("dd:MM:YYYY");
             String dd=sm.format(d);
             
             ResultSet r1=st1.executeQuery("select * from search where email='"+email+"'and keyword='"+keyword+"' and postid='"+sid+"'");    
                  if(r1.next()){
                 int ii=1;
                 String keyw=r1.getString("keyword");
                 ResultSet rr=st2.executeQuery("select * from search where email='"+email+"' and keyword='"+keyw+"' and postid='"+sid+"'");
                 if(rr.next()){
                     ii=Integer.parseInt(rr.getString("count"));
                     ii=ii+1;
                  st.executeUpdate("update search set count='"+ii+"' where email='"+email+"' and keyword='"+keyw+"'");   
                     
                 }
                  
                }else{
                      st.executeUpdate("insert into search values(null,'"+email+"','"+keyword+"','1','"+sid+"','"+dd+"')");
                    }
             
               ResultSet r=Queries.getExecuteQuery("select * from dataset where id='"+sid+"'");
               if(r.next()){
                %>
              <tr>
                  <td><%=r.getString("PageURL")%></td>
                  <td><%=r.getString("Source")%></td>
                  <td><%=r.getString("Followers")%></td>
                  <td><%=r.getString("Date")%></td>
                  <td><%=r.getString("PostType")%></td>
                  <td><%=r.getString("Interactions")%></td>
                  <td><textarea cols="50" rows="10"><%=r.getString("PostMessage")%></textarea></td>
                  
                 
              </tr>
              
              <%
               }
              }catch(Exception e){
                  System.out.println(e);
              }
              %>
          </table>
      </p>
    </div>
    <div id="column">
      <div class="flickrbox">
       
        <br class="clear" />
      </div>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col5">
  <div id="footer">
   
   
  
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col6">
  <div id="copyright">
    <p class="fl_left">Effective Keyword Search over Weighted Graphs</p>
    <p class="fl_right"></p>
    <br class="clear" />
  </div>
</div>
</body>
</html>