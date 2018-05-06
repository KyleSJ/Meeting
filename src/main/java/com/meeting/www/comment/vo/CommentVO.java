package com.meeting.www.comment.vo;

public class CommentVO {

	private int commentId;
	private int commmunityId;
	private String nickname;
	private String body;

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public int getCommmunityId() {
		return commmunityId;
	}

	public void setCommmunityId(int commmunityId) {
		this.commmunityId = commmunityId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

}
