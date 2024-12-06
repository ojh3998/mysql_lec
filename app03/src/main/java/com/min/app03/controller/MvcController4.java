package com.min.app03.controller;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value="/webdir4")
@Controller
public class MvcController4 {

  @RequestMapping(value="/main")
  public String main() {
    return "webdir4/main";
  }
  
  /*
   * <form> 태그를 통해서 전달되는 모든 요청은 Query String 방식으로 처리할 수 있습니다.
   * 1. HttpServletRequest 클래스
   * 2. @RequestParam Annotation 과 변수
   * 3. 커맨드 객체(요청 파라미터를 필드로 가지고 있는 인스턴스)
   */
  
  @RequestMapping(value="/req1")
  public String req1(HttpServletRequest request) {
    
    String a = request.getParameter("a");
    int b = Integer.parseInt(request.getParameter("b"));
    String c = request.getParameter("c");
    String d = request.getParameter("d");
    String e = request.getParameter("e");
    String f = request.getParameter("f");
    
    System.out.println(a);
    System.out.println(b);
    System.out.println(c);
    System.out.println(d);
    System.out.println(e);
    System.out.println(f);
    
    return "webdir4/main";
    
  }
  
  @RequestMapping(value="/req2")
  public String req2(HttpServletRequest request) {
    
    String[] flowers = request.getParameterValues("flowers");
    
    String kbs = request.getParameter("kbs");
    String mbc = request.getParameter("mbc");
    String sbs = request.getParameter("sbs");
    
    String choice = request.getParameter("choice");
    
    System.out.println("flowers : " + Arrays.toString(flowers));
    System.out.println("kbs : " + kbs);
    System.out.println("mbc : " + mbc);
    System.out.println("sbs : " + sbs);
    System.out.println("choice : " + choice);
    
    return "webdir4/main";
    
  }
  
  @RequestMapping(value="/req3")
  public String req3(HttpServletRequest request) {
    
    String city = request.getParameter("city");
    
    String domain = request.getParameter("domain");
    
    String content = request.getParameter("content");
    
    System.out.println("city : " + city);
    System.out.println("domain : " + domain);
    System.out.println("content : " + content);
    
    return "webdir4/main";
    
  }
  
}
