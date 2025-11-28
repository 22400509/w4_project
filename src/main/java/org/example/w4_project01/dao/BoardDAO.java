package org.example.w4_project01.dao;

import org.example.w4_project01.bean.BoardVO;
import org.example.w4_project01.common.JDBCUtil;

import java.sql.*;
import java.util.*;

public class BoardDAO {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    private final String BOARD_INSERT = "insert into BOARD (title, writer, content, category, is_public, image) values(?,?,?,?,?,?)";
    private final String BOARD_LIST = "select * from BOARD where id=?";
    private final String BOARD_DELETE = "delete from BOARD where id=?";
    private final String BOARD_UPDATE = "update BOARD set title=?, writer=?, content=?, category=?, is_public=?, image=? where id=?";
    private final String BOARD_GET = "select * from BOARD where id=?";
    private final String BOARD_UPDATE_VIEW = "update BOARD set view=view+1 where id=?";

    public List<BoardVO> getBoardList(String key, String word, String viewOrUpdate) {
        List<BoardVO> list = new ArrayList<BoardVO>();

        try {
            conn = JDBCUtil.getConnection();

            String sql = "select * from BOARD ";

            if (word != null && !word.equals("")) {
                sql += " WHERE " + key + " LIKE '%" + word + "%' ";
            }

            if("viewL".equals(viewOrUpdate)) sql += "order by view ASC";
            else if("viewH".equals(viewOrUpdate)) sql += "order by view desc";
            else sql += "order by regdate desc";

            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            System.out.println("SQL 확인: " + sql);
            while (rs.next()) {
                BoardVO one = new BoardVO();
                one.setId(rs.getInt("id"));
                one.setTitle(rs.getString("title"));
                one.setWriter(rs.getString("writer"));
                one.setContent(rs.getString("content"));
                one.setCategory(rs.getString("category"));
                one.setIs_public(rs.getString("is_public"));
                one.setDate(rs.getString("regdate"));
                one.setImage(rs.getString("image"));
                one.setView(rs.getInt("view"));
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
            pstmt.setString(6, vo.getImage());
            pstmt.setInt(7, vo.getId());
            pstmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int deleteBoard(int id) {
        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(BOARD_DELETE);
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int updateBoard(BoardVO vo) {
        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(BOARD_UPDATE);
            pstmt.setString(1, vo.getTitle());
            pstmt.setString(2, vo.getWriter());
            pstmt.setString(3, vo.getContent());
            pstmt.setString(4, vo.getCategory());
            pstmt.setString(5, vo.getIs_public());
            pstmt.setString(6, vo.getImage());
            pstmt.setInt(7, vo.getId());
            pstmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public String getFileName(int sid) {
        String fileName = null;

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(BOARD_LIST);
            pstmt.setInt(1, sid);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                fileName = rs.getString("image");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return fileName;
    }

    public void increaseView(int sid) {
        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(BOARD_UPDATE_VIEW);
            pstmt.setInt(1, sid);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

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
                one.setImage(rs.getString("image"));
                one.setDate(rs.getString("regdate"));
                one.setView(rs.getInt("view"));
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return one;
    }

}

