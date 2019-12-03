<%-- 
    Document   : upload
    Created on : Dec 7, 2018, 9:21:18 AM
    Author     : phand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Upload</h1>
    <center>
        <form method="post" action="TestServlet" enctype="multipart/form-data">
            Select file to upload:
            <!--<img src="<%=request.getContextPath()%>/Image/hotgirl.jpg">-->
            <input type="file" name="uploadFile" />
            <input type="file" name="uploadFile" />
            <input type="text" name="txt" />
            <input type="submit" value="Upload" />
        </form>
    </center>
</body>
</html>
