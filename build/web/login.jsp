<%-- 
    Document   : login
    Created on : May 30, 2023, 10:31:58 AM
    Author     : ルオン。ズイ。カット
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page JSP</title>
    </head>
    <body>
        Input your information
         <form action="MainController" method="POST">
            User ID <input type="text" name="userID" required=""/></br>
            Password <input type="password" name="password" required=""/></br>
            <input type="submit" name="action" value="Login"/></br>
            <input type="reset" value="Reset"/></br>
        </form>
        <a href="createUser.jsp">Create user</a>
        </br><a href="MainController?action=shoppingPage">Phuc Store</a>
        ${requestScope.ERROR}
    </body>
</html>
