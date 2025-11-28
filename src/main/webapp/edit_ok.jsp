<%@ page import="org.example.w4_project01.dao.BoardDAO" %>
<%@ page import="org.example.w4_project01.bean.BoardVO" %>
<%@ page import="org.example.w4_project01.common.FileUpload" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("UTF-8");
%>

<%
    FileUpload upload = new FileUpload();
    BoardVO u = upload.uploadPhoto(request);
    BoardDAO boardDAO = new BoardDAO();

    int i = boardDAO.updateBoard(u);

    String msg = "";

    if (i == 0) {
        msg = "[에러] 데이터 수정 실패";
    } else {
        msg = "데이터 수정 성공 !";
    }
%>

<script>
    alert('<%=msg%>');

    location.href='list.jsp';
</script>