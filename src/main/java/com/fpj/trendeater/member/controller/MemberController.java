package com.fpj.trendeater.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fpj.trendeater.admin.controller.AdminController;
import com.fpj.trendeater.admin.model.service.AdminService;
import com.fpj.trendeater.admin.model.vo.PageInfo;
import com.fpj.trendeater.board.model.vo.Scrap;
import com.fpj.trendeater.common.Pagination;
import com.fpj.trendeater.member.exception.MemberException;
import com.fpj.trendeater.member.model.service.MemberService;
import com.fpj.trendeater.member.model.vo.Member;


@SessionAttributes("loginUser")

@Controller
public class MemberController {
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@Autowired
	private AdminController aController;
	
	@Autowired
	private AdminService aService;
	
	
	//로그인폼
	@RequestMapping("loginform.me")
		public String loginform() {
			return "loginform";
			
		}
	
	
	@RequestMapping("login.me")
	public String join(@ModelAttribute("member")Member m,Model model) {
		
		
	
	
		Member loginMember = mService.login(m);

		System.out.println(bcrypt.encode(m.getPwd()));
		
		
		//로그인입력창에 입력한 비밀번호와 아이디로 검색한 회원의 암호화된 비밀번호 비교
		boolean match = bcrypt.matches(m.getPwd(),loginMember.getPwd());
		
		
		if(match) {
			model.addAttribute("loginUser",loginMember);
			return "redirect:home.do";
		} else {
			
			throw new MemberException("로그인에 실패하였습니다.");
		}
		 
		
	}
	
	//로그아웃
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		//세션무효화
		status.setComplete();
		return "redirect:home.do";
	}
	

	//회원가입폼
	@RequestMapping("joinform.me")
		public String joinform() {
			return "joinform";
			
		}	
	
	//회원가입
	@RequestMapping("join.me")
	public String join(@ModelAttribute("member")Member m, @RequestParam("address1")String address1 ,@RequestParam("address2")String address2,
										@RequestParam("year")int year,@RequestParam("month")int month,@RequestParam("date")int date,Model model) {
		
		
		//비밀번호 암호화
		String password = bcrypt.encode(m.getPwd());
		m.setPwd(password);
		
		
		Date birthday = new Date(new GregorianCalendar(year,month-1,date).getTimeInMillis());
		String address = address1 + "/" + address2;
		
		m.setBirthday(birthday);
		m.setAddress(address);
		
		
		
		 int result = mService.insertMember(m); 
	 
		 
		 if(result > 0 ) {
			 return "redirect:home.do";
			 
		 } else {
			 throw new MemberException("회원가입에 실패하였습니다.");
		 }

	
		
	}
	
	//이메일 중복확인
	@RequestMapping("emailcheck2.me")
	@ResponseBody
	public String emailcheck2(@RequestParam("email")String email){
		
		
		int res = mService.emailcheck2(email);
		
		
		String result = Integer.toString(res);
		return result;
	}
	
	//아이디 찾기 폼
	@RequestMapping("findIdform.me")
	public String findIdform() {
		return "findIdform";
		
	}	
	
	
	//아이디 찾기
	@RequestMapping("findId.me")
	public String findId(@ModelAttribute("member")Member m,Model model) {
		
		
		
		Member member = mService.findId(m);
		
		System.out.println(member);
		if(member !=null) {
		
		model.addAttribute("member",member);
	
		System.out.println(member);
		return "findId";
		} else {
			throw new MemberException("아이디 찾기에 실패하였습니다.");
			
		}
		
	} 
	
	
	
	//비밀번호 찾기 폼
	@RequestMapping("findPwdform.me")
	public String findPwdform() {
		return "findPwdform";
				
	}
	
	
	//임시 비밀번호 발급
	@RequestMapping("findPwd.me")
	@ResponseBody
	public String findPwd(@RequestParam("email")String email) {
		
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		
		String newpw="";
		
		//생성한 난수를 형변환
		newpw = Integer.toString(checkNum) + 'a' + 'A' + '!';
		
		
		System.out.println(newpw);
		
		
		String setFrom = "kdkj1234@naver.com";
		String toMail = email;
		String title = "임시 비밀번호 발급입니다";
		String content = "임시비밀번호 발급 후 비밀번호를 변경해주세요." + 
						"<br><br>" + 
						"임시 비밀번호는" + newpw + "입니다." + 
						"<br>" + 
						"임시 비밀번호로 로그인 해주세요.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");;
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			
			e.printStackTrace();
		}
		
		//새로 생성한 랜덤 비밀번호 암호화
		String newPw = bcrypt.encode(newpw);
		
		
		
		//member.vo에 newpw를 만들어주지 않아서 해쉬맵으로 보냄
		HashMap<String, String>map = new HashMap<>();
		map.put("email",email);
		map.put("newpw",newPw);
		
		int result = mService.findPwd(map);
		
		String res = Integer.toString(result);
		
		
		return res;
	
	}
	//마이페이지로
	@RequestMapping("myPageform.me")
	public String mypage() {
		return "myPage";
		
	}	
	
	
	//파일 저장소와 파일 저장설정
	public String saveFile(MultipartFile file,HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		
		String savePath = root + "\\uploadFiled";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
			
		}
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		
		String originName = file.getOriginalFilename();
		String chageName = sdf.format(new Date(System.currentTimeMillis())) + originName.substring(originName.lastIndexOf("."));
		
		String renamePath = folder + "\\" + chageName;
		
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return chageName;
		
		
	}
	
	//파일 삭제 메소드
	 public void deleteFile(String fileName, HttpServletRequest request) {
		      String root = request.getSession().getServletContext().getRealPath("resources");
		      String savePath = root + "\\buploadFiles";
		      
		      File f = new File(savePath + "\\" + fileName);//file클래스를 이용해야 다음과 같은 메소드를 활용할 수 있어
		      if(f.exists()) {
		         f.delete();
		      }//update할거니까 여기에서 먼저 지워주면 돼!
		      
		   }
	
	//내 정보 수정
	@RequestMapping("updateinfo.me")
	public String updateInfo(@ModelAttribute("member")Member m,@RequestParam("profileImg") MultipartFile uploadFile,@RequestParam(value = "newpwd")String newpwd,@RequestParam("address1")String address1 ,@RequestParam("address2")String address2,
						@RequestParam("year")int year,@RequestParam("month")int month,@RequestParam("date")int date,HttpServletRequest request,Model model) {
		 
		
		
		
		
		
		if(uploadFile != null && !uploadFile.isEmpty()){
			
			  
			
				String changeName = saveFile(uploadFile,request);
				
				m.setOriginName(uploadFile.getOriginalFilename());
				m.setChangeName(changeName);		
		}
		
		
		Date birthday = new Date(new GregorianCalendar(year,month-1,date).getTimeInMillis());
		String address = address1 + "/" + address2;
		m.setAddress(address);
		m.setBirthday(birthday);
		
		
		
		if(!newpwd.equals("")) {
		m.setPwd(bcrypt.encode(newpwd)); 
		}
	
		
		
		int result = mService.updateInfo(m);
		
		
		Member member = mService.selectMember(m);
		
		
		if(result > 0 ) {
			
			model.addAttribute("loginUser",member);
			return "redirect:home.do";
		}else {
			
			throw new MemberException("내 정보 수정에 실패하였습니다.");
		}
	
	}
	
	

		
		//이메일 인증번호 보내기
		@RequestMapping("emailcheck.me")
		@ResponseBody
		public String emailcheck(String email) throws Exception {
			
			//임의의 난수 생성
			Random random = new Random();
			int checkNum = random.nextInt(888888) + 111111;
			
		System.out.println(checkNum);
		
		String setFrom = "kdkj12345@naver.com";
		String toMail = email;
		String title = "회원가입 이메일 인증입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + 
						"<br><br>" + 
						"인증 번호는 " + checkNum + "입니다." + 
						"<br>" + 
						"해당 인증 번호를 인증번호 확인 란에 기입하여 주세요.";
		
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");;
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			
			e.printStackTrace();
		}
		
		//생성한 난수를 뷰로 보내주기 위해 String 으로 형변환 
		String num = Integer.toString(checkNum);
		return num;   
	}
		
	
		 
		 //비밀번호 일치
		 @RequestMapping("checkpwd.me")
	
		 public void checkpwd(@RequestParam("pwd")String pwd,Model model, HttpServletResponse response) {
			 
			 Member m = (Member)model.getAttribute("loginUser");
			 
			
			 boolean match = bcrypt.matches(pwd, m.getPwd());
		
				 
			try {
				PrintWriter out = response.getWriter();
				out.print(match);
			} catch (IOException e) {
				
				e.printStackTrace();
			}
				
	
		 }
		
		 
		 
		 
		 //카카오 로그인
		@RequestMapping("kakaologin.me")
		public String kakaologin(@RequestParam(value = "code", required = false) String code,Model model , HttpSession session){
			System.out.println("########" + code);
			
			
			
			String access_Token = mService.getAccessToken(code);
			System.out.println("##access_Token### : " + access_Token);
			
			HashMap<String,Object> userInfo = mService.getUserInfo(access_Token);
			System.out.println("###access_Token#### : " + access_Token);
			System.out.println("###nickname#### : " + userInfo.get("nickname"));
			System.out.println("###email#### : " + userInfo.get("email"));
			
			
			
			
			/* int result = mService.insertKakao(userInfo); */
			
			
			//일반 로그인에 있는지 확인
			int memberresult = mService.countmember(userInfo);
			//카카오 로그인에 있는지 확인
			int result = mService.countkakao(userInfo);
			if(memberresult > 0 ) {
				throw new MemberException("일반 회원가입된 이메일입니다.");
			
				
			} else if (result > 0 ) {//카톡 로그인에 데이터가 있을 경우 바로 로그인하기 
				
				Member kakaomember =  mService.selectkakao(userInfo);
				if(kakaomember == null) {
					
					throw new MemberException("로그인이 불가능한 아이디 입니다.");
				}
				session.setAttribute("access_Token", access_Token);
				model.addAttribute("loginUser",kakaomember);
				
				return "redirect:home.do";
				
			} else {//카톡 로그인에 데이터가 없을 경우 회원가입 폼으로 
				
				model.addAttribute("userInfo",userInfo);
				return "kakaojoinform";
				
			}
		} 
		 
		//카카오 회원가입
		@RequestMapping("kakaojoin.me")
		public String kakaojoin(@ModelAttribute("member")Member m, @RequestParam("address1")String address1 ,@RequestParam("address2")String address2,
				@RequestParam("year")int year,@RequestParam("month")int month,@RequestParam("date")int date,Model model) {
				
				
				//비밀번호 암호화
				String password = bcrypt.encode(m.getPwd());
				m.setPwd(password);
				
				
				Date birthday = new Date(new GregorianCalendar(year,month-1,date).getTimeInMillis());
				String address = address1 + "/" + address2;
				
				m.setBirthday(birthday);
				m.setAddress(address);
				
				
				
				int result = mService.insertkakaoMember(m); 
				
				
				if(result > 0 ) {
				return "redirect:home.do";
				
				} else {
				throw new MemberException("회원가입에 실패하였습니다.");
				}



}
		 
		//카카오 로그아웃 
		@RequestMapping("kakaologout.me")
	    public String logout(HttpSession session,SessionStatus status) {
	        String access_Token = (String)session.getAttribute("access_Token");
	        mService.unlink(access_Token);
	        
	        if(access_Token != null && !"".equals(access_Token)){
	            mService.kakaoLogout(access_Token);
	            
	            status.setComplete();
	            session.invalidate();
	        }else{
	            System.out.println("access_Token is null");
	            //return "redirect:/";
	        }
	       
	        return "redirect:home.do";
	    }
		 
		 
		//*****김대열*****//
	@RequestMapping("myApplyTaste.me")
	public ModelAndView myApplyTasteView(@RequestParam(value="page", required=false) Integer page, ModelAndView mv, HttpServletRequest request) {
		String emailId = ((Member)request.getSession().getAttribute("loginUser")).getEmail();
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("emailId", emailId);
		map.put("myApply", "myApply");
		mv = aController.getApplyPersonList(page, null, null, null, mv, map);
		
		mv.setViewName("myApplyTasteList");
		
		
		return mv;
	}
		 
	
	
	//*****박미리*****//
	
	@RequestMapping("scrapListView.me")
	public ModelAndView myScrapListView(@RequestParam(value = "page", required=false) Integer page, ModelAndView mv, HttpServletRequest request) {
		String emailId = ((Member)request.getSession().getAttribute("loginUser")).getEmail();
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		int boardLimit = 5;
		HashMap<String, Object> map = new HashMap<>();
		String table = "myScrap";
		map.put("emailId", emailId);
		map.put("myScrap", "myScrap");
		map.put("table", table);
		
		
		int listCount = aService.getListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		
		ArrayList<Scrap> list = mService.getMyScrapList(pi, map);
		
		System.out.println(pi);
		System.out.println(list);
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("scrapListView");
		} else {
			throw new MemberException("회원님의 스크랩 목록을 불러오는데 실패하였습니다.");
		}
		
		return mv;
		
	}
	
	//***김주희*****//
	//회원 탈퇴
	 @RequestMapping("deleteMember.me")
	 public String deleteMember(HttpSession session,Model model) {
		 Member member = (Member)session.getAttribute("loginUser");
		System.out.println(member);
		 int result = mService.deleteMember(member);
		 if(result > 0) {
		 return "redirect:home.do";
		 }else {
				throw new MemberException("회원 탈퇴에 실패하였습니다.");
		}
		 
	 }
//클래스 끝마침		
}



		
