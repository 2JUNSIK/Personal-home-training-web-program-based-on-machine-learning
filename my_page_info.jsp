<%@page import="com.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<title>회원정보 수정</title>


<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />

<style type="text/css">
a#MOVE_TOP_BTN {
	position: fixed;
	right: 2%;
	bottom: 50px;
	display: none;
	z-index: 999;
}

div#id02 {
	margin: 50px;
}

h2.major span {
	background-color: #fefefe;
}

id02 {
	padding-left: 50px;
	padding-right: 50px;
}

h2, div.col-12 {
	background-color: white;
}

.tr1 {
	height: 56px;
}

input {
	margin-top: 10px;
	margin-bottom: 10px;
	height: 50px;
}

td {
	text-align: center;
	vertical-align: middle;
}

#sign_upbtn {
	margin: 10px;
}
</style>
</head>
<body class="homepage is-preload">
	<%
		String id =null;
		if(session.getAttribute("uid")!=null){
			id = session.getAttribute("uid").toString();
		};
		String[] mem = {"age","gender"};	
		if(id!=null){
   			UserDAO dao = new UserDAO();
   			
   			mem = dao.getMemInfo(id);
   		}
   %>
	<c:choose>
		<c:when test="${empty visit }">
			<c:set var="visit" value="1" scope="application"></c:set>
		</c:when>
		<c:otherwise>
			<c:set var="visit" value="${visit + 1 }" scope="application"></c:set>
		</c:otherwise>
	</c:choose>

	<div id="page-wrapper">

		<!-- Header -->
		<header id="header">
			<div class="logo container">
				<div style="top: -1.7em;"">
					<!-- <p style="font-size: 50px; color: black;">이루어Gym</p> -->
					<img alt="" src="images/titleBar.png"">
				</div>
			</div>
		</header>

		<!-- Nav -->
		<nav id="nav">
			<ul>
				<div style="float: left">
					<strong>방문자 수</strong> <b>${visit }</b>
				</div>
				<li><a href="main.jsp">Home</a></li>
				<li><a href="exerciseList.jsp">운동리스트</a>
					<ul>
						<li><a href="Bochungjae.jsp">보충제</a></li>
						<li><a href="exerciseList.jsp">운동리스트</a></li>
					</ul></li>
				<li><a href="eat_list.jsp">추천식단</a></li>
				<li><a href="gym_list.jsp">헬스장 찾기</a>
					<ul>
						<li><a href="close_gym.jsp">내 주변 헬스장</a></li>
						<li><a href="gym_list.jsp">전체 헬스장리스트</a></li>
					</ul></li>
				<li class="current"><a href="my_page.jsp">마이페이지</a>
					<ul>
						<li><a href="my_page.jsp">목표달성현황</a></li>
						<li><a href="recommend_exercise.jsp">오늘의 추천운동</a></li>
						<li><a href="eat_list.jsp">오늘의 추천식단</a></li>
						<li><a href="my_page_info.jsp">내정보수정</a></li>
					</ul></li>
				<c:choose>
					<c:when test="${uid!=null }">
						<div style="float: right">
							<a href="Logout">로그아웃</a>
						</div>
						<div style="float: right">
							<a href="my_page_info.jsp">내 정보 수정</a>
						</div>
						
					</c:when>
					<c:otherwise>
						<div style="float: right">
							<a
								onclick="document.getElementById('id01').style.display='block';document.getElementById('id02').style.display='none'">로그인</a>
						</div>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>

		<!-- 로그아웃 -->
		<!-- Main -->
		<section id="main">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="content">

							<!-- Content -->

							<article class="box page-content">

								<header align="center">
									<h2>회원정보 페이지</h2>
									당신의 정보를 확인하고 수정할 수 있는 공간입니다.
									</p>

								</header>

								<section>
									<span class="image featured"><img
										src="images/bogum1.png" alt="" /></span>

									<table border="1" cellspacing="1">
										<tr class="tr1">
											<td colspan="2" bgcolor="#fffacd"><b>계정정보 수정</b></td>
										</tr>

										<tr class="tr1">
											<td>사용자 ID</td>
											<td width="450">${uid}</td>
										</tr>

										<tr>
											<td>비밀번호</td>
											<td><input type="password" name="pw" id="pass" size="15"
												maxlength="12" value=""
												style="border-radius: 8px; border: solid 1px; width: 100%"></input></td>
										</tr>

										<tr>
											<td>비밀번호 확인</td>
											<td><input type="password" name="pw2" id="passC"
												size="15" maxlength="12" value=""
												style="width: 100%; border: solid 1px; border-radius: 8px; margin-right: 40%;"></input></td>
										</tr>
										<tr>
											<td><span id="pwCheck"></span></td>
											<td>
												<button type="button" class="pwc" onclick="pwcheck()"
													style="margin-left: 62%; font-size: 0.9em; margin-bottom: 5px; padding: 0.8em 1.25em;">비밀번호
													일치확인</button>
											</td>
										</tr>
										<tr class="tr1">
											<td colspan="2" bgcolor="#fffacd"><b>개인정보 수정</b></td>
										</tr>

										<tr class="tr1">
											<td>이름</td>
											<td>${uname }</td>
										</tr>

										<tr class="tr1">
											<td>나이</td>
											<td><%=mem[1] %></td>
										</tr>

										<tr class="tr1">
											<td>성별</td>
											<td><%=mem[2] %></td>
										</tr>
										<tr>
											<td>주소</td>
											<td><input type="text" name="address" size="40"
												maxlength="30"
												style="width: 100%; border: solid 1px; border-radius: 8px; margin-right: 40%;"></td>
										</tr>

										<tr>
											<td>전화번호</td>
											<td><input type="text" name="tel" size="40"
												maxlength="30"
												style="width: 100%; border: solid 1px; border-radius: 8px; margin-right: 40%;"></td>
										</tr>

										<tr>
											<td>E-Mail</td>
											<td><input type="text" name="email" size="40"
												maxlength="30"
												style="width: 100%; border: solid 1px; border-radius: 8px; margin-right: 40%;"></td>
										</tr>

										<tr>
											<td>강도 수정</td>
											<td><input type="radio" name="burlak" value="하">하
												<input type="radio" name="burlak" value="중">중 <input
												type="radio" name="burlak" value="상">상</td>
										</tr>



									</table>
									<div id=sign_upbtn align="center">
										<button onclick="updateInfo()">수정완료</button>
										<button type="reset">변경취소</button>
										<button onclick="Del()">탈퇴</button>
									</div>

								</section>

								<!-- 명언 -->
								<section
									style="background-color: white; border-top: solid 5px #b1ddad;">
									<h2 class="major" style="margin-top: 40px; font-size: 35px">가장
										아름다운 순간은 아직 오지 않았다!</h2>

								</section>
						</div>
						<div class="col-12">

							<!-- Copyright -->
							<div id="copyright">
								<ul class="menu">
									<li>&copy; Untitled. All rights reserved</li>
									<li>Design: <a href="main.jsp">이루어Gym</a></li>
								</ul>
							</div>

						</div>
						<!-- Scripts -->
						<script src="assets/js/jquery.min.js"></script>
						<script src="assets/js/jquery.dropotron.min.js"></script>
						<script src="assets/js/jquery.scrolly.min.js"></script>
						<script src="assets/js/browser.min.js"></script>
						<script src="assets/js/breakpoints.min.js"></script>
						<script src="assets/js/util.js"></script>
						<script src="assets/js/main.js"></script>




						<script>
            // Get the modal
            var modal = document.getElementById('id01');
            
            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
         
            $(document).ready(function(){
            	
    			if(${uid==null}){
    				alert('로그인 세션이 만료되었습니다. 다시 로그인해주세요.');
    				window.location.href = "main.jsp";
    			}        	 

            });

        	function pwcheck(){
    			var pw = document.getElementById("pass");
    			var pwC = document.getElementById("passC");
    			var pass = document.getElementById("pwCheck");
    			
    			pass.style.display = "none";
    			
    			if(pw.value==""){
    				pass.innerHTML = "비밀번호 또는 비밀번호확인을 입력해주세요.";
    			}else if(pwC.value==""){
    				pass.innerHTML = "비밀번호 또는 비밀번호확인을 입력해주세요.";
    			}else if(pw.value != pwC.value){
    				pw.value = "";
    				pwC.value = "";
    				pass.innerHTML = "비밀번호와 비밀번호확인이 일치하지않습니다.";
    			}else {
    				pass.innerHTML = "비밀번호와 비밀번호확인이 일치합니다.";
    				re1 = true;
    			}
    			pass.style.display = "inline-block";
    		}
            
            function Del() {
               $.ajax({
                  url : 'Delete', //request 보낼 서버의 경로
                  type : 'get', // 메소드(get, post, put 등)
                  data : 'text', //보낼 데이터
                  success : function(data) {
                     if (data == 'success') {
                        alert('탈퇴가 완료되었습니다.')
                        window.location.href = 'main.jsp';
                     } else if (data == 'fail') {
                        alert('탈퇴가 실패되었습니다.')
                     }
                  },
                  error : function(err) {
                     //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
                  }
               });   
            }
         	
            function updateInfo(){
            	alert('update');
            	var pw = $("#pass").val();
            	var address = $("input[name=address]").val();
            	var hp = $("input[name=tel]").val();
            	var email = $("input[name=email]").val();
            	var burlak = $("input[name=burlak]").val();
            	
            	alert(address);
				var url = 'Update?pw=' + pw + '&address=' +address + '&hp=' + hp + '&email=' + email + '&burlak=' + burlak;
            	alert(url);
				$.ajax({
                     url : url, //request 보낼 서버의 경로
                     type : 'get', // 메소드(get, post, put 등)
                     data : 'text', //보낼 데이터
                     success : function(data) {
                        if (data >0) {
                           alert('회원정보 수정이 완료되었습니다.');
                           window.location.href = 'main.jsp';
                        } else {
                           alert('회원정보 수정이 실패되었습니다.');
                           window.location.href="my_page_info.jsp";
                        }
                     },
                     error : function(err) {
                        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
                     }
                  }); 
            }
         </script>
						<!— 위로 올라가기 버튼 —>

						<script>

$(function() {

$(window)

.scroll(

function() {

if ($(this)

.scrollTop() > 500) {

$(

'#MOVE_TOP_BTN')

.fadeIn();

} else {

$(

'#MOVE_TOP_BTN')

.fadeOut();

}

});



$("#MOVE_TOP_BTN")

.click(

function() {

$('html, body')

.animate(

{

scrollTop : 0

},

400);

return false;

});

});

</script>

						<a id="MOVE_TOP_BTN" href="#"><img src="images/top.png"></a>
</body>
</html>