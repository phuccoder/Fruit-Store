<%-- 
    Document   : create
    Created on : Feb 25, 2023, 10:13:46 AM
    Author     : ルオン。ズイ。カット
--%>

<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Page</title>
    </head>
    <body>
        <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if(userError == null){
                userError = new UserError();
            }
        %>
        <form action="MainController" method="POST">
            User ID<input type="text" name="userID" required=""/>${requestScope.USER_ERROR.userIDError}
            </br>
            Full name<input type="text" name="fullName" required=""/>${requestScope.USER_ERROR.fullNameError}
            </br>
            Role ID<input type="text" name="roleID" value="US" readonly=""/></br>
            Password <input type="password" name="password" required=""/></br>
            Confirm <input type="password" name="confirm" required=""/>${requestScope.USER_ERROR.confirmError}
            </br>
            </br>
            <input type="submit" name="action" value="Create"/>
            <input type="reset" value="Reset"/>
        </form>
            <%= userError.getError()%>
    </body>
</html>
