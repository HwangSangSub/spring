package com.brighten.idi.module.ncp.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.brighten.idi.module.ncp.dto.NcpDto;
import com.fasterxml.jackson.databind.ObjectMapper;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;

@Tag(name = "ncp")
@Service
@RequiredArgsConstructor
public class NcpServiceImpl implements NcpService {
	
	static final String accessKey = "3sy8TPu5Zqjzpeu21rdy";
	
	static final String secretKey = "RVDaSIDShKti0QAjOPlavHBqqELkMscZE9NX0Alo";

	@Override
	public void ncpSend(String mobile, String msg, String templateCode) {

		Map<String,Object> message = new HashMap<String, Object>();
		
		message.put("countryCode", "82");
		message.put("to", mobile);
		message.put("content", msg);
		JSONArray toArr=new JSONArray();
		String btnCheck="";
		if(templateCode.split("_").length!=1) {
			btnCheck=templateCode.split("_")[0];
			templateCode=templateCode.split("_")[1];
		}
		if(!btnCheck.equals("nobtn")) {
			if(!templateCode.equals("orderCancel")) {
				Map<String,Object> btnInfo = new HashMap<String, Object>();
				btnInfo.put("type", "WL");
				btnInfo.put("name", "주문조회");
				if(templateCode.equals("deposit"))
					btnInfo.put("name", "주문확인");
				btnInfo.put("linkMobile", "https://idikorea.com/my/myOrderList/index.do");
//			btnInfo.put("linkMobile", "https://3312-112-216-185-218.jp.ngrok.io/my/myOrderList/index.do");
				btnInfo.put("linkPc", "https://idikorea.com/my/myOrderList/index.do");
//			btnInfo.put("linkPc", "https://3312-112-216-185-218.jp.ngrok.io/my/myOrderList/index.do");
				JSONArray btnArr=new JSONArray();
				btnArr.add(btnInfo);
				message.put("buttons", btnArr);
			}
		}
		System.err.println();
		toArr.add(message);
		JSONObject map = new JSONObject();
		
		map.put("plusFriendId", "@idikorea");
		map.put("templateCode", templateCode);
		map.put("messages",toArr);
		
		
//		String msgData="{\"plusFriendId\":\"@idikorea\",\"messages\":[{\"buttons\":[{\"linkMobile\":\"https://idikorea.com/my/myOrderList/index.do\",\"name\":\"주문조회\",\"linkPc\":\"https://idikorea.com/my/myOrderList/index.do\",\"type\":\"WL\"}],\"to\":\"01025109705\",\"countryCode\":\"82\",\"content\":\"[이디코리아]\r\n한동일님의 주문이 접수되었습니다. 송금계좌를 안내해드립니다.\r\n▶ 주문번호 : 1670534154211535\r\n▶ 상품명 : \r\n▶ 결제금액 : 30400rn▶ 입금계좌 : 김광수\r\n▶ 결제기한 : 결제기한 : 2022-12-24\"}],\"templateCode\":\""+templateCode+"\"}";
		
//		System.out.println(jsonData.toJSONString());
		NcpDto urlVO = new NcpDto();
//		urlVO.setUrl("https://sens.apigw.ntruss.com/alimtalk/v2/services/ncp:kkobizmsg:kr:2946165:idikorea/templates?channelId=@idikorea");
//		urlVO.setMethod("GET");
//		urlVO.setAccessKey(accessKey);
//		urlVO.setSkKey(secretKey);
//		//urlVO.setInputData(jsonData.toJSONString());
//		urlVO.setTimestamp( timestamp);
//		urlVO.setSignature(makeSignature("/alimtalk/v2/services/ncp:kkobizmsg:kr:2946165:idikorea/templates?channelId=@idikorea", timestamp, urlVO.getMethod() , accessKey, secretKey));
//		kakaoSetting(urlVO);
		System.err.println(map.toString());
		String timestamp = Long.toString(System.currentTimeMillis());
		urlVO.setUrl("https://sens.apigw.ntruss.com/alimtalk/v2/services/ncp:kkobizmsg:kr:2946165:idikorea/messages");
		urlVO.setMethod("POST");
		urlVO.setAccessKey(accessKey);
		urlVO.setSkKey(secretKey);
		urlVO.setInputData(map.toString());
		urlVO.setTimestamp( timestamp);
		urlVO.setSignature(makeSignature("/alimtalk/v2/services/ncp:kkobizmsg:kr:2946165:idikorea/messages", timestamp, "POST" , accessKey, secretKey));
		try {
			kakaoSetting(urlVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String makeSignature(String url, String timestamp, String method, String accessKey, String secretKey) {
	    String space = " ";                    // one space
	    String newLine = "\n";                 // new line
	    

	    String message = new StringBuilder()
	        .append(method)
	        .append(space)
	        .append(url)
	        .append(newLine)
	        .append(timestamp)
	        .append(newLine)
	        .append(accessKey)
	        .toString();

	    SecretKeySpec signingKey;
	    String encodeBase64String;
		try {
			
			signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(signingKey);
			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
			
		    encodeBase64String =new String(Base64.encodeBase64(rawHmac));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			encodeBase64String = e.toString();
		}
	    

	  return encodeBase64String;
	}

public Map<String,Object> kakaoSetting(NcpDto vo) throws Exception { //map  url , skKey , method , inputData
		
		HashMap<String, Object> jsonData=null;
		HttpURLConnection conn=null;
		URL url;
		try {
			
			url = new URL(vo.getUrl());
			String inputData="";
			if(vo.getInputData()!=null)
				inputData = vo.getInputData().toString();
			
			byte[] postDataBytes = inputData.getBytes("UTF-8");
			conn = (HttpURLConnection)url.openConnection() ;
			conn.setUseCaches(false);
			conn.setDoInput(true);
			conn.setRequestMethod(vo.getMethod());
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("x-ncp-apigw-timestamp", vo.getTimestamp());
			conn.setRequestProperty("x-ncp-iam-access-key", vo.getAccessKey());
			conn.setRequestProperty("x-ncp-apigw-signature-v2", vo.getSignature());
			conn.setDoOutput(true);
			if(vo.getInputData()!=null)
				conn.getOutputStream().write(postDataBytes);
			
			try(BufferedReader br = new BufferedReader(
		    		  new InputStreamReader(conn.getInputStream(), "utf-8"))) {
				StringBuilder response = new StringBuilder();
				String responseLine = null;
				while((responseLine=br.readLine())!=null) {
					response.append(responseLine.trim());
				}
				jsonData = new ObjectMapper().readValue(response.toString(), HashMap.class) ;
				br.close();
				System.err.println("return 데이타");
				System.err.println(jsonData);
				return null;
			}
			
			
			
		}catch(Exception e) {
			
			// TODO Auto-generated catch block
			Charset charset = Charset.forName("UTF-8");
			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getErrorStream(),charset));
			String inputLine;
			StringBuffer response = new StringBuffer();
			try {
				while ((inputLine = in.readLine()) != null) {
					response.append(inputLine);
				}
				in.close();
				
				System.out.println("조회결과 : " + response.toString());
				jsonData = new ObjectMapper().readValue(response.toString(), HashMap.class) ;
				//String paymentKey=jsonData.get("paymentKey").toString(); // 새로고침시 이거 한번 태워서 확인후 취소 이벤트.. ㅇㅇ..
				return jsonData;
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		return null;
	}
}
