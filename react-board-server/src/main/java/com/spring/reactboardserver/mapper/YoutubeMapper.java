package com.spring.reactboardserver.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.reactboardserver.vo.YoutubeVO;

@Mapper
//@MapperScan(basePackages = {"com.spring.reactboardserver.mapper"})
public interface YoutubeMapper {

	public List<YoutubeVO> fetchMovies(); //즐겨찾기 모두가져오기
	public YoutubeVO fetchMovieById(Long id);//즐겨찾기 한건가져오기
	public void addMovice(YoutubeVO youtube); //즐겨찾기 추가
	public void removeMovie(Long id);	//즐겨찾기 삭제
}
