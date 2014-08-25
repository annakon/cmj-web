<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.ico">

    <title>CompanyMedia</title>

    <!-- Bootstrap core CSS -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../../css/page1.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<div class="navbar navbar-default  navbar-fixed-top navborder" role="navigation">
    <div class="container-fluid">
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav colblue">
                <li><a href="/doc/new">Создать</a></li>
                <li class="divider"></li>
                <li><a href="/doc/new">Редактировать</a></li>
                <li class="divider"></li>
                <li><a href="#" onclick="req()">Зарегистрировать</a></li>
                <li class="divider"></li>
                <li><a href="/doc/new">Связать</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">


                <li><a href="/emp/list">Администрирование</a></li>
                <li><a href="/page1/logout">Выход</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="active"><a href="#">Проекты</a></li>
                <li><a href="#">Зарегистрированные</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th></th>
                        <th>#</th>
                        <th>Дата документа</th>
                        <th>Дата регистрации</th>
                        <th>Заголовок</th>
                        <th>Адресат</th>
                        <th>Связь</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${mas}" var="d">
                        <tr>
                            <td><input type="radio" name="curdoc" value="<c:out value="${d.id}"/>"></td>
                            <td></td>
                            <td><c:out value="${d.out_date}"/></td>
                            <td></td>
                            <td><c:out value="${d.subject}"/></td>
                            <td><c:out value="${d.adr}"/></td>
                            <td></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/main.js"></script>
</body>
</html>
