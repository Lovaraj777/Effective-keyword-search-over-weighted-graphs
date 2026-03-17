<%-- 
    Document   : ViewData
    Created on : 12 Jul, 2021, 6:57:35 PM
    Author     : KishanVenky
--%>

<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="com.database.Queries"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Top_K Search Data</title>
    </head>
    <body>

         <table border="2">
             <tr>
                 <th>Date</th>
                 <th>Post Link</th>
                   <th>Post Type</th>
                    <th>Interactions</th>
             </tr>
        <%
            try{
        String query="select * from dataset Order By Interactions Desc";
        ResultSet r=Queries.getExecuteQuery(query);
         
          while(r.next()){
              %>
              <tr>
                  <td><%=r.getString("Date")%></td>
                  <td><%=r.getString("PostLink")%></td>
                  <td><%=r.getString("PostType")%></td>
                  <td><font color="red"><%=r.getString("Interactions")%></font></td>
              </tr>
              
              <%
              
}
       
}catch(Exception e){
out.println(e);
}
          
          %>  
            
            
            
        </table>   
         
         
    </body>
</html>
