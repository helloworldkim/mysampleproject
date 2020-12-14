package com.hello.bms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.hello.bms.entity.Board;

@Mapper
public interface BoardMapper {

	
	@Select({"SELECT * FROM BOARD"})
	public List<Board> getList();
	
	@Insert({"INSERT INTO BOARD(ID,TITLE,CONTENT,HIT,CREATED_AT,CREATED_BY) "
			+ "VALUES "
			+ "(BOARD_SEQ.NEXTVAL, #{obj.title},#{obj.content},0,sysdate,#{obj.createdBy})"})
	public void setBoard(@Param("obj") Board item);
	
	@Select({"SELECT * FROM BOARD where id =#{id}"})
	public Board getBoard(@Param("id") long id);
	
	@Update({"UPDATE BOARD SET HIT=HIT+1 WHERE ID=#{id}"})
	public int updateBoardHit(@Param("id") long id);
	
	@Update({"UPDATE BOARD SET TITLE = #{obj.title}, CONTENT=#{obj.content} WHERE ID=#{obj.id}"})
	public int setUpdateBoard(@Param("obj") Board item);
	
	@Delete({"DELETE FROM BOARD WHERE ID=#{id}"})
	public int delBoard(@Param("id") long id);

}
