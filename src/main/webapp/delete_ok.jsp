<%@ page import="org.example.w4_project01.dao.BoardDAO" %>
<%@ page import="org.example.w4_project01.bean.BoardVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.w4_project01.common.FileUpload"%>

<%
    request.setCharacterEncoding("UTF-8");
%>

<%
    String sid = request.getParameter("id");
    if(sid != ""){
        int id = Integer.parseInt(sid);
        BoardDAO dao = new BoardDAO();
        String file = dao.getFileName(id);
        if(file != null) FileUpload.deleteFile(request, file);

        dao.deleteBoard(id);
    }
        response.sendRedirect("list.jsp");
%>
<script>
    alert("글 삭제에 실패했습니다.");
    history.back();
</script>
