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
        <title>View Data</title>
    </head>
    <body>

         <table border="2">
            <tr>
        <%
        String query="select * from dataset";
        ResultSet r=Queries.getExecuteQuery(query);
         ResultSetMetaData rsMetaData = r.getMetaData();
    int numberOfColumns = rsMetaData.getColumnCount();
 for (int i = 1; i <=numberOfColumns; i++) {
      String columnName = rsMetaData.getColumnName(i);
      %>
      <th><%=columnName%></th>
      <%
 }
        
        
        %>
            </tr>
          <%
          while(r.next()){
              %>
              <tr>
              <%
              for (int i = 1; i <=numberOfColumns; i++) {
           %>   
           
               <td><%=r.getString(i)%></td>
           
          <%}
%>
</tr>
<%
}
          
          
          %>  
            
            
            
        </table>   
         
         
    </body>
</html>
