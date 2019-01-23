<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
a#MOVE_TOP_BTN {
	position: fixed;
	right: 2%;
	bottom: 50px;
	display: none;
	z-index: 999;
}

#myProgress {
	position: relative;
	width: 80%;
	height: 30px;
	background-color: rgba(21, 28, 23, 0.85);
	border-radius: 30px;
}

#myBar {
	position: absolute;
	width: 30%;
	height: 100%;
	background-color: #b1ddad;
	border-radius: 30px 0px 0px 30px;
}

#label {
	text-align: center; /* If you want to center it */
	line-height: 30px;
	/* Set the line-height to the same as the height o
   f the progress bar container, to center it vertically */
	color: white;
}

#myProgress2 {
	position: relative;
	width: 80%;
	height: 30px;
	background-color: rgba(21, 28, 23, 0.85);
	border-radius: 30px;
}

#myBar2 {
	position: absolute;
	width: 30%;
	height: 100%;
	background-color: #b1ddad;
	border-radius: 30px 0px 0px 30px;
}

#label2 {
	text-align: center; /* If you want to center it */
	line-height: 30px;
	/* Set the line-height to the same as the height of the progress bar container, to center it vertically */
	color: white;
}

#gangjo {
	font-size: 35px;
	color: rgb(74, 174, 82);
}
</style>
<title>Main_page</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="homepage is-preload">
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
				<div style="top: -1.7em;">
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
				<li class="current"><a href="main.jsp">Home</a></li>
				<li><a href="exerciseList.do">운동리스트</a>
					<ul>
						<li><a href="Bochungjae.jsp">보충제</a></li>
						<li><a href="exerciseList.do">운동리스트</a>
							<ul>
								<li><a href="exerciseList.do">전체</a>
									<ul>
										<li><a href="shou_back.do">어깨/등</a>
										<li><a href="chest.do">가슴</a>
										<li><a href="choco.do">복근</a>
										<li><a href="leg.do">다리</a>
									</ul>
							</ul></li>
					</ul></li>

				<li><a href="gym_list.jsp">헬스장 찾기</a>
					<ul>
						<li><a href="close_gym.jsp">내 주변 헬스장</a></li>
						<li><a href="gym_list.jsp">전체 헬스장리스트</a></li>
					</ul>
				</li>

				<c:choose>
					<c:when test="${uid!=null }">
						<li><a href="eat_list.jsp">추천식단</a></li>
						<li><a href="my_page.jsp">마이페이지</a>
							<ul>
								<li><a href="my_page.jsp">목표달성현황</a></li>
								<li><a href="WorkoutRoutine.do">오늘의 추천운동</a></li>
								<li><a href="my_page_info.jsp">내정보수정</a></li>
							</ul></li>
					</c:when>
				</c:choose>

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
							<a href="Sign-up.jsp">회원가입</a>
						</div>
						<div style="float: right">
							<a
								onclick="document.getElementById('id01').style.display='block';document.getElementById('id02').style.display='none'">로그인</a>
						</div>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
		<!-- Login 창 -->
		<div id="id01" class="modal">
			<form class="modal-content animate" action="Login.do" method="post">
				<div class="container">
					<label for="uname"
						style="font-size: 30px; margin-top: 10px; margin-bottom: 10px;"><b>ID</b></label>
					<input type="text" placeholder="Login Id" name="id" required>
					<label for="psw"
						style="font-size: 30px; margin-top: 10px; margin-bottom: 10px;"><b>Password</b></label>
					<input type="password" placeholder="Login Pw" name="pw" required>

					<button type="submit" style="margin-top: 20px;">Login</button>
					<label><input type="checkbox" checked="checked"
						name="remember"> 자동 로그인 </label>
				</div>

				<div class="container">
					<button type="button"
						onclick="document.getElementById('id01').style.display='none'"
						class="cancelbtn">Cancel</button>
				</div>
			</form>
		</div>


		</nav>

		<!-- Banner -->
		<section id="banner">
			<div class="content">
				<h2>당신의 행복파트너 바로, 이루어Gym 과 함께하세요</h2>
				<p></p>
				<a href="#main" class="button scrolly">Know more About Us</a>
			</div>
		</section>

		<!-- Main -->
		<section id="main">
			<div class="container">
				<div class="row gtr-200">
				

						<!-- <!-- Highlight -->
						<section class="box highlight">
							
						</section>

					</div>
					<div class="col-12" style="margin-bottom: 50px; height: 500px;">
						<h2 class="major">
							<span><b id="gangjo">달라진</b> 나를 확인하세요</span>
						</h2>


						<div id="changeMeContent" style="margin-top: 50px;">
							<div id="changePic"
								style="float: left; width: 240px; height: 340px; background-color: white;">
								<img src="images/MainBar.png" alt=""
									style="display: block; width: 100%; margin: 0 0 2em 0;">
							</div>

							<div id="changeBar"
								style="float: left; width: 800px; height: 340px; padding-top: 10px; margin-left: 40px; margin-top: 40px;">
								<div>
									<h3>날짜</h3>
									<div id="myProgress">
										<div id="myBar">
											<div id="label">10%</div>
										</div>
									</div>
								</div>

								<div>
									<h3>목표치</h3>
									<div id="myProgress2">
										<div id="myBar2">
											<div id="label2">10%</div>
										</div>
									</div>
								</div>
								<c:choose>
									<c:when test="${uname!=null }">
										<div style="margin-top:10%;margin-left: 37%;"><span style="font-size: 25px; font-style: italic;" id="BMI"></span>&nbsp;&nbsp;&nbsp;
										<span id="bmiresult" style="font-size: 25px; font-style: italic;"></span>&nbsp;&nbsp;&nbsp;
										<button id="btn_BMI" style="padding: 0.8em;font-size: 20px">BMI지수 알아보기</button></div>
									</c:when>
								</c:choose>
							</div>
						</div>
					</div>

					<div class="col-12">


						<!-- Features -->
						<section class="box features">
							<h2 class="major">
								<span> <b id="gangjo">주요</b> 컨텐츠!
								</span>
							</h2>
							<div>
								<div class="row">
									<div class="col-3 col-6-medium col-12-small">

										<!-- Feature -->
										<section class="box feature">
											<a href="exerciseList.jsp" class="image featured"><img
												src="images/pic01.jpg" alt="" /></a>
											<h3>
												<a href="exerciseList.do">운동 리스트</a>
											</h3>
											<p>초보자들에게 필요한 운동들이 나열되어 있습니다. 또한 운동화 함께 섭취할 보충제들을
												소개해놨습니다.</p>
										</section>

									</div>
									<c:choose>
										<c:when test="${uname!=null }">
											<div class="col-3 col-6-medium col-12-small">

												<!-- Feature -->
												<section class="box feature">
													<a href="eat_list.jsp" class="image featured"><img
														src="images/pic02.jpg" alt="" /></a>
													<h3>
														<a href="eat_list.jsp"> 식단 리스트</a>
													</h3>
													<p>체형별로 식단 짜기 어려우신분들 , 여기모이세요! 저희 이루어짐이 당신에게 꼭맞는 식단을
														도와줄게요</p>
												</section>

											</div>

										</c:when>
										<c:otherwise>
											<div class="col-3 col-6-medium col-12-small">

												<!-- Feature -->
												<section class="box feature">
													<a href="Sign-up.jsp" class="image featured"><img
														src="images/pic02.jpg" alt="" /></a>
													<h3>
														<a href="Sign-up.jsp"> 식단 리스트</a>
													</h3>
													<p>체형별로 식단 짜기 어려우신분들 , 여기모이세요! 저희 이루어짐이 당신에게 꼭맞는 식단을
														도와줄게요</p>
												</section>

											</div>


										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${uname!=null }">
											<div class="col-3 col-6-medium col-12-small">

												<!-- Feature -->
												<section class="box feature">
													<a href="my_page.jsp" class="image featured"><img
														src="images/pic03.jpg" alt="" /></a>
													<h3>
														<a href="my_page.jsp"> 워너비리스트</a>
													</h3>
													<p>목표를 달성하고 싶다면 당장, 여기로! 자신의 현위치를 확인할 수 있을 뿐문 아니라 타
														회원들의 목표를 통해 동기부여까지!</p>
												</section>

											</div>

										</c:when>
										<c:otherwise>
											<div class="col-3 col-6-medium col-12-small">

												<!-- Feature -->
												<section class="box feature">
													<a href="Sign-up.jsp" class="image featured"><img
														src="images/pic03.jpg" alt="" /></a>
													<h3>
														<a href="Sign-up.jsp"> 워너비리스트</a>
													</h3>
													<p>목표를 달성하고 싶다면 당장, 여기로! 자신의 현위치를 확인할 수 있을 뿐문 아니라 타
														회원들의 목표를 통해 동기부여까지!</p>
												</section>

											</div>


										</c:otherwise>
									</c:choose>


									<div class="col-3 col-6-medium col-12-small">

										<!-- Feature -->
										<section class="box feature">
											<a href="gym_list.jsp" class="image featured"><img
												src="images/pic04.jpg" alt="" /></a>
											<h3>
												<a href="gym_list.jsp"> 내집주변 헬스장 어디?</a>
											</h3>
											<p>주변의 헬스장 어디로 갈지 고민하시는 여기 모두 모이세요 좋기로 소문난 헬스 장 여기다
												모아놨습니다!</p>
										</section>


									</div>
									<c:choose>
										<c:when test="${uname!=null }">
											<div class="col-12">
												<ul class="actions">
													<li><a href="my_page.jsp" class="button large">My
															Page</a></li>
													<li><a href="main.jsp" class="button alt large">Think
															About It</a></li>
												</ul>
											</div>

										</c:when>
										<c:otherwise>
											<div class="col-12">
												<ul class="actions">
													<li><a href="Sign-up.jsp" class="button large">Join
															US</a></li>
													<li><a href="main.jsp" class="button alt large">Think
															About It</a></li>
												</ul>
											</div>


										</c:otherwise>
									</c:choose>


								</div>
							</div>
					</div>
		</section>

	</div>
	<div class="col-12">

		<!-- Blog -->
		<section class="box blog">
			<h2 class="major"></h2>
			<div>
				<div class="row">
					<div class="col-9 col-12-medium">
						<div class="content">
							<div id="memeber_list">
								<article class="box post">
									<header>
										<h3>
											<a href="#member_list"><img alt=""
												src="images/titleBar.png""></a>
										</h3>
										<p></p>
									</header>
									<a href="main.jsp" class="image featured"><img
										src="images/main_bottom.gif" alt="" /></a>
									<p align="center">
										<b style="color: #26a69a; font-size: 30px;">이루어Gym</b>에게 당신의
										아름답고 멋진 몸매를 맡겨보세요! <br> <b
											style="color: #26a69a; font-size: 30px;">이루어Gym Member</b>들의
										관리속에서 당신의 바램을 이루어보세요! 아직 아름다움은 시작되지 않았습니다. 저희와 함께 시작해보아요
									</p>
								</article>
							</div>
						</div>
					</div>
					<div class="col-3 col-12-medium" style="text-align: center;">
						<div class="sidebar">
							<ul class="divided">
								<li>
									<article class="box post-summary">
										<h3>
											<a href="#">이준식</a>
										</h3>
										<p>13학번 에너지자원공학과<br><b style="color:#009688;">Data전처리 및 분석(머신러닝)</b></p>
									</article>
								</li>
								<li>
									<article class="box post-summary">
										<h3>
											<a href="#">이충기</a>
										</h3>
										<p>12학번 경영학과<br><b style="color:#009688;">웹디자인</b></p>
									</article>
								</li>
								<li>
									<article class="box post-summary">
										<h3>
											<a href="#">정예은</a>
										</h3>
										<p>13학번 영어영문학과<br><b style="color:#009688;">웹디자인</b></p>
									</article>
								</li>
								<li>
									<article class="box post-summary">
										<h3>
											<a href="#">박상현</a>
										</h3>
										<p>14학번 물리학과<br><b style="color:#009688;">크롤링</b></p>
									</article>
								</li>
								<li>
									<article class="box post-summary">
										<h3>
											<a href="#">하수연</a>
										</h3>
										<p>15학번 소프트웨어공학과<br><b style="color:#009688;">DB</b></p>

									</article>
								</li>
							</ul>

						</div>
					</div>
				</div>
			</div>
		</section>

	</div>
	</div>
	</div>
	</section>

	<!-- Footer -->
	<footer id="footer">
		<div class="container">
			<div class="row gtr-200">
				<div class="col-12">

					<!-- About -->
					<section>
						<h2 class="major">
							<span>회사 소개</span>
						</h2>
						<p>
							이 회사는 <strong>이루어Gym</strong>이라는 헬스 도움 웹사이트로서 건강한 몸, 예쁜 몸에 도전하려는
							초보 운동자들을 위해 다양한 컨텐츠를 준비한 사이트입니다. 웹 사이트를 이용함으로써 좀 더 당당해지고 자신감 넘치는
							당신의 미래를 위해 다가가세요 :)

						</p>
					</section>

				</div>
				<div class="col-12">

					<!-- Contact -->
					<section>
						<h2 class="major">
							<span>Get in touch</span>
						</h2>
						<ul class="contact">
							<li><a class="icon fa-facebook"
								href="https://www.facebook.com/gwangjumat"><span
									class="label">Facebook</span></a></li>
							<li><a class="icon fa-instagram"
								href="https://www.instagram.com/explore/tags/%EB%8B%A4%EC%9D%B4%EC%96%B4%ED%8A%B8%EC%8B%9D%EB%8B%A8/"><span
									class="label">Instagram</span></a></li>
						</ul>
					</section>

				</div>
			</div>

			<!-- Copyright -->
			<div id="copyright">
				<ul class="menu">
					<li>&copy; Untitled. All rights reserved</li>
					<li>Design: <a href="main.jsp">이루어Gym</a></li>
				</ul>
			</div>

		</div>
	</footer>

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

      window.onclick = function(event) {
         if (event.target == modal) {
            modal.style.display = "none";
         }
      }
      
      $(document).ready(function() { 
         if(${uid=='admin'}){
            window.location.href="admin_main_page.jsp";
         }
      });
      
      $("#btn_BMI").click(function(){

			var bmi = document.getElementById('BMI');
			var result = document.getElementById('bmiresult');
			$.ajax({
				url : 'getBMI', //request 보낼 서버의 경로
				type : 'get', // 메소드(get, post, put 등)
				data : 'text', //보낼 데이터
				success : function(data) {
					var json = JSON.parse(data);
					bmi.innerHTML = json.bmi[0].BMI;
					result.innerHTML = json.bmi[0].result;
				},error : function(err) {
					
				}
			});
		});
   </script>
	<!-- <!— 위로 올라가기 버튼 —> -->

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