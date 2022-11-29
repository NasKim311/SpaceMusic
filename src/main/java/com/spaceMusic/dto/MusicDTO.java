package com.spaceMusic.dto;

public class MusicDTO {

	private String music_id; 		// 음악 id
	private String music_name;		// 음악 제목
	private String music_time;		// 음악 시간(00:00)
	private int music_count;		// 음악 조회수(사용안함)
	private String artist_name;		// 해당 가수 이름
	private String music_source;	// 해당 노래 유튜브 data
	private int genre_id;			// 해당 노래 장르 id (FK)

	// getter(), setter()
	public String getMusic_id() {
		return music_id;
	}

	public void setMusic_id(String music_id) {
		this.music_id = music_id;
	}

	public String getMusic_name() {
		return music_name;
	}

	public void setMusic_name(String music_name) {
		this.music_name = music_name;
	}

	public String getMusic_time() {
		return music_time;
	}

	public void setMusic_time(String music_time) {
		this.music_time = music_time;
	}

	public int getMusic_count() {
		return music_count;
	}

	public void setMusic_count(int music_count) {
		this.music_count = music_count;
	}

	public String getArtist_name() {
		return artist_name;
	}

	public void setArtist_name(String artist_name) {
		this.artist_name = artist_name;
	}

	public String getMusic_source() {
		return music_source;
	}

	public void setMusic_source(String music_source) {
		this.music_source = music_source;
	}

	public int getGenre_id() {
		return genre_id;
	}

	public void setGenre_id(int genre_id) {
		this.genre_id = genre_id;
	}
}