package com.spring.reactboardserver.vo;

import java.time.LocalDateTime;

/*
2020.11.16 helloworld YoutubeVO추가
*/
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class YoutubeVO {

	private Long id;
	private String video_id_videoid; //유튜브 플레이 아이디
	private String video_snippet_title;
	private String video_snippet_description;
	private LocalDateTime save_date;
}
