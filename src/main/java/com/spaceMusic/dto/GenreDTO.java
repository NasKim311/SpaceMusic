package com.spaceMusic.dto;

public class GenreDTO {

	private String genre_id; 		// 장르 아이디 변수
	private String genre_name; 		// 장르 이름 변수

	// getter(), setter()
	public String getGenre_id() {
		return genre_id;
	}

	public void setGenre_id(String genre_id) {
		this.genre_id = genre_id;
	}

	public String getGenre_name() {
		return genre_name;
	}

	public void setGenre_name(String genre_name) {
		this.genre_name = genre_name;
	}

}
