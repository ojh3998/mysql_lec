package com.min.app01.ex02;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppConfig {

  @Bean
  Adder adder() {
    return new Adder();
  }
  
  @Bean
  Subtractor subtracter() {
    return new Subtractor();
  }
  
  @Bean
  Multiplier multiplier() {
    return new Multiplier();
  }
  
  @Bean
  Divider divider() {
    return new Divider();
  }
  
  @Bean(name = "calc")
  Calculator calculator() {
    Calculator calculator = new Calculator();
    calculator.setBrand("샤프");
    calculator.setModule1(adder());
    calculator.setModule2(subtracter());
    calculator.setModule3(multiplier());
    calculator.setModule4(divider());
    return calculator;
  }
  
}
