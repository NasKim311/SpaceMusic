package com.spaceMusic.action;

public class ActionForward { 	// 경로 지정하기위한 부모클래스(action에 상속해주기 위해 만들어 놓음)

	private boolean isRedirect; // 방식
	private String path; 		// 경로

	// 기본 생성자
	public ActionForward() {
	}

	// 초기화 생성자
	public ActionForward(boolean isRedirect, String path) {
		super();
		this.isRedirect = isRedirect;
		this.path = path;
	}

	// getter(), setter()
	public boolean isRedirect() {
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

}
