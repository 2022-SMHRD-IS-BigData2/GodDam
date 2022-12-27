package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data@AllArgsConstructor
public class BoardDTO {
	
	private int rnum;
	private int book_seq;
	private String book_id;
	private String book_pw;
	private String book_title;
	private String book_content;
	private String book_regdate;
	private String admin_id;
	private String book_type;
	private String book_img;
	private String bookcount;
	

}