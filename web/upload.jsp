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
        <form method="post" action="UploadFileServerlet" enctype="multipart/form-data">
            hdd<input type="file" name="hinhdd" required=""/><br>
            h1<input type="file" name="uploadFile" required=""/><br>
            h2<input type="file" name="uploadFile" required=""/><br>
            maloai<input type="text" name="hiep" required=""/><br>
            masp<input type="text" name="msp" required=""/><br>
            tensanpham<input type="text" name="tensanpham" required=""/><br>
            <input type="submit" value="Upload" />
        </form>
    </center>
</body>
</html>
