<%-- 
    Document   : AdminHome
    Created on : 12 Jul, 2021, 6:29:50 PM
    Author     : KishanVenky
--%>

<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="com.database.Queries"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Effective Keyword Search over Weighted Graphs</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="layout/styles/layout.css" type="text/css" />
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
        <li ><a href="Admin.jsp">Home</a></li>
        <li><a href="UploadDataset.jsp">Upload</a></li>
         <li><a href="ViewDataset.jsp">View Data</a></li>
          <li ><a href="ViewTopK.jsp">Top_K Search post</a></li>
         <li  class="active"><a href="ViewGraph.jsp">View Graph</a></li>
         <li><a href="Admin.jsp">Logout</a></li>
      </ul>
    </div>
    <div id="search">
     
    </div>
    <br class="clear" />
  </div>
</div>
<div class="wrapper col4">
  <div id="container">
    <div id="services">
      
      <br class="clear" />
    </div>
    <div id="content">
      <h2 style="color:red;">Top_K Search Data</h2>
     <center>
      <%
      try{
          String query="select  * from dataset order by Interactions desc  limit 5";
          ResultSet r=Queries.getExecuteQuery(query);
          while(r.next()){
           String Date =r.getString("Date");  
            String Interactions =r.getString("Interactions"); 
            
          Queries.getExecuteUpdate("insert into graph values('"+Date+"','"+Interactions+"')");
            
          }
          
      }catch(Exception e){
       out.println(e);   
      }
      
      
      
      %>
   <iframe src="viewgraph" width="600" height="400"></iframe>  
      </center>
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