package com.alibinshao.http;

import org.springframework.http.*;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.ResponseErrorHandler;
import org.springframework.web.client.RestTemplate;


public class HttpClient {

	  /**
     * 向目的URL发送post请求
     * @param url       目的url
     * @param params    发送的参数
     * @return  AdToutiaoJsonTokenData
     */
    public static String sendPostRequest(String url, MultiValueMap<String, String> params){
        RestTemplate client = new RestTemplate();
        //新建Http头，add方法可以添加参数
        HttpHeaders headers = new HttpHeaders();
        //设置请求发送方式
        HttpMethod method = HttpMethod.POST;
        // 以表单的方式提交
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        //将请求头部和参数合成一个请求
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(params, headers);
        //执行HTTP请求，将返回的结构使用String 类格式化（可设置为对应返回值格式的类）
        ResponseEntity<String> response = client.exchange(url, method, requestEntity,String .class);

        return response.getBody();
    }

    /**
     * 向目的URL发送get请求
     * @param url       目的url
     * @param params    发送的参数
     * @param headers   发送的http头，可在外部设置好参数后传入
     * @return  String
     */
    public static String sendGetRequest(String url, MultiValueMap<String, String> params,HttpHeaders headers){
        RestTemplate client = new RestTemplate();

        HttpMethod method = HttpMethod.GET;
        // 以表单的方式提交
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        //将请求头部和参数合成一个请求
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(params, headers);
        //执行HTTP请求，将返回的结构使用String 类格式化
        ResponseEntity<String> response = client.exchange(url, method, requestEntity, String.class);

        return response.getBody();
    }

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		MultiValueMap<String, String> s =  new LinkedMultiValueMap<String, String>();
		String useragent="Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36";
		s.add("User-Agent",useragent);
		s.add("Host","www.baidu.com");
		HttpHeaders headers =new HttpHeaders();
		headers.add("User-Agent",useragent);
		String baidu=sendGetRequest("https://www.baidu.com", s, headers);
		System.out.println(baidu);
	}

}
