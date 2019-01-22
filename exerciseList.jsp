<%@page import="com.model.WorkOutDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<!--
	TXT by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Exercise_list</title>
<style type="text/css">
.workout {
	width: 100%;
}

.workoutvideo {
	margin-left: 170px;
	width: 70%;
}

.routinedesc {
	margin-left: 150px;
	font-family: 나눔고딕;
	width: 100%;
	font-size: 30px;
	margin: 10px;
}

a#MOVE_TOP_BTN {
	position: fixed;
	right: 2%;
	bottom: 50px;
	display: none;
	z-index: 999;
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

				<c:choose>
					<c:when test="${uid == 'admin' }">
						<li><a href="UserInfo1.do">회원관리</a>
							<ul>
								<li><a href="UserInfo1.do">회원정보</a></li>
								<li><a href="UserInfo2.do">회원목표정보</a></li>
								<li><a href="eat_list.jsp">회원추천식단</a></li>
								<li><a href="recommend_exercise.jsp">회원추천운동리스트</a>
								<li><a href="exerciseList.jsp">전체운동리스트</a></li>
							</ul></li>
					</c:when>
					<c:when test="${uid!=null }">
						<li><a href="main.jsp">Home</a></li>
						<li class="current"><a href="exerciseList.jsp">운동리스트</a>
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
							</ul>
						</li>
						<li><a href="gym_list.jsp">헬스장 찾기</a>
							<ul>
								<li><a href="close_gym.jsp">내 주변 헬스장</a></li>
								<li><a href="gym_list.jsp">전체 헬스장리스트</a></li>
							</ul></li>
						<li><a href="eat_list.jsp">추천식단</a></li>
						<li><a href="my_page.jsp">마이페이지</a>
							<ul>
								<li><a href="my_page.jsp">목표달성현황</a></li>
								<li><a href="recommend_exercise.jsp">오늘의 추천운동</a></li>
								<li><a href="my_page_info.jsp">내정보수정</a></li>
							</ul></li>
					</c:when>
					<c:otherwise>
						<li><a href="main.jsp">Home</a></li>
						<li class="current"><a href="exerciseList.do">운동리스트</a>
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
											</ul></li>
									</ul></li>
							</ul></li>
						<li><a href="gym_list.jsp">헬스장 찾기</a>
							<ul>
								<li><a href="Sign-up.jsp">내 주변 헬스장</a></li>
								<li><a href="gym_list.jsp">전체 헬스장리스트</a></li>
							</ul></li>
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${uid=='admin' }">
						<div style="float: right">
							<a href="Logout">로그아웃</a>
						</div>
					</c:when>
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

		<!-- 로그아웃 -->
		<!-- Main -->
		<section id="main">

			<div class="container">
				<div class="row">
					<div class="col-9 col-12-medium">
						<div class="content">

							<!-- Content -->

							<article class="box page-content">

								<header align="center">
									<p style="line-height: 1.5em;">
										자신에게 맞는 <b style="color: #f50015; font-size: 30px;">운동리스트</b>를
										찾아보세요!!<br> <span style="font-size: 20px">카테고리 별로 보고싶다면 옆의 리스트를 이용해주세요.</span>
									</p>
									<ul class="meta">
									</ul>
								</header>

								<section>
									<section text-align="center">
										<section text-align="center">

											<%
												ArrayList<WorkOutDTO> arr = (ArrayList<WorkOutDTO>) session.getAttribute("Allworkout");
												if (arr == null) {
											%>
											<%
												} else {
													for (int i = 0; i < arr.size(); i++) {
											%>
											<section class="workout" class="routinesection">
												<div class="routinedesc">
													<%=(i + 1) + ". " + arr.get(i).getWorkoutname()%>
												</div>
												<iframe text-align="center" class="workoutvideo"
													height="500" src="<%=arr.get(i).getWorkouturl()%>"
													frameborder="0"
													allow="accelerometer; encrypted-media; gyroscope; picture-in-picture"
													allowfullscreen></iframe>

											</section>
											<%
												}
												}
											%>

										</section>

									</section>
							</article>


						</div>
					</div>
					<div class="col-3 col-12-medium">
						<div class="sidebar">

							<!-- Sidebar -->

							<!-- Recent Posts -->
							
								<div style="width: 15%; position: fixed;">
									<section style="overflow: hidden;">
										<h2 class="major" style="margin-top: 2%;">
											<h2 class="major"
												style="text-align: center; margin-left: 20%">
												<span>분위별 운동</span>
											</h2>
										</h2>
										<ul class="divided" style="text-align: center;">
											<li>
												<article class="box post-summary">
													<h3>
														<a href="shou_back.do">어깨/등</a>
													</h3>
												</article>
											</li>
											<li>
												<article class="box post-summary">
													<h3>
														<a href="chest.do">가슴</a>
													</h3>
												</article>
											</li>
											<li>
												<article class="box post-summary">
													<h3>
														<a href="choco.do">복근</a>
													</h3>
												</article>
											</li>
											<li>
												<article class="box post-summary">
													<h3>
														<a href="leg.do">다리</a>
													</h3>
												</article>
											</li>
											<li>
												<article class="box post-summary">
													<h3>
														<a href="exerciseList.do">전체</a>
													</h3>
												</article>
											</li>
										</ul>

									</section>
								</div>
								<div class="container">
									<div class="row">
										<div class="col-3 col-12-medium">
											<div class="sidebar">
												<!-- Something -->

												<c:choose>
													<c:when test="${uname!=null }">
														<section>
															<h2 class="major">
															</h2>
														</section>
													</c:when>
													<c:otherwise>
														<section>
															<h2 class="major">
															</h2>
															<a href="Sign-up.jsp" class="image featured">
														</section>
													</c:otherwise>
												</c:choose>
							</section>

							<!-- Something -->
							<section>
								<h2 class="major">
								</h2>
							</section>
						</div>
					</div>
					<div class="col-12">

						<!-- Features -->
						<section class="box features">
							<h2 class="major">
								<span> 주요 컨텐츠!</span>
							</h2>
							<div>
								<div class="row">
									<c:choose>
										<c:when test="${uname!=null }">
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
													<p>목표를 달성하고 싶다면 당장, 여기로! 자신의 현위치를 확인할 수 있을 뿐만 아니라 타
														회원들의 목표를 통해 동기부여까지!</p>
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


									<div class="col-12">
										<c:choose>
											<c:when test="${uname!=null }">

												<div class="col-12"
													style="margin-bottom: 20px; background-color: white;">
													<ul class="actions">
														<li><a href="my_page.jsp" class="button large">My
																Page</a></li>
														<li><a href="main.jsp" class="button alt large">Main</a></li>
													</ul>
												</div>
											</c:when>
											<c:otherwise>


												<div class="col-12"
													style="margin-bottom: 20px; background-color: white;">

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
												이 회사는 <strong>이루어Gym</strong>이라는 헬스 도움 웹사이트로서 건강한 몸, 예쁜 몸에
												도전하려는 초보 운동자들을 위해 다양한 컨텐츠를 준비한 사이트입니다. 웹 사이트를 이용함으로써 좀 더
												당당해지고 자신감 넘치는 당신의 미래를 위해 다가가세요 :)

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