package com.spaceMusic.dto;

public class ArtistDTO {

	private String artist_id; 			// 아티스트 아이디
	private String artist_name; 		// 아티스트 이름
	private String artist_nation;		// 아티스트 국가
	private String artist_birthday;		// 아티스트 생일
	private int artist_age; 			// 아티스트 나이
	private String debut_date; 			// 아티스트 데뷔날

	// getter(), setter()
	public String getArtist_id() {
		return artist_id;
	}

	public void setArtist_id(String artist_id) {
		this.artist_id = artist_id;
	}

	public String getArtist_name() {
		return artist_name;
	}

	public void setArtist_name(String artist_name) {
		this.artist_name = artist_name;
	}

	public String getArtist_nation() {
		return artist_nation;
	}

	public void setArtist_nation(String artist_nation) {
		this.artist_nation = artist_nation;
	}

	public String getArtist_birthday() {
		return artist_birthday;
	}

	public void setArtist_birthday(String artist_birthday) {
		this.artist_birthday = artist_birthday;
	}

	public int getArtist_age() {
		return artist_age;
	}

	public void setArtist_age(int artist_age) {
		this.artist_age = artist_age;
	}

	public String getDebut_date() {
		return debut_date;
	}

	public void setDebut_date(String debut_date) {
		this.debut_date = debut_date;
	}

}
