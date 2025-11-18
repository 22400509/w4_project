package org.example.w4_project01.dao;

import org.example.w4_project01.bean.BoardVO;
import org.example.w4_project01.common.JDBCUtil;

import java.sql.*;

public class BoardDAO {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    private final String BOARD_INSERT = "insert into BOARD (title, writer,content, category) values(?,?,?,?)";

    public int insertBoard(BoardVO vo) {

            try {
                conn = JDBCUtil.getConnection();
                pstmt = conn.prepareStatement(BOARD_INSERT);
                pstmt.setString(1, vo.getTitle());
                pstmt.setString(2, vo.getWriter());
                pstmt.setString(3, vo.getContent());
                pstmt.setString(4, vo.getCategory());
                pstmt.executeUpdate();
                return 1;
            } catch (Exception e) {
                e.printStackTrace();
            }
            return 0;
    }

    public static void main(String arg[]){
        BoardVO vo = new BoardVO("글 제목입니다", "nam", "글 내용입니다", "카테고리 입니다.");
        BoardDAO dao = new BoardDAO();
        int result = dao.insertBoard(vo);
        if(result == 1){
            System.out.print("데이터 추가 완료!");
        }
    }

}

