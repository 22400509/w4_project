package org.example.w4_project01.dao;

import org.example.w4_project01.bean.BoardVO;
import org.example.w4_project01.common.JDBCUtil;

import java.sql.*;
import java.util.*;

public class BoardDAO {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    private final String BOARD_INSERT = "insert into BOARD (title, writer,content, category, is_public) values(?,?,?,?,?)";
    private final String BOARD_LIST = "select * from BOARD order by regdate desc";
    private final String BOARD_DELETE = "delete from BOARD where id=?";
    private final String BOARD_UPDATE = "update BOARD set title=?, writer=?, content=?, category=?, is_public=? where id=?";
    private final String BOARD_GET = "select * from BOARD where id=?";
    public List<BoardVO> getBoardList() {
        List<BoardVO> list = new ArrayList<BoardVO>();
        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(BOARD_LIST);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                BoardVO one = new BoardVO();
                one.setId(rs.getInt("id"));
                one.setTitle(rs.getString("title"));
                one.setWriter(rs.getString("writer"));
                one.setContent(rs.getString("content"));
                one.setCategory(rs.getString("category"));
                one.setIs_public(rs.getString("is_public"));
                list.add(one);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int insertBoard(BoardVO vo) {

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(BOARD_INSERT);
            pstmt.setString(1, vo.getTitle());
            pstmt.setString(2, vo.getWriter());
            pstmt.setString(3, vo.getContent());
            pstmt.setString(4, vo.getCategory());
            pstmt.setString(5, vo.getIs_public());
            pstmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int deleteBoard(BoardVO vo) {
        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(BOARD_DELETE);
            pstmt.setInt(1, vo.getId());
            pstmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

//    public int updateBoard(BoardVO vo) {
//
//    }

    public BoardVO getBoard(int id) {
        BoardVO one = null;
        try{
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(BOARD_GET);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            if(rs.next()){
                one = new BoardVO();
                one.setId(rs.getInt("id"));
                one.setTitle(rs.getString("title"));
                one.setWriter(rs.getString("writer"));
                one.setContent(rs.getString("content"));
                one.setCategory(rs.getString("category"));
                one.setIs_public(rs.getString("is_public"));
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return one;
    }
    public static void main(String arg[]) {
        BoardVO vo = new BoardVO("글 제목입니다", "nam", "글 내용입니다", "카테고리 입니다.", "공개글입니다");
        BoardDAO dao = new BoardDAO();
        int result = dao.insertBoard(vo);
        if (result == 1) {
            System.out.print("데이터 추가 완료!");
        }

    }
}

