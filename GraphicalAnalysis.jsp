


<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
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
        <li><a href="SearchPost.jsp">Search Post</a></li>
         <li><a href="ViewSearchPost.jsp">View Searched Post</a></li>
         <li class="active"><a href="GraphicalAnalysis.jsp">Graphical Analysis</a></li>
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

<div class="wrapper col4">
  <div id="container">
    <div id="services">
      
      <br class="clear" />
    </div>
    <div id="content" style='margin-bottom:300px;'>
   
        <h3>WEIGHTED KEYWORD GRAPH DETAILS</h3>
          <%@page import="weighted.WeightedGraph"%>
          <%String id=(String)session.getAttribute("id");
          String email=(String)session.getAttribute("email");
          
            int vertices = 50;
            WeightedGraph g = new WeightedGraph();
            
            WeightedGraph.WGraph graph=g.new WGraph(vertices);
            ResultSet r=Queries.getExecuteQuery("select * from search where email='"+email+"'");
            while(r.next()){
                String keyword=r.getString("keyword");
               out.println(keyword.length()+"="+keyword+",");
                int pid=Integer.parseInt(r.getString("postid"));
                int count=Integer.parseInt(r.getString("count"));
                
            graph.addEgde(keyword, pid, count);
           
            }
          
            List<String> f=graph.printGraph();
     
        ListIterator li=f.listIterator();
     
        while(li.hasNext()){
            %>
             <ul>
                    <li><%=li.next()%></li>
                </ul>
           
       <% }
        %>
          
          
          
          
     

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


</body>
</html>

