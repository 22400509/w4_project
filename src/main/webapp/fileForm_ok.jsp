<%--
  Created by IntelliJ IDEA.
  User: david
  Date: 25. 11. 25.
  Time: 오후 9:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%
    String filename = "";
    int sizeLimit = 15 * 1024 * 1024;

    String realPath = request.getServletContext().getRealPath("upload");

    File dir = new File(realPath);
    if(!dir.exists()) dir.mkdirs();

    MultipartRequest multipartRequest = null;
    multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

    filename = multipartRequest.getFilesystemName("photo");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <% if(filename != null) { %>

    <h3>업로드 성공!</h3>
    <img src="./upload/<%= filename %>" height="400">

    <% } else { %>
    <h3>파일 업로드 실패!.</h3>
    <% } %>
</body>
</html>
