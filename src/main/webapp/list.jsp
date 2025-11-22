<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.example.w4_project01.dao.BoardDAO, org.example.w4_project01.bean.BoardVO, java.util.*"%>

<% request.setCharacterEncoding("utf-8");

%>

<jsp:useBean id="u" class="org.example.w4_project01.bean.BoardVO" />
<jsp:setProperty property="*" name="u"/>
<html>
<head>
    <title>게시판 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f4;
        }
        h1 {
            text-align: center;
            margin-bottom: 50px;
        }
        tbody{
            font-family: sans-serif;
        }
        .footer {
             font-family: sans-serif;
         }
        .py-4 {
            font-family: "Jua", sans-serif;
            font-weight: 400;
            font-style: normal;
        }


    </style>
</head>
<body class="d-flex flex-column min-vh-100 py-4">
<nav class="navbar navbar-dark mb-4 shadow-sm" style="background-color: #052c65;">
    <div class="container">
        <a class="navbar-brand fw-bold d-flex align-items-center fs-2" href="list.jsp">
            <img src="img/logo.png" width="60" height="60" class="me-2" alt="로고">에브리전전타임
        </a>
    </div>
</nav>
<div class="flex-grow-1">
<h1 class="fw-bold">메인 게시판</h1>
<%
    BoardDAO boardDAO = new BoardDAO();
    List<BoardVO> list = boardDAO.getBoardList();
    request.setAttribute("list", list);
    int virtualNum = list.size();
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
                <th class="text-center">게시일자</th>
                <th class="text-center">상세</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${list}" var="u">
                <tr>
                    <td class="text-center"><%=virtualNum--%></td>
                    <td class="text-center">${u.category}</td>
                    <td><a href="view.jsp?id=${u.id}" class="text-decoration-none">${u.title}</a></td>
                    <td class="text-center">${u.writer}</td>
                    <td class="text-center">${u.date}</td>
                    <td class="text-center">
                        <a href="view.jsp?id=${u.id}" class="btn btn-secondary btn-sm">보기</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
</div>
</div>
<div class="footer"><jsp:include page="footer.jsp" /></div>
</body>
</html>