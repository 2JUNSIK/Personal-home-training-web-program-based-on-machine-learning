<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Gym_list</title>
<style type="text/css">
a#MOVE_TOP_BTN {
	position: fixed;
	right: 2%;
	bottom: 50px;
	display: none;
	z-index: 999;
}
ul.divided a {
	text-decoration: none;
}
</style>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">
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
				<c:choose>
					<c:when test="${uname!=null }">
						<li><a href="main.jsp">Home</a></li>
						<li><a href="exerciseList.jsp">운동리스트</a>
							<ul>
								<li><a href="Bochungjae.jsp">보충제</a></li>
								<li><a href="exerciseList.jsp">운동리스트</a>
									<ul>
										<li class="current"><a href="exerciseList.jsp">전체</a>
											<ul>
												<li><a href="shou_back.jsp">어깨/등</a>
												<li><a href="chest.jsp">가슴</a>
												<li><a href="choco.jsp">복근</a>
												<li><a href="leg.jsp">다리</a>
											</ul>
									</ul></li>
							</ul></li>
						
						<li class="current"><a href="gym_list.jsp">헬스장 찾기</a>
							<ul>
								<li><a href="close_gym.jsp">내 주변 헬스장</a></li>
								<li><a href="gym_list.jsp">전체 헬스장리스트</a></li>
							</ul>
							<li><a href="eat_list.jsp">추천식단</a></li></li>

					</c:when>
					<c:otherwise>
						<li><a href="main.jsp">Home</a></li>
						<li><a href="exerciseList.jsp">운동리스트</a>
							<ul>
								<li><a href="Bochungjae.jsp">보충제</a></li>
								<li><a href="exerciseList.jsp">운동리스트</a>
									<ul>
										<li class="current"><a href="exerciseList.jsp">전체</a>
											<ul>
												<li><a href="shou_back.jsp">어깨/등</a>
												<li><a href="chest.jsp">가슴</a>
												<li><a href="choco.jsp">복근</a>
												<li><a href="leg.jsp">다리</a>
											</ul>
									</ul></li>
							</ul></li>
						<li class="current"><a href="gym_list.jsp">헬스장 찾기</a>
							<ul>
								<li><a href="Sign-up.jsp">내 주변 헬스장</a></li>
								<li><a href="gym_list.jsp">전체 헬스장리스트</a></li>
							</ul></li>


					</c:otherwise>
				</c:choose>


				<c:choose>
					<c:when test="${uname!=null }">

						<li><a href="my_page.jsp">마이페이지</a>
							<ul>
								<li><a href="my_page.jsp">목표달성현황</a></li>
								<li><a href="recommend_exercise.jsp">오늘의 추천운동</a></li>
								<li><a href="my_page_info.jsp">내정보수정</a></li>
							</ul></li>
					</c:when>
				</c:choose>

				<c:choose>
					<c:when test="${uname!=null }">
						<div style="float: right">
							<a href="Logout">로그아웃</a>
						</div>
						<div style="float: right">
							<a href="my_page_info.jsp">내 정보 수정</a>
						</div>
						<c:choose>

							<c:when test="${info.email == 'admin'}">
								<a href="Select.do">회원 관리</a>
							</c:when>
							<c:otherwise>

							</c:otherwise>
						</c:choose>
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

		<!-- 로그아웃 -->
		<!-- 회원정보수정-->

		<!-- Main -->
		<section id="main">
			<div class="container">
				<div class="row">
					<div class="col-3 col-12-medium">
						<div class="sidebar">

							<!-- Sidebar -->

							<!-- Recent Posts -->
							<section>
								<ul class="divided" align="center">
									<li>
									<c:choose>
									<c:when test="${uid!=null }">
										<article class="box post-summary">
											<a href="close_gym.jsp"><h2>내 주변 헬스장</h2></a>
										</article>
									
									</c:when>
									<c:otherwise>
										<article class="box post-summary">
											<a href="Sign-up.jsp"><h2>내 주변 헬스장</h2></a>
										</article>
									</c:otherwise>
									</c:choose>
									</li>
									<li>
										<article class="box post-summary">
											<a href="#all_gym"><h2>헬스장 리스트</h2></a>
										</article>
									</li>
								</ul>
							</section>

							<!-- Something -->
							<section align="center">
								<h2 class="major">
									<p>Etiquette in Gym</p>
								</h2>
								<a class="image featured"><img
									src="images/gym_list_side.png" alt="" /></a>
								<p>
									<span style="color: red; font-size: 20px;">1st</span><br>자신이
									사용한 기구는 제자리<br> <span style="color: red; font-size: 20px;">2nd</span><br>머신이용후
									땀의 흔적 지우기<br> <span style="color: red; font-size: 20px;">
										3rd</span><br>기구를 함께 사용하자<br> <span
										style="color: red; font-size: 20px;">4td</span><br>적정거리
									유지<br> <span style="color: red; font-size: 20px;">5td</span><br>운동
									방해 되지말자
								</p>
								<c:choose>
									<c:when test="${uname!=null }">

										<a href="my_page.jsp" class="button alt">View More</a>
									</c:when>
									<c:otherwise>
										<a href="Sign-up.jsp" class="button alt">View More</a>


									</c:otherwise>
								</c:choose>


							</section>
						</div>
					</div>
					<div class="col-9 col-12-medium imp-medium">
						<div class="content">

							<!-- Content -->

							<article class="box page-content">

								<header>
									<h2>헬스장 리스트</h2>
									<p style="font-size: 20px;">
										가장 <b style="color: #f50057; font-size: 30px;">유명한 헬스장</b>리스트!
										정확한 정보를 알고 싶다면 <a href="Sign-up.jsp" style="font-size: 30px;">회원가입</a>클릭해주는
										센스!</>
								</header>

								<section>
									<span class="image featured"><img
										src="images/gym_list.gif" alt="" /></span>
									<p style="text-align: center;">
										춥고 더운날!! 헬스장을 가는 당신의 <b
											style="color: #ff1744; font-size: 30px;">열정</b>에 응원합니다!! <br>헬스장까지
										가는 <b style="color: #ff1744; font-size: 30px;"> 어려운일</b>을
										해냈습니다!<br> 이젠 운동이라는 <b
											style="color: #ff1744; font-size: 30px;">쉬운것</b>을 해봐요!!
									</p>
								</section>
								<div id="all_gym">
									<div style="margin-top: 20%; margin-bottom: 20%;"></div>
									<hr>
									<section>
										<h2 style="text-align: center;">전체 헬스장 리스트</h2>
										<p style="font-size: 30px; text-align: center;">1위</p>
										<span class="image featured"><img
											src="images/gym_list1.gif" alt="" /></span>
										<h3>포시즌</h3>
										<p>서울특별시 종로구 새문안로 97</p>
										<h3 style="margin-left: 85%; color: #f50057; font-size: 30px;">
											<a
												href="https://www.fourseasons.com/kr/seoul/services-and-amenities/fitness/">구경하기</a>
										</h3>
										<hr>
									</section>
									<section>
										<p style="font-size: 30px; text-align: center;">2위</p>
										<span class="image featured"><img
											src="images/gym_list2.gif" alt="" /></span>
										<h3>반얀트리 클럽 앤 스파</h3>
										<p>서울특별시 중구 장충단로 60</p>
										<h3 style="margin-left: 85%; color: #f50057; font-size: 30px;">
											<a
												href="http://www.banyantreeclub.com/kr/facilities/fitness-center.asp">구경하기</a>
										</h3>
										<hr>
									</section>
									<section>
										<p style="font-size: 30px; text-align: center;">3위</p>
										<span class="image featured"><img
											src="images/gym_list3.gif" alt="" /></span>
										<h3>롯데 시그니엘</h3>
										<p>서울특별시 송파구 올림픽로 300 롯데월드타워 76-101층</p>
										<h3 style="margin-left: 85%; color: #f50057; font-size: 30px;">
											<a
												href="https://www.lottehotel.com/seoul-signiel/ko/facilities/gym.html">구경하기</a>
										</h3>
										<hr>
									</section>
									<section>
										<p style="font-size: 30px; text-align: center;">4위</p>
										<span class="image featured"><img
											src="images/gym_list4.gif" alt="" /></span>
										<h3>인터컨티넨탈 코엑스</h3>
										<p>서울특별시 강남구 봉은사로 524 인터컨티넨탈 서울 코엑스</p>
										<h3 style="margin-left: 85%; color: #f50057; font-size: 30px;">
											<a href="https://www.ihg.com/hotels/kr/ko/reservation">구경하기</a>
										</h3>
										<hr>
									</section>
									<section>
										<p style="font-size: 30px; text-align: center;">5위</p>
										<span class="image featured"><img
											src="images/gym_list5.gif" alt="" /></span>
										<h3>콘래드</h3>
										<p>서울특별시 영등포구 국제금융로10 서울 국제금융 센터</p>
										<h3 style="margin-left: 85%; color: #f50057; font-size: 30px;">
											<a href="http://www.pulse8.co.kr/">구경하기</a>
										</h3>
										<hr>
									</section>
									<section>
										<p style="font-size: 30px; text-align: center;">6위</p>
										<span class="image featured"><img
											src="images/gym_list6.png" alt="" /></span>
										<h3>쉐라톤 서울 디큐브시티</h3>
										<p>서울특별시 구로구 경인로 662 디큐브시티</p>
										<h3 style="margin-left: 85%; color: #f50057; font-size: 30px;">
											<a
												href="https://www.marriott.co.kr/hotels/hotel-information/fitness-center/seldi-sheraton-seoul-d-cube-city-hotel/">구경하기</a>
										</h3>
										<hr>
									</section>
								</div>
							</article>

						</div>
					</div>
					<div class="col-12">

						<!-- Features -->
						<section class="box features">
							<h2 class="major">
								<span> 주요 컨텐츠!</span>
							</h2>
							<c:choose>
								<c:when test="${uname!=null }">
									<div>
										<div class="row">
											<div class="col-3 col-6-medium col-12-small">

												<!-- Feature -->
												<section class="box feature">
													<a href="recommend_exercise.jsp" class="image featured"><img
														src="images/pic01.jpg" alt="" /></a>
													<h3>
														<a href="recommend_exercise.jsp">운동 리스트</a>
													</h3>
													<p>초보자들에게 필요한 운동들이 나열되어 있습니다. 또한 운동화 함께 섭취할 보충제들을
														소개해놨습니다.</p>
												</section>

											</div>
								</c:when>
								<c:otherwise>
									<div>
										<div class="row">
											<div class="col-3 col-6-medium col-12-small">

												<!-- Feature -->
												<section class="box feature">
													<a href="exerciseList.jsp" class="image featured"><img
														src="images/pic01.jpg" alt="" /></a>
													<h3>
														<a href="exerciseList.jsp">운동 리스트</a>
													</h3>
													<p>초보자들에게 필요한 운동들이 나열되어 있습니다. 또한 운동화 함께 섭취할 보충제들을
														소개해놨습니다.</p>
												</section>

											</div>
								</c:otherwise>
							</c:choose>
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
											<p>목표를 달성하고 싶다면 당장, 여기로! 자신의 현위치를 확인할 수 있을 뿐만 아니라 타 회원들의
												목표를 통해 동기부여까지!</p>
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
											<p>목표를 달성하고 싶다면 당장, 여기로! 자신의 현위치를 확인할 수 있을 뿐만 아니라 타 회원들의
												목표를 통해 동기부여까지!</p>
										</section>
									</div>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${uname!=null }">
									<div class="col-3 col-6-medium col-12-small">
										<!-- Feature -->
										<section class="box feature">
											<a href="close_gym.jsp" class="image featured"><img
												src="images/pic04.jpg" alt="" /></a>
											<h3>
												<a href="close_gym.jsp"> 내집주변 헬스장 어디?</a>
											</h3>
											<p>주변의 헬스장 어디로 갈지 고민하시는 여기 모두 모이세요 좋기로 소문난 헬스 장 여기다
												모아놨습니다!</p>
										</section>
									</div>
								</c:when>
								<c:otherwise>
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

								</c:otherwise>
							</c:choose>
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
		</section>

	</div>
	<div class="col-12">
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