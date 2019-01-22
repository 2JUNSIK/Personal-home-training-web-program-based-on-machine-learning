<%@page import="com.model.WorkOutDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Recommend_exercise</title>
<style type="text/css">
 
 .workout{
 	width : 100%;
 }
 .workoutvideo{
 	margin-left : 170px;
 	width : 70%;
 	
 }
 .routinedesc{
 	margin-left : 150px;
 	font-family : 나눔고딕;
 	width : 100%;
 	font-size: 30px;
 	margin : 10px;
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
				<div style=" top: -1.7em;"">
					<!-- <p style="font-size: 50px; color: black;">이루어Gym</p> -->
					<img alt="" src="images/titleBar.png" ">	
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
									</ul>
								</li>
							</ul>
						</li>
						<li><a href="gym_list.jsp">헬스장 찾기</a>
							<ul>
								<li><a href="close_gym.jsp">내 주변 헬스장</a></li>
								<li><a href="gym_list.jsp">전체 헬스장리스트</a></li>
							</ul>
						<li><a href="eat_list.jsp">추천식단</a></li>
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
						<li class="current"><a href="my_page.jsp">마이페이지</a>
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
		<!-- Main -->
		<section id="main">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="content">

							<!-- Content -->

							<article class="box page-content">

								<header align="center">
									<h2>${sessionScope.uname}님을 위한 추천 운동</h2>
									<p>오늘의 식사는 내일로 미루지 않으면서 오늘 운동은 내일로 미루는 사람이 너무 많다.</p>
									<ul class="meta">
									</ul>
								</header>

								<section text-align = "center">
									<h1>오늘의 운동</h1>
									<%
										ArrayList<WorkOutDTO> arr = (ArrayList<WorkOutDTO>)session.getAttribute("realroutine");
										if (arr==null) {%> 
										<h1>근육도 휴식이 필요해요~~</h1>
										<%}else { 
										for (int i = 0; i<arr.size(); i++) {%>	
										<section class = "workout" class = "routinesection" >
										<div class = "routinedesc" > <%=(i+1)+". "+arr.get(i).getWorkoutname()+"   " %> X <%=arr.get(i).getWorkoutscore()%>회 
										 </div>
										<iframe text-align = "center" class = "workoutvideo" height="500" src="<%=arr.get(i).getWorkouturl() %>" frameborder="0" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
										
										 </section>
											<%}} %>
										
										</section>
										<section>
										<!-- 운동강도에 따라 다음날 운동 grade가 횟수에 반영됨. -->
										<h3>오늘의 운동 강도는 어떠셨나요?</h3>
										<form action = "WorkoutScore.do" type = "post" clear = "both">
											<input type = "radio" name = "score" value = "easy">쉬움
											<input type = "radio" name = "score" value = "normal">적당함
											<input type = "radio" name = "score" value = "difficult">어려움
											<input type = "submit" value = "오늘의 운동 완료!" class = "button large">
										
										</form>
										</section>
							</article>

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
									<div class="col-3 col-6-medium col-12-small">

										<!-- Feature -->
										<section class="box feature">
											<a href="recommend_exercise.jsp" class="image featured"><img
												src="images/pic01.jpg" alt="" /></a>
											<h3>
												<a href="recommend_exercise.jsp">운동 리스트</a>
											</h3>
											<p> 초보자들에게 필요한 운동들이 나열되어 있습니다. 또한 운동화 함께 섭취할 보충제들을 
											소개해놨습니다.</p>
										</section>

									</div>
									<div class="col-3 col-6-medium col-12-small">

										<!-- Feature -->
										<section class="box feature">
											<a href="eat_list.jsp" class="image featured"><img
												src="images/pic02.jpg" alt="" /></a>
											<h3>
												<a href="eat_list.jsp"> 식단 리스트</a>
											</h3>
											<p> 체형별로 식단 짜기 어려우신분들 , 여기모이세요! 저희 이루어짐이
											당신에게 꼭맞는 식단을 도와줄게요</p>
										</section>

									</div>
									<div class="col-3 col-6-medium col-12-small">

										<!-- Feature -->
										<section class="box feature">
											<a href="my_page.jsp" class="image featured"><img
												src="images/pic03.jpg" alt="" /></a>
											<h3>
												<a href="my_page.jsp"> 워너비리스트</a>
											</h3>
											<p> 목표를 달성하고 싶다면 당장, 여기로! 자신의 현위치를 확인할 수 있을 뿐만 아니라
											 타 회원들의 목표를 통해 동기부여까지!</p>
										</section>

									</div>
									<div class="col-3 col-6-medium col-12-small">

										<!-- Feature -->
										<section class="box feature">
											<a href="close_gym.jsp" class="image featured"><img
												src="images/pic04.jpg" alt="" /></a>
											<h3>
												<a href="close_gym.jsp"> 내집주변 헬스장 어디?</a>
											</h3>
											<p> 주변의 헬스장 어디로 갈지 고민하시는 여기 모두 모이세요
											좋기로 소문난 헬스 장 여기다 모아놨습니다!
											</p>
										</section>

									</div>
									<div class="col-12">
										<<c:choose>
				<c:when test="${uname!=null }">

					<div class="col-12"
						style="margin-bottom: 20px; background-color: white;">
						<ul class="actions">
							<li><a href="my_page.jsp" class="button large">My Page</a></li>
							<li><a href="main.jsp" class="button alt large">Main</a></li>
						</ul>
					</div>
				</c:when>
				<c:otherwise>


					<div class="col-12"
						style="margin-bottom: 20px; background-color: white;">
						
						<ul class="actions">
							<li><a href="Sign-up.jsp" class="button large">Join US</a></li>
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
								<li><a class="icon fa-facebook" href="https://www.facebook.com/gwangjumat"><span
										class="label">Facebook</span></a></li>
								<li><a class="icon fa-instagram" href="https://www.instagram.com/explore/tags/%EB%8B%A4%EC%9D%B4%EC%96%B4%ED%8A%B8%EC%8B%9D%EB%8B%A8/"><span
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

</body>
</html>