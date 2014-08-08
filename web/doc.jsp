<%--
  Created by IntelliJ IDEA.
  User: akonshina
  Date: 07.08.14
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.ico">
    <title>Документ</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/page1.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]>
    <script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container" style="padding: 40px 15px;">
    <div class="panel panel-default pull-left" style="width: 800px;padding:20px">
        <form role="form">
            <div class="form-group">
                <label for="subject">Заголовок</label>
                <input class="form-control" id="subject" name="subject" placeholder="Введите заголовок">
            </div>
            <div class="form-group">
                <label for="data">Дата документа</label>
                <input class="form-control" id="data" name="data"placeholder="Введите дату документа">
            </div>
            <div class="form-group">
                <label for="InputFile">Содержание</label>
                <input type="file" id="InputFile">
            </div>
            <button type="submit" class="btn btn-primary">Сохранить</button>
        </form>
    </div>

</div>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
