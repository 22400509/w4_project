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
        .jj {
            font-family: "Jua", sans-serif;
        }


    </style>
</head>
<body class="d-flex flex-column min-vh-100 py-4">
<div class="top"><jsp:include page="top.jsp" /></div>
<div class="flex-grow-1">
<h1 class="fw-bold">메인 게시판</h1>
<%
    String key = request.getParameter("key");
    String word = request.getParameter("word");

    BoardDAO dao = new BoardDAO();

    List<BoardVO> list = dao.getBoardList(key, word);

    request.setAttribute("list", list);

    int virtualNum = list.size();
%>
    <div class="container bg-white p-4 rounded shadow-sm" style="max-width: 800px;">
        <form action="list.jsp" method="get" class="d-flex justify-content-center mb-4">

            <div class="input-group" style="max-width: 500px;">
                <select name="key" class="form-select" style="max-width: 120px;">
                    <option value="title">제목</option>
                    <option value="writer">작성자</option>
                    <option value="content">내용</option>
                </select>

                <input type="text" name="word" class="form-control" placeholder="검색어를 입력하세요"
                       value="<%= (word != null) ? word : "" %>">

                <button class="btn btn-primary" type="submit">검색</button>
                <a href="list.jsp" class="btn btn-secondary">전체보기</a>
                <a href></a>
            </div>
        </form>
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
                        <a href="view.jsp?id=${u.id}" class="btn btn-secondary btn-sm jj">보기</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
</div>
</div>
<div class="footer"><jsp:include page="bottom.jsp" /></div>
</body>
</html>