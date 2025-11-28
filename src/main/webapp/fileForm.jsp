<%--
  Created by IntelliJ IDEA.
  User: david
  Date: 25. 11. 25.
  Time: 오후 9:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>fileForm</title>
</head>
<body>
    <form method="post" action="fileForm_ok.jsp" enctype="multipart/form-data">
        <input type="file" name="photo"/>
        <input type="submit" value="upload"/>
    </form>
</body>
</html>
