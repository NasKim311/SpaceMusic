package com.spaceMusic.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.spaceMusic.dto.MusicDTO;
import com.spaceMusic.mybatis.SqlMapConfig;

public class MusicDAO {	// Music 관련 DAO

	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;

	// auto commit
	public MusicDAO() {
		sqlsession = factory.openSession(true);
	}

	// -----------------------------------------------------------------------------------------------------------------------------------------

	// 전체 음악리스트 가져오는 메소드
	public List<MusicDTO> getMusicList() {
		List<MusicDTO> MusicList = sqlsession.selectList("SpaceMusic.getMusicList");
		return MusicList;
	}

	// 장르별 음악리스트 가져오는 메소드
	public List<MusicDTO> getMusicListByGenre(int genre_id) {
		List<MusicDTO> MusicList = sqlsession.selectList("SpaceMusic.getMusicListByGenre", genre_id);
		return MusicList;
	}

	// 순위 순서대로 음악리스트 가져오는 메소드
	public List<Integer> MusicArr(int genre_id) {
		List<Integer> MusicArr = sqlsession.selectList("SpaceMusic.MusicArr", genre_id);
		return MusicArr;
	}

	// 장르별 음악ID값 가져오는 메소드
	public List<Integer> AllMusicArr() {
		List<Integer> MusicArr = sqlsession.selectList("SpaceMusic.AllMusicArr");
		return MusicArr;
	}

	// 좋아하는 노래 추가하는 하는 메소드
	public int insertLikeSong(String user_id, String music_id) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("user_id", user_id);
		datas.put("music_id", music_id);
		System.out.println("dao");
		return sqlsession.insert("SpaceMusic.insertlikesong", datas);
	}

	// 좋아하는 노래 삭제하는 메소드
	public int deleteLikeSong(String user_id, String music_id) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("user_id", user_id);
		datas.put("music_id", music_id);

		return sqlsession.delete("SpaceMusic.deletelikesong", datas);
	}

	// 좋아요 누른 음악id값을 가져오는 메소드
	public List<Integer> getlikesong(String user_id) {
		List<Integer> likesongList = sqlsession.selectList("SpaceMusic.getlikesong", user_id);
		return likesongList;
	}

	// 아이디별 좋아요 누른 음악정보 가져오는 메소드
	public List<MusicDTO> getlikesonginfo(String user_id) {
		List<MusicDTO> likesonginfo = sqlsession.selectList("SpaceMusic.getlikesonginfo", user_id);
		return likesonginfo;
	}

} // MusicDAO class
