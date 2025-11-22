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
<h1 class="fw-bold">글 상세보기</h1>

<div class="container bg-white p-4 rounded shadow-sm" style="max-width: 800px;">
  <div class="mb-2 row">
    <label class="col-sm-2 col-form-label fw-bold">제목:</label>
    <div class="col-sm-10">
      <span class="form-control-plaintext bg-light rounded px-2"><%=u.getTitle()%></span>
    </div>
  </div>
  <div class="mb-2 row">
    <label class="col-sm-2 col-form-label fw-bold">작성자:</label>
    <div class="col-sm-10">
      <span class="form-control-plaintext bg-light rounded px-2"><%=u.getWriter()%></span>
    </div>
  </div>
  <div class="mb-2 row">
    <label class="col-sm-2 col-form-label fw-bold">카테고리:</label>
    <div class="col-sm-10">
      <span class="form-control-plaintext bg-light rounded px-2"><%=u.getCategory()%></span>
    </div>
  </div>
  <% String isPublic = "비공개";
    if("공개".equals(u.getIs_public())) isPublic = "공개";
  %>
  <div class="mb-2 row">
    <label class="col-sm-2 col-form-label fw-bold">공개여부:</label>
    <div class="col-sm-10">
      <span class="form-control-plaintext bg-light rounded px-2"><%=isPublic%></span>
    </div>
  </div>



  <hr class="my-4">
  <div class="p-3 bg-light rounded post-content-display">
    <%=u.getContent()%>
  </div>

  <div class="d-flex justify-content-end gap-2 mt-4">


    <a href="edit.jsp?id=<%=u.getId()%>" class="btn btn-primary">수정하기</a>
    <a href="delete_ok.jsp?id=<%=u.getId()%>" class= "btn btn-danger">삭제하기</a>
    <a href="list.jsp" class="btn btn-secondary">목록으로</a>
  </div>

</div>
</div>
<div class="footer"><jsp:include page="footer.jsp" /></div>
</body>
</html>
