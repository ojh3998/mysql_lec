package com.min.app03.controller;

import java.util.Arrays;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.min.app03.vo.PageVo;

@Controller
public class MvcController3 {

  @RequestMapping(value="/webdir3/main")
  public String main() {
    return "webdir3/main";
  }
  
  @RequestMapping(value="/webdir3/req1")
  public String req1() {
    return "webdir3/req1";
  }
  
  
  /*
   * Query String
   * Query String 이란 URL 의 ? 뒤에 추가된 파라미터를 의미합니다.
   */
  
  
  /*
   * Query String 처리하기 1
   * HttpServletRequest 활용하기
   * 모든 요청에 관한 정보는 HttpServletRequest 인터페이스가 담당합니다.
   * Query String 은 Parameter 형태로 HttpServletRequest 인터페이스 객체에 저장되어 있습니다.
   * getParameter() 또는 getParameterValues() 메소드를 이용해 Parameter 를 확인할 수 있습니다.
   * getParameter() 메소드는 String 을 반환하고, getParameterValues() 메소드는 String[] 을 반환합니다.
   */
  
  // Query String : sort=ASC&page=1
  @RequestMapping(value="/webdir3/req2")
  public String req2(HttpServletRequest request) {
    
    // Parameter 가 전달되면 getParameter() 메소드로 받습니다.
    String sort = request.getParameter("sort");
    
    // Parameter 는 언제나 String 타입으로 받습니다. 다른 타입으로 바꿔야 할 경우에는 추가 작업을 해야 합니다.
    int page = Integer.parseInt(request.getParameter("page"));
    
    System.out.println(sort + ", " + page);
    return "webdir3/req2";
  }
  
  // Query String : flowers=ROSE&flowers=TULIP
  @RequestMapping(value="/webdir3/req3")
  public String req3(HttpServletRequest request) {
    
    // 동일한 이름의 Parameter 가 전달되면 getParameterValues() 메소드로 받습니다.
    String[] flowers = request.getParameterValues("flowers");
    
    System.out.println(Arrays.toString(flowers));
    return "webdir3/req3";
  }
  
  // Query String : 없음
  @RequestMapping(value="/webdir3/req4")
  public String req4(HttpServletRequest request) {
    
    // 전달되지 않은 Parameter 를 꺼내면 null 이 반환됩니다.
    String sort = request.getParameter("sort");
    
    // 전달되지 않은 Parameter 에 디폴트 값을 적용할 수 있습니다.
    // Parameter page 가 전달되지 않는다면 "1"을 디폴트 값으로 사용하도록 설정해 보겠습니다.
    
    // Parameter page 를 Optional 에 담습니다. Parameter page 는 ofNullable() 메소드로 담았기 때문에 없어도 오류가 발생하지 않습니다.
    Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
    
    // Optional 에 담은 Parameter page 를 꺼냅니다. 이 때 Parameter page 가 없으면 "1" 을 꺼냅니다.
    int page = Integer.parseInt(opt.orElse("1"));
    
    System.out.println(sort + ", " + page);
    return "webdir3/req4";
  }
  
  
  /*
   * Query String 처리하기 2
   * @RequestParam Annotation 활용하기
   * 각 Parameter 마다 @RequestParam Annotation 을 추가하여 Parameter 를 직접 변수로 받을 수 있습니다.
   * Parameter 의 필수 여부와 디폴트 값 설정을 할 수 있습니다.
   * @RequestParam Annotation 은 생략도 할 수 있습니다. 생략하면 선언된 변수로 추론하여 값을 받습니다.
   */
  
  // Query String : sort=ASC
  @RequestMapping(value="/webdir3/req5")
  public String req5(
      @RequestParam(value="sort") String sort  // Parameter sort 가 전달되지 않으면 "잘못된 요청(400)" 예외가 발생합니다.
    , @RequestParam(value="page", required=false, defaultValue="1") int page // Parameter page 가 전달되지 않으면 기본 값으로 "1"을 사용합니다.
  ) {
    System.out.println(sort + ", " + page);
    return "webdir3/req5";
  }
  
  /*
   * Query String 처리하기 3
   * 커맨드 객체 활용하기
   * Parameter 를 필드로 가지고 있는 클래스 타입의 객체 (커맨드 객체)를 이용해서 Parameter 를 받을 수 있습니다.
   * 커맨드 객체에는 Setter 가 정의되어 있어야 합니다.
   */
  
  // Query String : sort=ASC&page=1
  @RequestMapping(value="/webdir3/req6")
  public String req6(PageVo pageVo) {
    System.out.println(pageVo.getSort() + ", " + pageVo.getPage());
    return "webdir3/req6";
  }
  
}
