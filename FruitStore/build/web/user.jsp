<%-- 
    Document   : user
    Created on : May 30, 2023, 10:32:21 AM
    Author     : ルオン。ズイ。カット
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        User's information:</br>
         <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'US'}">
            <c:redirect url="login.html"></c:redirect>
        </c:if>

    User ID: ${sessionScope.LOGIN_USER.userID} </br>
    Full Name: ${sessionScope.LOGIN_USER.fullName}</br>
    Role ID: ${sessionScope.LOGIN_USER.roleID}</br>
    Password: ${sessionScope.LOGIN_USER.password}
       
    </body>
</html>
