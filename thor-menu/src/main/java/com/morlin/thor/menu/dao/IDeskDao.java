package com.morlin.thor.menu.dao;

import java.util.List;

import com.morlin.thor.menu.bean.Desk;

public interface IDeskDao {
	/** 查询所有桌位 */
	public List<Desk> queryList();
	/** 根据id查询桌位 */
    public Desk queryById(String id);
    /** 创建桌位  成功返回id 失败返回 0*/
    public int insert(Desk desk);
    /** 更新桌位  成功返回id 失败返回 0*/
    public int update(Desk desk);
    /** 根据id删除桌位    1：成功， 0：失败 */
    public int deleteById(String id);
}
