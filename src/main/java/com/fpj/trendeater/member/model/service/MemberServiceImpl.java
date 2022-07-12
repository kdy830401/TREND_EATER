package com.fpj.trendeater.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpj.trendeater.admin.model.vo.PageInfo;
import com.fpj.trendeater.board.model.vo.ReviewImage;
import com.fpj.trendeater.board.model.vo.Scrap;
import com.fpj.trendeater.member.model.dao.MemberDAO;
import com.fpj.trendeater.member.model.vo.LikeScrapList;
import com.fpj.trendeater.member.model.vo.Member;
import com.fpj.trendeater.member.model.vo.PointList;
import com.fpj.trendeater.member.model.vo.ReviewList;
import com.fpj.trendeater.member.model.vo.ScrapList;
import com.fpj.trendeater.order.model.vo.OrderStatus;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service("mService")
public class MemberServiceImpl implements MemberService {
   @Autowired
   private MemberDAO mDAO;
   @Autowired
   private SqlSessionTemplate sqlSession;

@Override
public int insertMember(Member m) {
	
	return mDAO.insertMember(sqlSession,m);
}

@Override
public Member login(Member m) {
 
	return mDAO.login(sqlSession,m);
}

@Override
public Member findId(Member m) {
	
	return mDAO.findId(sqlSession,m);
}

@Override
public int findPwd(HashMap<String, String> map) {
	
	return mDAO.findPwd(sqlSession,map);
}

@Override
public int emailcheck2(String email) {
	
	return mDAO.emailcheck2(sqlSession,email);
}

@Override
public int updateInfo(Member m) {
	
	return mDAO.updateInfo(sqlSession,m);
}

@Override
public Member selectMember(Member m) {
	
	return mDAO.selectMember(sqlSession, m);
}

@Override
public String getAccessToken(String code) {
	String access_Token = "";
	String refresh_Token = "";
	String reqURL = "https://kauth.kakao.com/oauth/token";

	try {
		URL url = new URL(reqURL);
        
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
        
		conn.setRequestMethod("POST");
		conn.setDoOutput(true);
		// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
        
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		StringBuilder sb = new StringBuilder();
		sb.append("grant_type=authorization_code");
        
		sb.append("&client_id=b08a2f4e42a7d989e6672d42538b5200"); //본인이 발급받은 key
		sb.append("&redirect_uri=http://localhost:9280/trendeater/kakaologin.me"); // 본인이 설정한 주소
        
		sb.append("&code=" + code);
		bw.write(sb.toString());
		bw.flush();
        
		// 결과 코드가 200이라면 성공
		int responseCode = conn.getResponseCode();
		System.out.println("responseCode : " + responseCode);
        
		// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		String line = "";
		String result = "";
        
		while ((line = br.readLine()) != null) {
			result += line;
		}
		System.out.println("response body : " + result);
        
		// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(result);
        
		access_Token = element.getAsJsonObject().get("access_token").getAsString();
		refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
        
		System.out.println("access_token : " + access_Token);
		System.out.println("refresh_token : " + refresh_Token);
        
		br.close();
		bw.close();
	} catch (IOException e) {
		e.printStackTrace();
	}
	return access_Token;
}

public HashMap<String, Object> getUserInfo(String access_Token) {

	// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	HashMap<String, Object> userInfo = new HashMap<String, Object>();
	String reqURL = "https://kapi.kakao.com/v2/user/me";
	try {
		URL url = new URL(reqURL);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");

		// 요청에 필요한 Header에 포함될 내용
		conn.setRequestProperty("Authorization", "Bearer " + access_Token);

		int responseCode = conn.getResponseCode();
		System.out.println("responseCode : " + responseCode);

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

		String line = "";
		String result = "";

		while ((line = br.readLine()) != null) {
			result += line;
		}
		System.out.println("response body : " + result);

		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(result);

		JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
		JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

		String nickname = properties.getAsJsonObject().get("nickname").getAsString();
		String email = kakao_account.getAsJsonObject().get("email").getAsString();

		userInfo.put("nickname", nickname);
		userInfo.put("email", email);

	} catch (IOException e) {
		e.printStackTrace();
	}
	return userInfo;
}

//카톡 회원가입 있는지 확인
@Override
public int countkakao(HashMap<String, Object> userInfo) {
	
	return mDAO.countkakao(sqlSession,userInfo);
}

@Override
public int insertKakao(HashMap<String, Object> userInfo) {

	return mDAO.insertKakao(sqlSession,userInfo);
}

//일반 회원가입 있는지 확인
@Override
public int countmember(HashMap<String, Object> userInfo) {
	
	return mDAO.countmember(sqlSession,userInfo);
}

//카카오로그인 정보 가져오기
@Override
public Member selectkakao(HashMap<String, Object> userInfo) {

	return mDAO.selectkakao(sqlSession,userInfo);
}

//카카오 로그인 회원가입
@Override
public int insertkakaoMember(Member m) {
	
	return mDAO.insertkakaomember(sqlSession,m);
}

//카카오톡 로그아웃1(연결끊기 x그냥 토큰 로그아웃만)
@Override
public void kakaoLogout(String access_Token) {
	 String reqURL = "https://kapi.kakao.com/v1/user/logout";
     try {
         URL url = new URL(reqURL);
         HttpURLConnection conn = (HttpURLConnection) url.openConnection();
         conn.setRequestMethod("POST");
         conn.setRequestProperty("Authorization", "Bearer " + access_Token);

         int responseCode = conn.getResponseCode();
         System.out.println("responseCode : " + responseCode);

         BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

         String result = "";
         String line = "";

         while ((line = br.readLine()) != null) {
             result += line;
         }
         System.out.println(result);
     } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
     }
 }


	//카카오톡 로그아웃2(연결을 끊어서 다시 로그인 시 이메일과 비밀번호 입력하게만들기)
	@Override
	public void unlink(String access_Token) {
		  String reqURL = "https://kapi.kakao.com/v1/user/unlink";
		    try {
		        URL url = new URL(reqURL);
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("POST");
		        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
		        
		        int responseCode = conn.getResponseCode();
		        System.out.println("responseCode : " + responseCode);
		        
		        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        
		        String result = "";
		        String line = "";
		        
		        while ((line = br.readLine()) != null) {
		            result += line;
		        }
		        System.out.println(result);
		    } catch (IOException e) {
		        e.printStackTrace();
		    }

	
}

	//김주희:회원 탈퇴
	@Override
	public int deleteMember(Member member) {
		
		return mDAO.deleteMember(sqlSession,member);
	}

	@Override
	public ArrayList<Scrap> getMyScrapList(PageInfo pi, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mDAO.getMyScrapList(sqlSession, pi, map);
	}

	
	
	// 내가 쓴 리뷰 갯수
	@Override
	public int getReviewListCount(String email) {
		return mDAO.getReviewListCount(sqlSession, email);
	}
		
	// 내가 쓴 리뷰 리스트
	@Override
	public ArrayList<ReviewList> getReviewList(PageInfo pi, String email) {
		return mDAO.getReviewList(sqlSession, pi, email);
	}

	// 내가 좋아요한 리뷰 갯수
	@Override
	public int getReviewScrapListCount(String email) {
		return mDAO.getReviewScrapListCount(sqlSession, email);
	}

	// 내가 좋아요한 리뷰 리스트
	@Override
	public ArrayList<LikeScrapList> getReviewScrapList(PageInfo pi, String email) {
		return mDAO.getReviewScrapList(sqlSession, pi, email);
	}

	// 내가 스크랩한 게시물 갯수
	@Override
	public int getScrapListCount(String email) {
		return mDAO.getScrapListCount(sqlSession, email);
	}
	
	// 내가 스크랩한 게시물 리스트
	@Override
	public ArrayList<ScrapList> getScrapList(PageInfo pi, String email) {
		return mDAO.getScrapList(sqlSession, pi, email);
	}

	@Override
	public ArrayList getAttendCheck(String email) {
		return mDAO.getAttendCheck(sqlSession, email);
	}

	@Override
	public int insertAttendCheck(String email) {
		return mDAO.insertAttendCheck(sqlSession, email);
	}

	@Override
	public int insertAttendPoint(String email) {
		return mDAO.insertAttendPoint(sqlSession, email);
	}

	@Override
	public int deleteMyReview(int rNo) {
		return mDAO.deleteMyReview(sqlSession, rNo);
	}

	@Override
	public ArrayList<PointList> getPointList(String email) {
		return mDAO.getPointList(sqlSession, email);
	}
	
	@Override
	public int deleteLikeScrap(int lNo) {
		return mDAO.deleteLikeScrap(sqlSession, lNo);
	}

	@Override
	public int getPlusPoint(String email) {
		return mDAO.getPlusPoint(sqlSession, email);
	}

	@Override
	public int getMinusPoint(String email) {
		return mDAO.getMinusPoint(sqlSession, email);
	}

	@Override
	public String attendCheckTest(String email) {
		return mDAO.attendCheckTest(sqlSession, email);
	}
	
	@Override
	public ArrayList<ReviewImage> getReviewImageList(String email) {
		return mDAO.getReviewImageList(sqlSession, email);
	}

	@Override
	public ArrayList<ReviewImage> getScrapReviewImageList(String email) {
		return mDAO.getScrapReviewImageList(sqlSession, email);
	}

	// 주문 내역
	// 1. 페이징
	@Override
	public int getMyOrderListCount(String emailId) {
		return mDAO.getMyOrderListCount(sqlSession, emailId);
	}	

	// 2. 사용자 주문 정보 가져오기
	// 2.1 주문 내역 가져오기
	@Override
	public ArrayList<OrderStatus> getMyOrderList(String emailId, PageInfo pi) {
		return mDAO.getMyOrderList(sqlSession, emailId, pi);
	}
	
	// 3. 사용자의 전체 주문 정보 가져오기
	@Override
	public ArrayList<OrderStatus> getAllOrderList(String emailId) {
		return mDAO.getAllOrderList(sqlSession, emailId);
	}

	@Override
	public int addPoint(Member m) {
		return mDAO.addPoint(sqlSession,m);
		
	}

	@Override
	public int updatePoint(Member m) {
		return mDAO.updatePoint(sqlSession, m);
	}
}
