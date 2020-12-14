package com.hello.bms.restcontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hello.bms.entity.Member;
import com.hello.bms.repository.MemberRepository;

@RestController
@CrossOrigin("*")
@RequestMapping(value = "/rest")
public class RestMemberController {
	
	@Autowired
	MemberRepository memberRepository;

	@RequestMapping(value = "memberuseridcheck.json",method = {RequestMethod.GET,RequestMethod.POST},
			produces = {MediaType.APPLICATION_JSON_VALUE},
			consumes = {MediaType.ALL_VALUE,MediaType.APPLICATION_JSON_VALUE})
	public Map<String,Object> getMember(@RequestParam(value = "userid",defaultValue = "") String userid) {
		Member member =memberRepository.findByUserid(userid);
		int ret=0;
		if(member != null) {
			ret =1;
		}else {
			ret =0;

		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", ret);
		return map;
	}

}
