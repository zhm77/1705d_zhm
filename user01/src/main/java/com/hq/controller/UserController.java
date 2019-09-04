package com.hq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hq.service.UserService;

@Controller
public class UserController {

	@Resource
	private UserService userService;
	
	@RequestMapping("list.do")
	public String list(Model model,@RequestParam(value="cpage",defaultValue="1")Integer cpage,
			String mohu1
			) {
		
		Map map=new HashMap();
		map.put("mohu1", mohu1);
		// 分页 
		PageHelper.startPage(cpage,5);
		List list=userService.list(map);
		// 分页信息
		PageInfo pi=new PageInfo(list);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("map", map);
		
		
		
		
		return "list";
	}
}
