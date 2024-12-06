package com.min.app02.ex;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Component

@RequiredArgsConstructor  // Spring Container 의 Adder / Subtractor / Multiplier / Divider 타입의 bean 이 생성자의 매개변수로 자동 주입됩니다.

@Getter
public class Calculator {
  
  private final Adder module1;
  private final Subtractor module2;
  private final Multiplier module3;
  private final Divider module4;
  
}
