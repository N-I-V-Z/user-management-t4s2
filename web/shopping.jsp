<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
        }
        form {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
        }
        select, input[type="submit"] {
            width: 100%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            margin-bottom: 10px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        p {
            text-align: center;
            color: green;
        }
    </style>
</head>
<body>
    <h2>Take your Gun!!!</h2>
    <form action="MainController" method="POST">
        <label for="weapon">Type:</label>
        <select name="weapon" id="weapon">
            <option value="W001-Short Gun-10">Short Gun-10$</option>
            <option value="W002-AK 47-11">AK 47-11$</option>
            <option value="W003-Water Gun(cute)-100">Water Gun(cute)-100$</option>
            <option value="W004-Red Hat-1000">Red Hat-1000$</option>
        </select>
        <br>
        <label for="quantity">Quantity:</label>
        <select name="quantity" id="quantity">
            <option value="1">1 item</option>
            <option value="2">2 items</option>
            <option value="3">3 items</option>
            <option value="4">4 items</option>
            <option value="5">5 items</option>
            <option value="10">10 items</option>
        </select>
        <br>
        <input type="submit" name="action" value="Add">
        <input type="submit" name="action" value="View">
    </form>
    
    <p>${requestScope.MESSAGE}</p>
</body>
</html>
