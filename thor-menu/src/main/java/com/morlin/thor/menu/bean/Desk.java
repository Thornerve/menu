package com.morlin.thor.menu.bean;

import java.io.Serializable;

/**
 * 桌位
 * @author liu_yong
 *
 */
public class Desk implements Serializable{
	private static final long serialVersionUID = 1796900001374874680L;
	
	private Long id;
	/** 桌位号 */
	private Integer deskNo;
	/** 桌位状态（1：空闲，2：忙碌） */
	private Integer deskStatus;
	/** 桌位可坐人数 */
	private Integer peopleNum;
	/** 桌位真实在座人数 */
	private Integer realPeopleNum;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Integer getDeskNo() {
		return deskNo;
	}
	public void setDeskNo(Integer deskNo) {
		this.deskNo = deskNo;
	}
	public Integer getDeskStatus() {
		return deskStatus;
	}
	public void setDeskStatus(Integer deskStatus) {
		this.deskStatus = deskStatus;
	}
	public Integer getPeopleNum() {
		return peopleNum;
	}
	public void setPeopleNum(Integer peopleNum) {
		this.peopleNum = peopleNum;
	}
	public Integer getRealPeopleNum() {
		return realPeopleNum;
	}
	public void setRealPeopleNum(Integer realPeopleNum) {
		this.realPeopleNum = realPeopleNum;
	}
}
