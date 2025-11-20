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
    BoardDAO dao = new BoardDAO();

    int result = dao.deleteBoard(vo);

    if(result == 1) {
        response.sendRedirect("list.jsp");
    } else {
%>
<script>
    alert("글 삭제에 실패했습니다.");
    history.back();
</script>
<%
    }
%>