<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.w4_project01.bean.BoardVO"%>
<%@ page import="org.example.w4_project01.dao.BoardDAO"%>

<%
  String id = request.getParameter("id");

  BoardDAO dao = new BoardDAO();
  BoardVO u = dao.getBoard(Integer.parseInt(id));
  %>
<html>
<head>
  <title>글 상세보기</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f4f4f4;
    }
    h1 {
      text-align: center;
      margin-bottom: 50px;
    }
    .post-content-display {
      min-height: 200px;
    }
  </style>
</head>
<body class="py-4">

<h1 class="fw-bold">글 상세보기</h1>

<div class="container bg-white p-4 rounded shadow-sm" style="max-width: 800px;">
  <div class="mb-2 row">
    <label class="col-sm-2 col-form-label fw-bold">번호:</label>
    <div class="col-sm-10">
      <span class="form-control-plaintext bg-light rounded px-2"><%=u.getId()%></span>
    </div>
  </div>
  <div class="mb-2 row">
    <label class="col-sm-2 col-form-label fw-bold">카테고리:</label>
    <div class="col-sm-10">
      <span class="form-control-plaintext bg-light rounded px-2"><%=u.getCategory()%></span>
    </div>
  </div>
  <div class="mb-2 row">
    <label class="col-sm-2 col-form-label fw-bold">작성자:</label>
    <div class="col-sm-10">
      <span class="form-control-plaintext bg-light rounded px-2"><%=u.getWriter()%></span>
    </div>
  </div>
  <div class="mb-2 row">
    <label class="col-sm-2 col-form-label fw-bold">제목:</label>
    <div class="col-sm-10">
      <span class="form-control-plaintext bg-light rounded px-2"><%=u.getTitle()%></span>
    </div>
  </div>

  <hr class="my-4">
  <div class="p-3 bg-light rounded post-content-display">
    <%=u.getContent()%>
  </div>

  <div class="d-flex justify-content-end gap-2 mt-4">


    <a href="edit.html" class="btn btn-primary">수정하기</a>
    <a href="delete_ok.jsp?id=<%=u.getId()%>" class= "btn btn-danger">삭제하기</a>
    <a href="list.jsp" class="btn btn-secondary">목록으로</a>
  </div>

</div>


</body>
</html>
