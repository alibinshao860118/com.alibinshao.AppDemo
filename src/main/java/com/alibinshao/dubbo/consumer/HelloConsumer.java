package com.alibinshao.dubbo.consumer;

import org.springframework.stereotype.Component;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibinshao.dubbo.service.IHelloService;

@Component
public class HelloConsumer {

//	@Reference(url = "dubbo://127.0.0.1:2181")
//	  private IHelloService iHelloService;
}
