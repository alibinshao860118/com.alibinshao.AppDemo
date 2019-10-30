
package com.alibinshao.zhonghong.fdp.sys.interceptor;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.NamedThreadLocal;
import org.springframework.http.HttpHeaders;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

import com.alibinshao.zhonghong.fdp.common.service.BaseService;
import com.alibinshao.zhonghong.fdp.common.utils.DateUtils;
import com.alibinshao.zhonghong.fdp.common.utils.RequestUtil;
import com.alibinshao.zhonghong.fdp.sys.utils.LogUtils;


/**
 * 日志拦截器
 * @author gulong
 * @version 2014-8-19
 */
public class LogInterceptor extends BaseService implements HandlerInterceptor {

	private static final ThreadLocal<Long> startTimeThreadLocal =
			new NamedThreadLocal<Long>("ThreadLocal StartTime");
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler) throws Exception {
		if (log.isInfoEnabled()){
			long beginTime = System.currentTimeMillis();//1、开始时间  
	        startTimeThreadLocal.set(beginTime);		//线程绑定变量（该数据只有当前请求的线程可见）  
	        log.info(String.format("开始计时: %s  URI: %s", new SimpleDateFormat("hh:mm:ss.SSS").format(beginTime), request.getRequestURI()));
		} 
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, 
			ModelAndView modelAndView) throws Exception {
		if (modelAndView != null){
			log.info("ViewName: " + modelAndView.getViewName());
		}else{
			if(!RequestUtil.isAjaxRequest(request)){
				NoHandlerFoundException ex = new NoHandlerFoundException(request.getMethod(),request.getRequestURI(),new HttpHeaders());
				
				//log.error("",ex);
				//throw ex;
			}
		}
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, 
			Object handler, Exception ex) throws Exception {

		// 保存日志
		LogUtils.saveLog(request, handler, ex, null);
		
		// 打印JVM信息。
		if (log.isInfoEnabled()){
			long beginTime = startTimeThreadLocal.get();//得到线程绑定的局部变量（开始时间）  
			long endTime = System.currentTimeMillis(); 	//2、结束时间  
			log.info(String.format("计时结束：%s  耗时：%s  URI: %s  最大内存: %sm  已分配内存: %sm  已分配内存中的剩余空间: %sm  最大可用内存: %sm",
	        		new SimpleDateFormat("hh:mm:ss.SSS").format(endTime), DateUtils.formatDateTime(endTime - beginTime),
					request.getRequestURI(), Runtime.getRuntime().maxMemory()/1024/1024, Runtime.getRuntime().totalMemory()/1024/1024, Runtime.getRuntime().freeMemory()/1024/1024, 
					(Runtime.getRuntime().maxMemory()-Runtime.getRuntime().totalMemory()+Runtime.getRuntime().freeMemory())/1024/1024)); 
		}
		
	}

}
