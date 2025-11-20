<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.example.w4_project01.dao.BoardDAO, org.example.w4_project01.bean.BoardVO, java.util.*"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="org.example.w4_project01.bean.BoardVO" />
<jsp:setProperty property="*" name="u"/>
<html>
<head>
    <title>게시판 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f4;
        }
        h1 {
            text-align: center;
            margin-bottom: 50px;
        }
    </style>
</head>
<body class="py-4">

<h1 class="fw-bold">게시판</h1>
<%
    BoardDAO boardDAO = new BoardDAO();
    List<BoardVO> list = boardDAO.getBoardList();
    request.setAttribute("list", list);
%>


    <div class="container bg-white p-4 rounded shadow-sm" style="max-width: 800px;">

    <div class="d-flex justify-content-end mb-3">
        <a href="write.jsp" class="btn btn-primary fw-bold">새 글 쓰기</a>
    </div>
        <table class="table table-hover">
            <thead class="table-light">
            <tr>
                <th class="text-center">번호</th>
                <th class="text-center">카테고리</th>
                <th>제목</th>
                <th class="text-center">작성자</th>
                <th class="text-center">상세</th>
                <th class="text-center">삭제</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${list}" var="u">
                <tr>
                    <td class="text-center">${u.id}</td>
                    <td class="text-center">${u.category}</td>
                    <td><a href="view.jsp?id=${u.id}" class="text-decoration-none">${u.title}</a></td>
                    <td class="text-center">${u.writer}</td>
                    <td class="text-center">
                        <a href="view.jsp?id=${u.id}" class="btn btn-secondary btn-sm">보기</a>
                    </td>
                    <td class="text-center">
                        <a href="delete_ok.jsp?id=${u.id}" class="btn btn-secondary btn-sm">삭제</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

</div>
</body>
</html>