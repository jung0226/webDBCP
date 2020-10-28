package com.bitcamp.home;

import java.util.ArrayList;
import java.util.List;

public class BoardDAO extends DBConn{
	public List<BoardVO> getAllselect(){
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {
			dbConn();
			sql="select no, userid, subject from freeboard order by no desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setUserid(rs.getString(2));
				vo.setSubject(rs.getString(3));
				
				list.add(vo);
			}
			
		}catch(Exception e) {
			System.out.println("레코드 선택에러 발생-> "+e.getMessage());
		}finally {
			dbClose();
		}
		return list;
	}
}
