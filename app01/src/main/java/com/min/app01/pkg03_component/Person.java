package com.min.app01.pkg03_component;

import org.springframework.stereotype.Component;

import lombok.Getter;

@Component(value = "p")  // 이 Person 클래스는 이름이 p 인 bean 으로 만들어집니다. (디폴트 형식의 생성자를 사용합니다.)

@Getter
public class Person {
  private String name = "유저";
  private Contact contact = new Contact("010-2222-2222", "user2@min.com");
}
