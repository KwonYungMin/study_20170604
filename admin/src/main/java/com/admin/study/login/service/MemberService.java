package com.admin.study.login.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.study.login.dao.MemberDao;

@Service
public class MemberService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
//	
	@Autowired
	private MemberDao memberDao;
	
	public List<Map<String, Object>> searchAllMember(){
		
		return memberDao.searchAllMember(); 
	}
	
	public List<Map<String, Object>> searchMemberId(String id){
		
		if(StringUtils.isEmpty(id)){
			return null;
		}
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("ADMIN_ID", id);
		
		return memberDao.searchMemberId(param); 
	}
	
	public List<Map<String, Object>> searchMemberName(String name){
		
		if(StringUtils.isEmpty(name)){
			return null;
		}
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("ADMIN_NM", name);
		
		return memberDao.searchMemberName(param); 
	}
	
	public int deleteMemer(Map<String, Object> mapMemberId){
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("MEMBER_ID", mapMemberId);
		
		return memberDao.deleteMemeber(param); 
	}
	
	public int addMemer(String id, String pass, String name, String tel_No, String Mobile_No){
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("MEMBER_ID", id);
		param.put("MEMBER_PWD", pass);
		param.put("MEMBER_NM", name);
		param.put("TEL_NO", tel_No);
		param.put("MOBILE_NO", Mobile_No);
		
		return memberDao.addMemeber(param); 
	}
}
