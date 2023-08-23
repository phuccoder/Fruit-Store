<%-- 
    Document   : viewCart
    Created on : Jun 17, 2023, 1:55:02 PM
    Author     : PHUC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Cart</title>
    </head>
    <body>
        <c:set var="fullname" value="${sessionScope.LOGIN_USER.fullName}"/>
        <c:if test="${not empty fullname}">
            <div>
                <font color="red">Welcome</font> ${fullname}
                <form action="MainController">
                    <input type="submit" value="Logout" />
                </form>
            </div>
        </c:if>
        <c:if test="${empty sessionScope.LOGIN_USER}">
            <div>
                <form action="login.jsp">
                    <input type="submit" value="Login" />
                </form>
                <br/>
            </div>
        </c:if>
                
        <c:set var="cart_items" value="${requestScope.ITEMS_IN_CART}"/>
        <c:if test="${not empty cart_items}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Title</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th>Action</th>
                        <th></th>
                    </tr>
                </thead>
                <form action="CartRemoveController">
                    <tbody>
                        <c:forEach var="item" items="${cart_items}" varStatus="counter">
                                <c:set var="total" value="${item.value * item.key.price}"></c:set>
                                <tr>
                                    <td>${counter.count}</td>
                                    <td>${item.key.productName}</td>
                                    <td>${item.key.price}</td>
                                    <td>${item.value}</td>
                                    <td>${total}</td>
                                    <td><input type="checkbox" name="chkItem" value="${item.key.productID}" /></td>
                                    <td>
                                    </td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td colspan="3">
                                    <a href="ShoppingController">Add More</a>
                                </td>
                                <td colspan="2"></td>
                                <td>
                                    <input type="submit" value="Remove" />
                                </td>

                                <td>
                                    <a href="CheckoutViewController">CheckOut</a>
                                </td>
                            </tr>
                    </tbody>
                </form>
            </table>

        </c:if>
        <c:if test="${empty cart_items}">
            <h1 style="color: red">No Item In Cart!!!</h1>
            <a href="ShoppingController">Back To Store</a>
        </c:if>
    </body>
</html>