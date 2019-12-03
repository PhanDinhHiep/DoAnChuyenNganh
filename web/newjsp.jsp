<%-- 
    Document   : newjsp
    Created on : Oct 26, 2018, 10:20:33 PM
    Author     : phand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="WEB-INF/ckeditor/ckeditor.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form>
            <textarea id="cke" rows="5"></textarea>
            <input type="submit" value="ok">

        </form>
        <script>
            CKEDITOR.replace('cke');
        </script>
    </body>
</html>
