package com.morlin.thor.menu.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import com.morlin.thor.menu.bean.Desk;

/**
 * 桌位dao
 * @author liu_yong
 */
@Component
public class DeskDaoImpl extends SqlSessionDaoSupport {

	@Resource
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory){
	    super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public List<Desk> queryList() {
		
		return null;
	}

	public Desk getById(String id) {
		
		return null;
	}

	public int insert(Desk desk) {
		
		return 0;
	}

	public int update(Desk desk) {
		
		return 0;
	}

	public int deleteById(String id) {
		
		return 0;
	}
	
}
