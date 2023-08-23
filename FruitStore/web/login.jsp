<%-- 
    Document   : login
    Created on : May 30, 2023, 10:31:58 AM
    Author     : ルオン。ズイ。カット
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page JSP</title>
    </head>
    <body>
        Input your information
         <form action="LoginController" method="POST" id="form">
            User ID <input type="text" name="userID" required=""/></br>
            Password <input type="password" name="password" required=""/></br>
            <div class="g-recaptcha" data-sitekey="6LeBiQMnAAAAADBN9lbZ8KJZ_Qb1ekJ0XQnCMii2"></div>
            <div id="error"></div>
            <input type="submit" name="action" value="Login"/></br>
            <input type="reset" value="Reset"/></br>
        </form>
        
    
        <a href="createUser.jsp">Create user</a>
        </br><a href="MainController?action=shoppingPage">Phuc Store</a>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
                window.onload = function (){
                        const form = document.getElementById("form");
                        const error = document.getElementById("error");

                        form.addEventListener("submit", function (event){
                                event.preventDefault();
                                const response = grecaptcha.getResponse();
                                console.log(response);
                                if (response){
                                    form.submit();
                                } else {
                                        error.innerHTML = "Please check captcha!!!";
                                }
                        });
                }
        </script>
    </body>
</html>
