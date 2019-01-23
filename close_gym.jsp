<%@page import="com.controller.csvReader"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>Close_gym</title>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=wf6mnm704t"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=YOUR_CLIENT_ID&submodules=geocoder"></script>
<link rel="stylesheet" href="assets/css/main.css" />
<style>
a#MOVE_TOP_BTN {
	position: fixed;
	right: 2%;
	bottom: 50px;
	display: none;
	z-index: 999;
}
</style>
</head>
<body class="is-preload">
	<%
		String GwangJu_Health = "C:\\Users\\VDI02\\Desktop\\java\\web\\Health\\WebContent\\csv\\GwangJu.csv";

		String encoding = "EUC-KR";

		csvReader csv = new csvReader();

		ArrayList<String[]> temp = csv.getCSV(GwangJu_Health, encoding, 4);

		csv.jsonConversion(request, response, temp);
	%>

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
				<li><a href="main.jsp">Home</a></li>
				<li><a href="exerciseList.jsp">운동리스트</a>
					<ul>
						<li><a href="Bochungjae.jsp">보충제</a></li>
						<li><a href="exerciseList.jsp">운동리스트</a></li>
					</ul></li>

				<li class="current"><a href="gym_list.jsp">헬스장 찾기</a>
					<ul>
						<li><a href="close_gym.jsp">내 주변 헬스장</a></li>
						<li><a href="gym_list.jsp">전체 헬스장리스트</a></li>
					</ul>
				<li><a href="eat_list.jsp">추천식단</a></li>
				</li>
				<li><a href="my_page.jsp">마이페이지</a>
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
		<!-- 내 정보 수정 -->
		<!-- 로그아웃 -->
		<!-- Main -->
		<section id="main">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="content">

							<!-- Content -->

							<article class="box page-content">


								<section style="margin-bottom: 1.25em;">
									<h3
										style="text-align: center; font-size: 20px; margin-bottom: 1.25em;">${uname}님
										동네에 있는 <b style="color: #f50057; font-size: 32px;">모든 헬스장</b>을
										보고 계십니다!
									</h3>

									<h3>${sessionScope.uname}님&nbsp;정확한주소를 입력해주세요(시/군/동)</h3>
									<input type="text" id="city"
										style="border: 1px solid; border-radius: 3px;"> <input
										type="text" id="gu"
										style="border: 1px solid; border-radius: 3px;"> <input
										type="text" id="dong"
										style="border: 1px solid; border-radius: 3px;">
									<button value="search" onclick="search()"
										style="padding: 0.5em 1.25em; font-size: 17px;">검색</button>
									<br>
									<div id="map"
										style="width: 100%; height: 600px; margin-top: 5px;"></div>
									<p
										style="text-align: center; font-size: 20px; margin-bottom: 0.7em; margin-top: 0.7em;">
										맘에 드는 곳으로 <b style="color: #f50057; font-size: 32px;">운동</b>하러 가 볼까요?
									</p>
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

<script>
	var default_posi_x = 37.3595704;
	var default_posi_y = 127.105399;
	
	var mapOptions = {
		center: new naver.maps.LatLng(default_posi_x, default_posi_y), //지도의 초기 중심 좌표
		zoom: 11, //지도의 초기 줌 레벨
		minZoom: 1, //지도의 최소 줌 레벨
		zoomControl: false, //줌 컨트롤의 표시 여부
		draggable: true,
	    pinchZoom: true,
	    scrollWheel: true,
	    keyboardShortcuts: true,
	    disableDoubleTapZoom: true,
	    disableDoubleClickZoom: true,
	    disableTwoFingerTapZoom: true, 
	    
	    // 관성 드래깅
	    disableKineticPan: false, 
	    
	    tileTransition: true
	};
	
	var map = new naver.maps.Map('map', mapOptions);
	
	var bounds = map.getBounds(),
    southWest = bounds.getSW(),
    northEast = bounds.getNE(),
    lngSpan = northEast.lng() - southWest.lng(),
    latSpan = northEast.lat() - southWest.lat();
	
	var GwangJu = ${GwangJu};
	var listLength = ${listLength};
	
	var markers = [];
	var contentStrings = [];
	var infowindows = [];
	
	for (var i = 0; i < listLength; i++) {
		var contentString = [
		    '<div class="iw_inner">',
		    '   <h3>'+ GwangJu.place[i].name + '</h3>',
		    '   <p>' + GwangJu.place[i].address + '<br>',
		    '       '+ GwangJu.place[i].pn + '',
		    '   </p>',
		    '</div>'
		].join('');
		contentStrings.push(contentString);
		var infowindow = new naver.maps.InfoWindow({
		    content: contentString
		});
		infowindows.push(infowindow);
	}
	
		for (var m = 0; m < listLength; m++) {
			naver.maps.Service.geocode({
		        address: GwangJu.place[m].address
		    }, function(status, response) {
		    	
		        if (status === naver.maps.Service.Status.ERROR) {
		            return alert('Something Wrong!');
		        }
		        var item = response.result.items[0],
		            point = new naver.maps.Point(item.point.x, item.point.y);
	
		        setMarker(point, '/images/mr game and watch.png', markers);
		    	
		    });
		}
		
	naver.maps.Event.addListener(map, 'idle', function() {
	    updateMarkers(map, markers);
	});
	
	
	
	function updateMarkers(map, markers) {

	    var mapBounds = map.getBounds();
	    var marker, position;

	    for (var i = 0; i < markers.length; i++) {

	        marker = markers[i]
	        position = marker.getPosition();

	        if (mapBounds.hasLatLng(position)) {
	            showMarker(map, marker);
	        } else {
	            hideMarker(map, marker);
	        }
	    }
	}

	function showMarker(map, marker) {

	    if (marker.getMap()) return;
	    marker.setMap(map);
	}

	function hideMarker(map, marker) {

	    if (!marker.getMap()) return;
	    marker.setMap(null);
	}
	
	function setMarker(point, imgurl, markers) {
		var HOME_PATH = window.HOME_PATH || '.';
		var posi = new naver.maps.LatLng(point.y, point.x);
		var markerOptions = {
			    position: posi,
			    map: map,
			    icon: {
			        url: HOME_PATH + imgurl,
			        size: new naver.maps.Size(50, 68),
			        scaledSize: new naver.maps.Size(50, 68),
			        origin: new naver.maps.Point(0, 0),
			        anchor: new naver.maps.Point(11, 35)
			    }
			};
		var marker = new naver.maps.Marker(markerOptions);
		markers.push(marker);
		
	}
	
	function setMarker(point, imgurl) {
		var HOME_PATH = window.HOME_PATH || '.';
		var posi = new naver.maps.LatLng(point.y, point.x);
		var markerOptions = {
			    position: posi,
			    map: map,
			    icon: {
			        url: HOME_PATH + imgurl,
			        size: new naver.maps.Size(50, 68),
			        scaledSize: new naver.maps.Size(50, 68),
			        origin: new naver.maps.Point(0, 0),
			        anchor: new naver.maps.Point(11, 35)
			    }
			};
		var marker = new naver.maps.Marker(markerOptions);
		markers.push(marker);
	}
	
	function search() {
		for (var i = 0; i < markers.length; i++) {
		    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
		}
		
		var city = document.getElementById("city").value;
		var gu = document.getElementById("gu").value;
		var dong = document.getElementById("dong").value;
		
		var currentDistrict = new Array();
		currentDistrict[0] = [city + " " + gu + " " + dong];
		
		naver.maps.Service.geocode({
	        address: currentDistrict[0]
	    }, function(status, response) {
	    	
	        if (status === naver.maps.Service.Status.ERROR) {
	            return alert('Something Wrong!');
	        }
	
	        var item = response.result.items[0],
	            point = new naver.maps.Point(item.point.x, item.point.y);
			map.setCenter(point);
			setMarker(point, '/images/kirby.png');
	    });
	}
	
	function getClickHandler(seq) {
	    return function(e) {
	        var marker = markers[seq],
	            infoWindow = infowindows[seq];

	        if (infoWindow.getMap()) {
	            infoWindow.close();
	        } else {
	            infoWindow.open(map, marker);
	        }
	    }
	}
	</script>
</body>
</html>