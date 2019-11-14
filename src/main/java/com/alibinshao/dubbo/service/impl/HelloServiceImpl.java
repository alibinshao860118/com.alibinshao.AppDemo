package com.alibinshao.dubbo.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.alibaba.dubbo.config.annotation.Service;
import com.alibinshao.dubbo.service.IHelloService;

@Service(interfaceClass = IHelloService.class)
@Component
public class HelloServiceImpl implements IHelloService{

	@Override
	public List<String> getPermissions(Long id) {
		List<String> demo = new ArrayList<String>();
        demo.add(String.format("Permission_%d", id - 1));
        demo.add(String.format("Permission_%d", id));
        demo.add(String.format("Permission_%d", id + 1));
        return demo;
	}

}
