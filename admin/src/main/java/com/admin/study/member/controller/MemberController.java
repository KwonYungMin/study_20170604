package com.admin.study.member.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.admin.study.login.service.LoginService;
import com.admin.study.login.service.MemberService;

@Controller
@RequestMapping(value = "/admin")
public class MemberController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/member" , method = {RequestMethod.GET,RequestMethod.POST})
    public String login(@RequestParam Map<String,Object> param , HttpSession session , Locale locale, ModelMap map) throws Exception{
        logger.info("member Page! {} , {} , {}", session.getId() , locale.getLanguage(), param.toString());
        
		
    	return "member/member_list.tiles";
    }
	
	@RequestMapping(value = "/serach" , method = {RequestMethod.GET,RequestMethod.POST})
    public void Search(@RequestParam Map<String,Object> param , HttpSession session , Locale locale, ModelMap map) throws Exception{
        
		String keyword = StringUtils.defaultString((String)param.get("keyword"), "");
		String selectItem = StringUtils.defaultString((String)param.get("selectItem"), "");
		
		System.out.println("keyword : "+keyword);
		System.out.println("selectItem : "+selectItem);
		
		List<Map<String, Object>> listAdminInfo = null;
		
		if(keyword == ""){
			System.out.println("selectItem : '', keyword : "+keyword);
			listAdminInfo = this.memberService.searchAllMember();
		}	
		else if(selectItem.equals("id")){
			System.out.println("selectItem : id, keyword : "+keyword);
			listAdminInfo = this.memberService.searchMemberId(keyword);
		} else if(selectItem.equals("name")){
			System.out.println("selectItem : name, keyword : "+keyword);
			listAdminInfo = this.memberService.searchMemberName(keyword);
		} 
		
		map.addAttribute("listAdminInfo", listAdminInfo);
    }
	
	@RequestMapping(value = "/delete" , method = {RequestMethod.GET,RequestMethod.POST})
    public void Delete(@RequestParam Map<String,Object> param , HttpSession session , Locale locale, ModelMap map) throws Exception{
        
		Map<String, Object> mapMemberId = new HashMap<String, Object>();
		Iterator<String> keys = param.keySet().iterator();
		
		boolean isEmpty = true;
		
		while(keys.hasNext()){
			String key = keys.next();
			mapMemberId.put(key, StringUtils.defaultString((String)param.get(key), ""));
			System.out.println(StringUtils.defaultString((String)param.get(key), ""));
			isEmpty = false;
		}
		
		System.out.println("Delete  완료");
		
		if(isEmpty){
			return;
		} else {
			this.memberService.deleteMemer(mapMemberId);
		}
    }
	
	@RequestMapping(value = "/add" , method = {RequestMethod.GET,RequestMethod.POST})
    public void Add(@RequestParam Map<String,Object> param , HttpSession session , Locale locale, ModelMap map) throws Exception{
        
		String addId = StringUtils.defaultString((String)param.get("addId"), "");
		String addPass = StringUtils.defaultString((String)param.get("addPass"), "");
		String addName = StringUtils.defaultString((String)param.get("addName"), "");
		String addTelNo = StringUtils.defaultString((String)param.get("addTelNo"), "");
		String addMobileNo = StringUtils.defaultString((String)param.get("addMobileNo"), "");
		
		int result = memberService.addMemer(addId, addPass, addName, addTelNo, addMobileNo);
		
		System.out.println("result : ====================== "+result);
    }
}
