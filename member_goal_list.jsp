<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Member_goaL_list</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<style>
	table {
	  border-collapse: collapse;
	  border-spacing: 0;
	  width: 100%;
	  border: 1px solid #ddd;
	}
	
	th, td {
	  text-align: left;
	  padding-bottom: 5px;
	  padding-top: 5px;
	}
	
	tr:nth-child(even) {
	  background-color: #f2f2f2
	}
</style>
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
				<li ><a href="admin_main_page.jsp">Home</a></li>
				<li class="current"><a href="UserInfo1.do">회원관리</a>
					<ul>
						<li><a href="UserInfo1.do">회원정보</a></li>
						<li><a href="UserInfo2.do">회원목표정보</a></li>
						</ul>
						</li>
				<c:choose>
					<c:when test="${uid!=null }">
					<div style="float: right">
							<a href="Logout">로그아웃</a>
						</div>
					</c:when>
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

                        <header>
                           <h2>회원 목표기간 관리</h2>
                           <p>관리자만 확인하는 공간</p>
                           <ul class="meta">
                              <li class="icon fa-clock-o"><span id ="time"></span></li>

                           </ul>
                        </header>

                        <section>
                           <span class="image featured"><img
                              src="images/Admin_Banner.png" alt="" /></span>
                           <p>당신의 회원들입니다. 제발 관리좀 잘부탁드립니다.</p>
                        </section>

                        <section>
                           <table>
                              <tr style="border: 3px solid white; background-color:  ">
                                 <th>사용자 ID</th>
                                 <th> 키 </th>
                                 <th> 몸무게 </th>
                                 <th> 근육량 </th>
                                 <th> 목표기간 </th>
                                 <th> 목표량 </th>
                                 <th> 원하는부분 </th>
                                 <th> 강도 </th>
                                 <th> 홈트 및 헬스장 이용 여부</th>
                                 <th> 체형</th>
                                 

                              </tr>
                             <c:forEach var="i" begin="0" end="${listLength2-1 }" step="1">
                                 <tr>
                                    <td>${userList2[i].id }</td>
                                    <td>${userList2[i].height }</td>
                                    <td>${userList2[i].weight }</td>
                                    <td>${userList2[i].muscle }</td>
                                    <td>${userList2[i].targetPeriod}</td>
                                    <td>${userList2[i].targetAmount }</td>
                                    <td>${userList2[i].desirePart }</td>
                                    <td>${userList2[i].burglar }</td> 
                                    <td>${userList2[i].homeorGym }</td>
                                    <td>${userList2[i].bodyShape }</td>
                                    
                                 </tr>
                              </c:forEach>
                           </table>
                           
                           
                        </section>


                     </article>

                  </div>
               </div>
               <footer>
                  <div class="col-12">
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
            var context = document.getElementById("time");
            $(document).ready(function() { 
            	var today = new Date();

	            var currentTime =

	            (today.getYear()+1900)+"년 "+

	            (today.getMonth()+1)+"월 "+

	            today.getDate()+"일 "+

	            today.getHours()+"시 " +

	            today.getMinutes()+ "분 "+

	            today.getSeconds()+"초";

	          	context.innerHTML ="현재 시간 &nbsp;&nbsp;&nbsp; : &nbsp;&nbsp;&nbsp;"+currentTime;
            	setInterval(() => {
    				var today = new Date();

    	            var currentTime =

    	            (today.getYear()+1900)+"년 "+

    	            (today.getMonth()+1)+"월 "+

    	            today.getDate()+"일 "+

    	            today.getHours()+"시 " +

    	            today.getMinutes()+ "분 "+

    	            today.getSeconds()+"초";

    	          	context.innerHTML = "현재 시간 &nbsp;&nbsp;&nbsp; : &nbsp;&nbsp;&nbsp;"+currentTime;
    			}, 1000);
			});
            </script>
            
            
</body>
</html>