<%@ page import="org.example.w4_project01.dao.BoardDAO" %>
<%@ page import="org.example.w4_project01.bean.BoardVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // 한글 깨짐 방지
    request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="vo" class="org.example.w4_project01.bean.BoardVO" />

<jsp:setProperty property="*" name="vo" />

<%
    BoardDAO boardDAO = new BoardDAO();

    int i = boardDAO.updateBoard(vo);

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