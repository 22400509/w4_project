<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.example.w4_project01.dao.BoardDAO"%>
<%@ page import="org.example.w4_project01.bean.BoardVO" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %>
<%@ page import="org.example.w4_project01.common.FileUpload" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
    FileUpload upload = new FileUpload();
    BoardVO u = upload.uploadPhoto(request);

    BoardDAO boardDAO = new BoardDAO();

    int i = boardDAO.insertBoard(u);

    String msg = "";

    if (i == 0) {
        msg = "[에러] 데이터 추가 실패";
    } else {
        msg = "데이터 추가 성공 !";
    }
%>

<script>
    alert('<%=msg%>');

    location.href='list.jsp';
</script>