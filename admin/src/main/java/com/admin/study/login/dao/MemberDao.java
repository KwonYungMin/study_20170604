package com.admin.study.login.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.admin.common.mybatis.QueryMapper;

@Repository
public class MemberDao extends QueryMapper {
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchAllMember(){
		return (List<Map<String, Object>>)super.selectList("member.searchAllMember");
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchMemberId(Map<String, Object> param){
		return (List<Map<String, Object>>)super.selectList("member.searchMemberId", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchMemberName(Map<String, Object> param){
		return (List<Map<String, Object>>)super.selectList("member.searchMemberName", param);
	}
	
	public int deleteMemeber(Map<String, Object> param){
		return super.delete("member.deleteMember", param);
	}
	
	public int addMemeber(Map<String, Object> param){
		return super.insert("member.addMember", param);
	}
}
