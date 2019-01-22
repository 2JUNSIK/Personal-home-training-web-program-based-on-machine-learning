<%@page import="com.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Eat_list</title>
<style type="text/css">
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
	/* Set the line-height to the same as the height of the progress bar container, to center it vertically */
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

span.image.featured>img {
	margin-left: 150px;
	width: 500px;
	height: 380px;
}

td {
	width: 100px;
}

div>div.col-3.col-12-medium {
	padding-left: 5px;
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
	<%
		UserDAO dao = new UserDAO();
		boolean muscle = dao.getMuscle(session.getAttribute("uid").toString());
		pageContext.setAttribute("muscle", muscle);
	%>

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
					<c:when test="${uid=='admin' }">
						<li class="current"><a href="UserInfo1.do">회원관리</a>
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
						<li><a href="exerciseList.jsp">운동리스트</a>
						<li><a href="gym_list.jsp">헬스장 찾기</a>
							<ul>
								<li><a href="close_gym.jsp">내 주변 헬스장</a></li>
								<li><a href="gym_list.jsp">전체 헬스장리스트</a></li>
							</ul></li>
						<li class="current"><a href="eat_list.jsp">추천식단</a></li>
						<li><a href="my_page.jsp">마이페이지</a>
							<ul>
								<li><a href="my_page.jsp">목표달성현황</a></li>
								<li><a href="recommend_exercise.jsp">오늘의 추천운동</a></li>
								<li><a href="my_page_info.jsp">내정보수정</a></li>
							</ul></li>
					</c:when>
					<c:otherwise>
						<li><a href="main.jsp">Home</a></li>
						<li class="current"><a href="exerciseList.jsp">운동리스트</a>
						<li><a href="exerciseList.jsp">운동리스트</a>
							<ul>
								<li><a href="Bochungjae.jsp">보충제</a></li>
								<li><a href="exerciseList.jsp">운동리스트</a></li>
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
			<c:choose>
				<c:when test="${muscle==false }">

					<div style="width: 15%; position: fixed;">
						<div>
							<section>
								<h2 class="major" style="margin-top: 2%;">
									<ul class="divided">
										<h3 align="center">${uname}님의추천식단</h3>
									</ul>
								</h2>
								<ul class="divided">
									<li align="center">
										<article class="box post-summary">
											<h3>
												<a href="#morning">아침</a>
											</h3>
										</article>
									</li>
									<li align="center">
										<article class="box post-summary">
											<h3>
												<a href="#lunch">점심</a>
											</h3>
										</article>
									</li>
									<li align="center">
										<article class="box post-summary">
											<h3>
												<a href="#Dinner">저녁</a>
											</h3>
										</article>
									</li>
								</ul>
							</section>
						</div>
					</div>
				</c:when>
			</c:choose>


			<div class="container">

				<div class="row">
					<div class="col-3 col-12-medium">
						<div class="sidebar">

							<section align="center">
								<h2 class="major">
									<span><b id="gangjo">건강한</b>식습관</span>
								</h2>
								<a href="eat_list.jsp" class="image featured"><img
									src="images/eat_list_side1.gif" alt="" align="center" /></a>
								<p>
									<span style="color: red; font-size: 20px;">첫번째.</span>젓가락만으로
									식사하기<br> <span style="color: red; font-size: 20px;">두번째.</span>콩.두부
									많이 먹기<br> <span style="color: red; font-size: 20px;">세번째.</span>거꾸로
									먹기<br> <span style="color: red; font-size: 20px;">
										네번째.</span>꼭꼭 십어먹기<br> <span
										style="color: red; font-size: 20px;"> 다섯번째.</span>간식은 견과류
								</p>
								<a href="my_page.jsp" class="button alt">View More</a>
							</section>

							<!-- Something -->
							<section align="center">
								<h2 class="major">
									<span><b id="gangjo">올바른</b>식습관</span>
								</h2>
								<a href="eat_list.jsp" class="image featured"><img
									src="images/eat_list_side2.gif" alt="" align="center" /></a>
								<p>
									<span style="color: red; font-size: 20px;">하나.</span>충분한 수분섭취를
									한다<br> <span style="color: red; font-size: 20px;">둘.</span>영양소
									균형을 맞춰준다<br> <span style="color: red; font-size: 20px;">셋.</span>식사시
									음식에만 집중한다<br> <span style="color: red; font-size: 20px;">넷.</span>오후
									6시이후로 안먹는다<br> <span style="color: red; font-size: 20px;">다섯.</span>계절
									채소로 직접 조리해 먹는다
								</p>
								<a href="my_page.jsp" class="button alt">My Page</a>
							</section>

						</div>
					</div>

					<c:choose>
						<c:when test="${muscle==true }">
							<div class="col-9 col-12-medium imp-medium">
								<div class="content">

									<!-- Content -->
									<div id="morning">
										<article class="box page-content">

											<header style="text-align: center; padding-top: 5.25em;">
												<h2>식단</h2>
												<p></p>
											</header>

											<section>
												<span class="image featured"><img src="" alt="연예인사진"
													id="celebrity" /></span>
												<h3>${uname }님의추천연예인식단</h3>
												<p id="person"></p>
												<hr style="margin-bottom: 3%;">
													<h3 style="text-align: center;">식단외 추가로 섭취한 음식을 적어주세요~</h3>
													<input type="text" id="SearchedFood"
														style="margin-left: 24%; border: 1px solid; border-radius: 8px;">
													<button onclick="sumCalorie()"
														style="padding: 0.5em; font-size: 19px;">추가 음식 칼로리 확인</button>
													<br>
													<table border="1" style="text-align: center;">
				
													</table>
													<span id="sumcal" style="padding-left: 48%;">0</span><span>kcal</span>
											</section>
									</div>
									</article>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="col-9 col-12-medium imp-medium">
								<div class="content">

									<!-- Content -->
									<div id="morning">
										<article class="box page-content">

											<header style="text-align: center; padding-top: 5.25em;">
												<h2>아침식단</h2>
												<p>아침식사는 소식으로 섭취하는 것이 좋아요</p>
											</header>

											<section style="text-align: center;">
												<span class="image featured"><img src="" alt="아침사진"
													id="breakfastimg" /></span>
												<h3>${uname}님의아침식단</h3>
											</section>
									</div>
									<div id="lunch">
										<article class="box page-content">

											<header style="text-align: center; padding-top: 5.25em;">
												<h2>점심식단</h2>
												<p>점잖고 심심한 식단을 차려드세요</p>
											</header>

											<section style="text-align: center;">
												<span class="image featured"><img src=""
													id="lunchimg" alt="점심사진" /></span>
												<h3>${uname}님의점심식단</h3>
											</section>
									</div>
									<div id="Dinner">
										<article class="box page-content">

											<header style="text-align: center; padding-top: 5.25em;">
												<h2>저녁식단</h2>
												<p>마음을 비우고 스님이 되세요!</p>
											</header>

											<section style="text-align: center;">
												<span class="image featured"><img src="" alt="저녁사진"
													id="dinnerimg" /></span>
												<h3 style="margin-bottom: 3%;">${uname}님의저녁식단</h3>
											</section>
									</div>
									<!-- 칼로리계산부분 -->
									<hr style="margin-bottom: 3%;">
									<h3 style="text-align: center;">식단외 추가로 섭취한 음식을 적어주세요~</h3>
									<input type="text" id="SearchedFood"
										style="margin-left: 24%; border: 1px solid; border-radius: 8px;">
									<button onclick="sumCalorie()"
										style="padding: 0.5em; font-size: 19px;">추가 음식 칼로리 확인</button>
									<br>
									<table border="1" style="text-align: center;">

									</table>
									<span id="sumcal" style="padding-left: 48%;">0</span><span>Cal</span>
									</article>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
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
											<p>초보자들에게 필요한 운동들이 나열되어 있습니다. 또한 운동화 함께 섭취할 보충제들을
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
											<p>체형별로 식단 짜기 어려우신분들 , 여기모이세요! 저희 이루어짐이 당신에게 꼭맞는 식단을
												도와줄게요</p>
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
											<p>목표를 달성하고 싶다면 당장, 여기로! 자신의 현위치를 확인할 수 있을 뿐만 아니라 타 회원들의
												목표를 통해 동기부여까지!</p>
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
											<p>주변의 헬스장 어디로 갈지 고민하시는 여기 모두 모이세요 좋기로 소문난 헬스 장 여기다
												모아놨습니다!</p>
										</section>

									</div>
									<div class="col-12">
										<c:choose>
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
																이 회사는 <strong>이루어Gym</strong>이라는 헬스 도움 웹사이트로서 건강한 몸, 예쁜
																몸에 도전하려는 초보 운동자들을 위해 다양한 컨텐츠를 준비한 사이트입니다. 웹 사이트를 이용함으로써
																좀 더 당당해지고 자신감 넘치는 당신의 미래를 위해 다가가세요 :)

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
									<script type="text/javascript">
										$(document)
												.ready(
														function() {
															var breakfast = document
																	.getElementById("breakfastimg");
															var lunch = document
																	.getElementById("lunchimg");
															var dinner = document
																	.getElementById("dinnerimg");
															$
																	.ajax({
																		url : 'getDiet', //request 보낼 서버의 경로
																		type : 'get', // 메소드(get, post, put 등)
																		data : 'text', //보낼 데이터

																		success : function(
																				data) {

																			var json = JSON
																					.parse(data);

																			for (var i = 0; i < json.imgs.length; i++) {

																				if (i == 0) {

																					$(
																							"#breakfastimg")
																							.attr(
																									"src",
																									json.imgs[i].path);

																				} else if (i == 1) {
																					$(
																							"#lunchimg")
																							.attr(
																									"src",
																									json.imgs[i].path);

																				} else if (i == 2) {
																					$(
																							"#dinnerimg")
																							.attr(
																									"src",
																									json.imgs[i].path);
																				}
																			}
																		},
																		error : function(
																				err) {
																		}
																	});
														});

										$(document)
												.ready(
														function() {
															var txt = document
																	.getElementById("person");
															$
																	.ajax({
																		url : 'getCelebrity', //request 보낼 서버의 경로
																		type : 'get', // 메소드(get, post, put 등)
																		data : 'text', //보낼 데이터

																		success : function(
																				data) {
																			var json = JSON
																					.parse(data);
																			$(
																					"#celebrity")
																					.attr(
																							"src",
																							json.imgs[0].path);
																			txt.innerHTML = json.imgs[0].title;
																		},
																		error : function(
																				err) {
																		}
																	});
														});

										function sumCalorie() {
											var SearchedFood = document
													.getElementById("SearchedFood");
											var sumcal = document
													.getElementById("sumcal");
											$
													.ajax({
														type : "get",
														url : "calorie?SearchedFood="
																+ encodeURI(encodeURIComponent(SearchedFood.value)),
														dataType : "text",
														success : function(data) {
															var json = JSON
																	.parse(data);
															if (parseFloat(sumcal.innerHTML) > 800) {
																image_popup('images/4.PNG');
															} else if (parseFloat(sumcal.innerHTML) > 600) {
																image_popup('images/3.PNG');
															} else if (parseFloat(sumcal.innerHTML) > 400) {
																image_popup('images/2.PNG');
															} else if (parseFloat(sumcal.innerHTML) > 200) {
																image_popup('images/1.PNG');
															}
															if (json.cooking[0].name != 'null') {
																$("table")
																		.append(
																				"<tr>")
																		.append(
																				"<td>"
																						+ json.cooking[0].name
																						+ "</td>")
																		.append(
																				"<td>"
																						+ json.cooking[0].cal
																						+ "kcal"
																						+ "</td>")
																		.append(
																				"</tr>")
																sumcal.innerHTML = parseFloat(parseFloat(json.cooking[0].cal)
																		+ parseFloat(sumcal.innerHTML));
															} else {
																alert('없는 음식입니다.');
															}
														},
														error : function() {
															answer.innerHTML = "걍 에러남..";
														}
													});
										}

										function image_popup(url) {
											var imgObj = new Image();
											imgObj.src = url;
											imageWin = window
													.open("", "profile_popup",
															"width=900px height=160px left=580px top=360px");
											imageWin.document
													.write("<html><body style='margin:0'>");
											imageWin.document
													.write("<a href=javascript:window.close()><img src='"+url+"' border=0></a>");
											imageWin.document
													.write("</body><html>");
											imageWin.document.title = imgObj.src;
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