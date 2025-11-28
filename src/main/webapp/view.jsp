<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.w4_project01.bean.BoardVO"%>
<%@ page import="org.example.w4_project01.dao.BoardDAO"%>

<%
  String id = request.getParameter("id");

  BoardDAO dao = new BoardDAO();
  dao.increaseView(Integer.parseInt(id)); // 조회수 증가 기능 유지
  BoardVO u = dao.getBoard(Integer.parseInt(id)); // 데이터 가져오기 유지

  // 공개/비공개 텍스트 처리 (화면 표시용)
  String isPublic = "비공개";
  if(u.getIs_public() != null && ("공개".equals(u.getIs_public()) || "on".equals(u.getIs_public()))) {
    isPublic = "공개";
  }
%>
<html>
<head>
  <title><%=u.getTitle()%></title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .post-container {
      background: white;
      padding: 50px;
      border-radius: 15px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.05);
      margin-top: 30px;
      margin-bottom: 30px;
    }
    .title-font,
    .top {
      font-family: "Jua", sans-serif;
    }
    .content-area {
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
      font-size: 1.1rem;
      line-height: 1.8;
      color: #333;
      white-space: pre-wrap;
      min-height: 200px;
    }
    /* 뱃지 스타일 */
    .category-badge {
      background-color: #e9ecef;
      color: #495057;
      padding: 5px 12px;
      border-radius: 20px;
      font-size: 0.9rem;
      font-weight: bold;
      font-family: sans-serif;
    }
    .footer-wrapper {
      font-family: sans-serif;
    }
  </style>
</head>
<body class="d-flex flex-column min-vh-100">

<div class="top"><jsp:include page="top.jsp" /></div>

<div class="flex-grow-1 container" style="max-width: 800px;">

  <div class="post-container">

    <div class="border-bottom pb-2 mb-0" style="margin-bottom: 0px !important;">
      <div class="d-flex justify-content-between align-items-center mb-3">
        <span class="category-badge"><%=u.getCategory()%></span>
        <span class="text-muted small"><%=isPublic%></span>
      </div>

      <h1 class="fw-bold mb-3 title-font" style="font-size: 2.5rem;"><%=u.getTitle()%></h1>

      <div class="d-flex align-items-center text-muted">
        <span class="fw-bold text-dark me-3"><%=u.getWriter()%></span>
        <span class="text-muted small"> <%=u.getDate()%> | 조회수: <%=u.getView()%></span>
      </div>
    </div>

    <div class="content-area">
      <% if(u.getImage() != null && !u.getImage().equals("")) { %>
      <div class="text-center mb-3" style="margin-top: -100px">
        <img src="./upload/<%=u.getImage()%>"
             class="img-fluid rounded shadow-sm"
             style="max-width: 100%; max-height: 600px;"
             alt="첨부이미지">
      </div>
      <% } %>

      <div style="margin-top: -100px"><%=u.getContent()%></div>
    </div>

    <div class="d-flex justify-content-end gap-2 mt-4 pt-3 border-top title-font">
      <a href="list.jsp" class="btn btn-outline-secondary px-4">목록으로</a>

      <a href="edit.jsp?id=<%=u.getId()%>" class="btn btn-primary px-4">수정하기</a>
      <a href="delete_ok.jsp?id=<%=u.getId()%>" class="btn btn-danger px-4" onclick="return confirm('정말 삭제 하시겠습니까?')">삭제하기</a>
    </div>

  </div>

</div>

<div class="footer-wrapper"><jsp:include page="bottom.jsp" /></div>

</body>
</html>