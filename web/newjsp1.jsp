

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello!</h1>
        <%
            String sodtkh = request.getParameter("sdt");
            String tenkh = request.getParameter("mkhau");                
        %>
        <h1><%=sodtkh%></h1>
         <h1><%=tenkh%></h1>
    </body>
</html>
