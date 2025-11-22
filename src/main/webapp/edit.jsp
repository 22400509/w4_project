<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="org.example.w4_project01.dao.BoardDAO" %>
<%@ page import="org.example.w4_project01.bean.BoardVO" %>

<%
    String id = request.getParameter("id");
    BoardDAO dao = new BoardDAO();
    BoardVO u = dao.getBoard(Integer.parseInt(id));
%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>글쓰기</title>
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
<div class="top"><jsp:include page="top.jsp" /></div>
<div class="flex-grow-1">
<h1 class="fw-bold">게시물 수정</h1>

<div class="container bg-white p-4 rounded shadow-sm" style="max-width: 700px;">

    <form action="edit_ok.jsp" method="post">
        <input type="hidden" name="id" value="<%=u.getId()%>">

        <div class="row mb-3">
            <label for="title" class="col-sm-2 col-form-label fw-bold">제목:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="title" name="title" value="<%=u.getTitle()%>"/>
            </div>
        </div>

        <div class="row mb-3">
            <label for="writer" class="col-sm-2 col-form-label fw-bold">작성자:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="writer" name="writer" value="<%=u.getWriter()%>"/>
            </div>
        </div>

        <div class="row mb-3">
            <label for="category" class="col-sm-2 col-form-label fw-bold">카테고리:</label>
            <div class="col-sm-10">
                <select class="form-select" id="category" name="category">
                    <option value="공지사항" <%=u.getCategory().equals("공지사항")?"selected":""%>>공지사항</option>
                    <option value="자유게시판" <%=u.getCategory().equals("자유게시판")?"selected":""%>>자유게시판</option>
                    <option value="질문답변" <%=u.getCategory().equals("질문답변")?"selected":""%>>질문답변</option>
                </select>
            </div>
        </div>

        <div class="row mb-3">
            <label for="content" class="col-sm-2 col-form-label fw-bold">내용:</label>
            <div class="col-sm-10">
                <textarea class="form-control" id="content" name="content" style="height: 150px;"><%=u.getContent()%>
                </textarea>
            </div>
        </div>

        <div class="row mb-3">
            <label class="col-sm-2 col-form-label fw-bold">공개글:</label>
            <div class="col-sm-10 d-flex align-items-center">

                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="isPublic" name="is_public" value="공개"
                            <%= (u.getIs_public() != null) ? "checked" : "" %> />
                    <label class="form-check-label" for="isPublic">
                        이 글을 공개로 설정합니다.
                    </label>
                </div>
            </div>
        </div>

        <hr class="my-4">

        <div class="d-grid gap-2">
            <input type="submit" class="btn btn-primary btn-lg" value="수정하기" />
        </div>

    </form>

</div>
</div>
<div class="footer"><jsp:include page="bottom.jsp" /></div>
</body>
</html>