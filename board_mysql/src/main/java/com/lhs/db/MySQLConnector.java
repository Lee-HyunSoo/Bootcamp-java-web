package com.lhs.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.lhs.dao.BoardDAO;

public class MySQLConnector {

	private String driver = "com.mysql.cj.jdbc.Driver";
	private String db_name = "team1_board";
	private String url = "jdbc:mysql://localhost:3306/"+ db_name +"?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
	private String id_mysql = "root";
	private String pw_mysql = "0000";
	
	public Connection conn = null; // MySQL 접속 결과(상태) 저장
	
	public MySQLConnector() {
		connectMySQL();
	}
	
	public void connectMySQL() {
		try {
			Class.forName(driver);
			System.out.println("driver load 성공");
			conn = DriverManager.getConnection(url, id_mysql, pw_mysql);
			System.out.println("MySQL 접속 성공");
			
		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException: " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("SQLException: " + e.getMessage());
		}
	}
	
	public ArrayList<BoardDAO> selectAllList() {
		ArrayList<BoardDAO> boards = new ArrayList<BoardDAO>();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from board");
			
			while (rs.next()) {
				BoardDAO board = new BoardDAO();
				board.setNum(rs.getInt("NUM"));
				board.setSubject(rs.getString("SUBJECT"));
				board.setWriter(rs.getString("WRITER"));
				board.setContents(rs.getString("CONTENTS"));
				board.setHit(rs.getInt("HIT"));
				board.setIp(rs.getString("IP"));
				board.setReg_date(rs.getString("REG_DATE"));
				board.setMod_date(rs.getString("MOD_DATE"));
				boards.add(board);
			}
		} catch (SQLException e) {
			System.out.println("SQLException: " + e.getMessage());
		} finally {
			close(stmt, rs);
		}
		return boards;
	}
	
	public ArrayList<BoardDAO> searchKeyword(String search, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println(search);
		String searchKeywordQuery  = "select * from board where "+ search +" like concat ('%', ?, '%') order by NUM desc";	
		
		ArrayList<BoardDAO> boards = new ArrayList<BoardDAO>();;
		try {
			pstmt = conn.prepareStatement(searchKeywordQuery);
			pstmt.setString(1, keyword);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("NUM");
				String subject = rs.getString("SUBJECT");
				String writer = rs.getString("WRITER");
				String contents = rs.getString("CONTENTS");
				int hit = rs.getInt("HIT");
				String ip = rs.getString("IP");
				String reg_date = rs.getString("REG_DATE");
				String mod_date = rs.getString("MOD_DATE");
				
				boards.add(new BoardDAO(num, subject, writer, contents, hit, ip, reg_date, mod_date));
			}
			
		} catch (SQLException e) {
			System.out.println("showAllList ERR : " + e.getMessage());
		}
		return boards;
		}
	
	public BoardDAO selectDetailPage(int num) {
		BoardDAO board = new BoardDAO();
		String query = "select * from  board where NUM = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				board.setNum(rs.getInt("NUM"));
				board.setSubject(rs.getString("SUBJECT"));
				board.setWriter(rs.getString("WRITER"));
				board.setContents(rs.getString("CONTENTS"));
				board.setHit(rs.getInt("HIT"));
				board.setIp(rs.getString("IP"));
				board.setReg_date(rs.getString("REG_DATE"));
				board.setMod_date(rs.getString("MOD_DATE"));
			}
		} catch (SQLException e) {
			System.out.println("SQLException: " + e.getMessage());
		} finally {
			close(pstmt, rs);
		}
		return board;
	}
	
	public void updateHitCount(int num) { // 테이블 데이터 수정
		String query = "update board set HIT = HIT + 1 where NUM = ?";
		
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQLException: " + e.getMessage());
		} finally {
			close(pstmt);
		}
	}
	
	public void insertNewContents(BoardDAO board) { // 테이블에 데이터 삽입(추가)
		String query = "insert into board values (null, ?, ?, ?, ?, ?, now(), now())";
		
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, board.getSubject());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getContents());
			pstmt.setInt(4, board.getHit());
			pstmt.setString(5, board.getIp());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQLException: " + e.getMessage());
		} finally {
			close(pstmt);
		}
	}
	

	//수정 페이지에서 새롭게 수정된 게시글을 테이블에 넣는 메소드
	public BoardDAO selectModifyData(int num) {
		PreparedStatement psmt = null;
		ResultSet rs = null;
		BoardDAO board = new BoardDAO();
		String boardmodify_doget_query = "select * from board where num = ?";
		try {
			psmt = conn.prepareStatement(boardmodify_doget_query);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			while (rs.next()) {
				board.setNum(rs.getInt("NUM"));
				board.setSubject(rs.getString("SUBJECT"));
				board.setWriter(rs.getString("WRITER"));
				board.setContents(rs.getString("CONTENTS"));
				board.setHit(rs.getInt("HIT"));
				board.setIp(rs.getString("IP"));
				board.setReg_date(rs.getString("REG_DATE"));
				board.setMod_date(rs.getString("MOD_DATE"));
			}
		} catch (SQLException e) {
			System.out.println("SQLException in doGet() : "+e.getMessage());
		} finally {
			close(psmt, rs);
		}
		
		return board;
	}
	
	public void updateModifyData(int num, String subject, String writer, String contents) {
		PreparedStatement psmt = null;
		
		String boardmodify_dopost_query = "UPDATE board set SUBJECT = ?, WRITER = ?, CONTENTS = ?, MOD_DATE = now() where num = ?";
        try { 
			psmt = conn.prepareStatement(boardmodify_dopost_query);
			psmt.setString(1, subject);
			psmt.setString(2, writer);
			psmt.setString(3, contents);
			psmt.setInt(4, num);
			psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQLException in doPost() : "+e.getMessage());
		} finally {
			close(psmt);
		}
	}
	
	public void deleteBoard(int num) {
		String query = "delete from board where NUM = ?";
		
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQLException: " + e.getMessage());
		} finally {
			close(pstmt);
		}
	}
	
	public void close(Statement stmt, ResultSet rs) {
		try {
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			System.out.println("Close SQLException: " + e.getMessage());
		}
	}
	
	public void close(PreparedStatement pstmt) {
		try {
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("Close SQLException: " + e.getMessage());
		}
	}
	
	public void close(PreparedStatement pstmt, ResultSet rs) {
		try {
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("Close SQLException: " + e.getMessage());
		}
	}

}