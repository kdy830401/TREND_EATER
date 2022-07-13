<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>TREND EATER</title>>
	<!-- UIkit CSS & JS -->
	<link rel="stylesheet" href="${ contextPath }\resources\css\uikit\uikit.css" />
	<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>
	
	<script src="${ contextPath }\resources\js\jquery-3.6.0.min.js"></script> 
	
	<!-- 캘린더 css -->
	<link rel="stylesheet" href="${ contextPath }\resources\css\main.css"/>	
	<script src="${ contextPath }\resources\js\main.js"></script>
	
	<!-- font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

	
	
	<style>
	  *{font-family: 'Noto Sans KR'; box-sizing: border-box}
		
	  body {
	    margin: 40px 10px;
	    padding: 0;
	    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	    font-size: 14px;
	    
	    font-family: "Lato", sans-serif;
	  }
	  
/* 	  /*탭전체 아래로 내리기*/
	.tabdiv {
		margin-top: 50px;
	}
	
	/* Style the tab */
	.tab {
		float: left;
		/*   border: 1px solid #ccc; */
		/*  background-color: white; */
		width: 200px;
		height: 150px;
	}
	
	/* Style the buttons inside the tab */
	.tab button {
		display: block;
		background-color: inherit;
		color: black;
		padding-left: 16px;
		width: 200px;
		/*  border: none; */
		outline: none;
		text-align: left;
		cursor: pointer;
		transition: 0.3s;
		font-size: 14px;
		border: 1px solid #ccc;
		height: 55px;
	}
	
	/* Change background color of buttons on hover */
	.tab button:hover {
		background-color: #F5F5F5;
	}
	
	/* Create an active/current "tab button" class */
	.tab button.active {
		background-color: #F5F5F5;
	}
	
	/* Style the tab content */
	.tabcontent {
		float: top;
		padding: 0px 10px;
		/*  border: 1px solid #ccc; */
		width: 70%;
		border-left: none;
		/*  height: 500px; */
	} */
	
	  #calendar {
	    max-width: 800px;
	    margin: 0 auto;
	  }
	  .event-icon{
	   	/* width : 4vw;  */
	   	width : 50px;
	  }
	  
	  a {
	    color: #000;
	    text-decoration: none;
	    cursor: pointer;
	    /* pointer-events: none; */
	/*     font-weight: bold; */
	    }
	    
	     a:hover {
	    color: none;
	    text-decoration: none;
	    }
	    
	    .btn1{
			background-color:#FF5C58;
			border:none;
			border-radius:3px;
			height:50px;
			width:340px;
			color:white;
			font-size:18px;
			cursor:pointer;
		}
	
		.fc-day-today { background: white !important; }
		
	</style>
	
	<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		/* 출석 도장 */
		var attendList = [];
		var list = ${ list };
		for (var i = 0; i < list.length; i++) {
			attendList[i] = {start : String(list[i])};
		}
		
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	    	
	    	headerToolbar:{
	    		start: 'title',
	    	},
	    	buttonText: {
	    		today: 'today'
	    	},
	//     	initialView: 'dayGridMonth',
	//     	initialDate: '', // 초기 날짜 설정 (설정하지 않으면 오늘날짜)
	      	editable: false, // 수정가능 여부
	      	selectable: false, // 달력일자 드래그 기능
	     	businessHours: false,
	     	dayMaxEvents: true,
	     	navLinks: false,// allow "more" link when too many events
	      	locale:'en',
			events: attendList,
				eventColor : 'white',
				eventContent: {
		    	  html: '<div class="uk-text-center"><img src="${ contextPath }\\resources\\images\\attend.png" class="event-icon" /></div>',
				},          
	    	 
		    });
		
		    calendar.render();
		  });
	</script>
</head>
<body>
	<c:import url="myPageMenu.jsp"/>
	
	<div class="uk-container uk-container-small" style="text-align: center;">
		<!--  -->
		<img src="${ contextPath }\resources\images\출석 체크1.png" style="width: 640px; height: 640px;">
		<!-- 캘린더 -->
		<div id='calendar' style="text-align: center;">
			<br><br>
			<span>
	   			<button class="btn1 uk-align-center" id="check">출석체크하기</button>
			</span>
			<br><br>
		</div>

	</div>
	</div>
	
	
	
	<script>
		let today = new Date();   
		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1;  // 월
		if (month < 10) {
			month = String(0)+month;
		}
		let date = today.getDate();  // 날짜
		if (date < 10) {
			date = String(0)+date;
		}
		var today2 = String(year)+String(month)+String(date);

		$('#check').click(function() {
			var list = ${ list };
			
			var check = false;
			for (var i in list) {
				if (list[i] != today2) {
					check = false;
				} else {
					check = true;
					break;
				}
			}
			
			if (check == false){
				alert('출석체크완료!');
				location.href = "insertAttendCheck.me";
			} else {
				alert('오늘은 이미 출석체크를 하셨습니다.');
			}
			
		});
		
		
	
		

	</script>
</body>
</html>
