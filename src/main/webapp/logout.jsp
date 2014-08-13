<%--
  Created by IntelliJ IDEA.
  User: akonshina
  Date: 11.08.14
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    session.removeAttribute("curUser");
%>
<html>
<body>
<c:redirect url="index.jsp"/>
</body>
</html>
