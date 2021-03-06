<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CompanyMedia</title>
    <link href="../../css/signin.css" rel="stylesheet">

    <!-- Bootstrap -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <form class="form-signin" role="form" method="POST" action="/login">
    <h2 class="form-signin-heading">Введите логин и пароль</h2>
        <input class="form-control" placeholder="Логин" name="fio" required autofocus autocomplete="off">
        <input type="password" class="form-control" placeholder="Пароль" name="password" required autocomplete="off">
        <button class="btn btn-lg btn-primary btn-block" type="submit" name="submit" value="submit">Войти</button>
        <c:if test="${errorLogin==true}">
            <div style="color: red">Неверный логин или пароль</div>
        </c:if>

    </form>

</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://code.jquery.com/jquery.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../../js/bootstrap.min.js"></script>
</body>
</html>