package com.morlin.thor.menu.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import com.morlin.thor.menu.bean.Desk;
import com.morlin.thor.menu.dao.IDeskDao;

/**
 * 桌位dao
 * @author liu_yong
 */
@Component
public class DeskDaoImpl extends SqlSessionDaoSupport implements IDeskDao{

	public List<Desk> list() {
		// TODO Auto-generated method stub
		return null;
	}

	public Desk get(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	public int insert(Desk desk) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int update(Desk desk) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteById(String id) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
