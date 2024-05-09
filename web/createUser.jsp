<%-- 
    Document   : createuser
    Created on : Feb 23, 2024, 11:33:39 AM
    Author     : ADMIN
--%>

<%@page import="sample.sp24.t4s2.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Create User</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
          body{
              color: red
          }
            
        </style>
    </head>
    <body>
        <h1>Create user. Input user information</h1>

        <form action="MainController" method="POST">
            UserID<input type="text" name="userID" required=""/> ${requestScope.USER_ERROR.userIDError}
            </br>Full name<input type="text" name="fullName" required=""/>${requestScope.USER_ERROR.getfullName()}
            </br>Role ID<select name="roleID">
                <option value="AD">AD</option>
                <option value="US">US</option>
                <option value="OTHER">OTHER</option>
            </select>
            </br>Password<input type="password" name="password" required=""/>
            </br>Confirm<input type="password" name="confirm" required=""/>${requestScope.USER_ERROR.passwordError}
            </br><input type="submit" name="action" value="Create"/>
            <input type="reset" value="Reset"/>
            ${requestScope.USER_ERROR.error}
        </form>
    </body>
</html>
