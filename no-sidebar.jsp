<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>No Sidebar - TXT by HTML5 UP</title>
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
				<div>
					<h1>
						<a href="index.html" id="logo">TXT</a>
					</h1>
					<p>A responsive site template by HTML5 UP</p>
				</div>
			</div>
		</header>

		<!-- Nav -->
		<nav id="nav">
			<ul>
				<div style="float: left">
					<strong>방문자 수</strong>
					<b>${visit }</b>
				</div>
				<li><a href="main.jsp">Home</a></li>
				<li><a href="#">Dropdown</a>
					<ul>
						<li><a href="#">Lorem ipsum dolor</a></li>
						<li><a href="#">Magna phasellus</a></li>
						<li><a href="#">Phasellus consequat</a>
							<ul>
								<li><a href="#">Lorem ipsum dolor</a></li>
								<li><a href="#">Phasellus consequat</a></li>
								<li><a href="#">Magna phasellus</a></li>
								<li><a href="#">Etiam dolore nisl</a></li>
							</ul></li>
						<li><a href="#">Veroeros feugiat</a></li>
					</ul></li>
				<li><a href="left-sidebar.jsp">Left Sidebar</a></li>
				<li><a href="right-sidebar.jsp">Right Sidebar</a></li>
				<li class="current"><a href="no-sidebar.jsp">No Sidebar</a></li>
				<c:choose>
					<c:when test="${empty info}">
						<div style="float: right">
							<a onclick="document.getElementById('id02').style.display='block';document.getElementById('id01').style.display='none'">회원가입</a>
						</div>
						<div style="float: right">
							<a onclick="document.getElementById('id01').style.display='block';document.getElementById('id02').style.display='none'">로그인</a>
						</div>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${info.email == 'admin'}">
								<a href="Select.do">회원 관리</a> / <a href="logout.jsp">로그아웃</a>
							</c:when>
							<c:otherwise>
								<a href="update2.jsp">내 정보 수정</a> / <a href="logout.jsp">로그아웃</a>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>

		<!-- Login 창 -->
		<div id="id01" class="modal">
			<form class="modal-content animate" action="/login.do">
				<div class="container">
					<label for="uname"><b>Username</b></label> <input type="text"
						placeholder="Enter Username" name="uname" required> <label
						for="psw"><b>Password</b></label> <input type="password"
						placeholder="Enter Password" name="psw" required>

					<button type="submit">Login</button>
					<label><input type="checkbox" checked="checked"
						name="remember"> Remember me </label>
				</div>

				<div class="container" style="background-color: #f1f1f1">
					<button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
				</div>
			</form>
		</div>

		<!-- 회원가입 창 -->

		<div id="id02" class="modal">
			<span onclick="document.getElementById('id02').style.display='none'"
				class="close" title="Close Modal">&times;</span>
			<form class="modal-content" action="/action_page.php">
				<div class="container">
					<h1>Sign Up</h1>
					<p>Please fill in this form to create an account.</p>
					<hr>
					<label for="email"><b>Email</b></label> <input type="text"
						placeholder="Enter Email" name="email" required> <label
						for="psw"><b>Password</b></label> <input type="password"
						placeholder="Enter Password" name="psw" required> <label
						for="psw-repeat"><b>Repeat Password</b></label> <input
						type="password" placeholder="Repeat Password" name="psw-repeat"
						required> <label> <input type="checkbox"
						checked="checked" name="remember" style="margin-bottom: 15px">Remember
						me
					</label>

					<p>
						By creating an account you agree to our <a href="#"
							style="color: dodgerblue">Terms & Privacy</a>.
					</p>

					<div class="clearfix">
						<button type="button"
							onclick="document.getElementById('id02').style.display='none'"
							class="cancelbtn">Cancel</button>
						<button type="submit" class="signupbtn">Sign Up</button>
					</div>
				</div>
			</form>
		</div>

		<!-- Main -->
		<section id="main">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="content">

							<!-- Content -->

							<article class="box page-content">

								<header>
									<h2>No Sidebar</h2>
									<p>Semper amet scelerisque metus faucibus morbi congue
										mattis</p>
									<ul class="meta">
										<li class="icon fa-clock-o">5 days ago</li>
										<li class="icon fa-comments"><a href="#">1,024</a></li>
									</ul>
								</header>

								<section>
									<span class="image featured"><img src="images/pic05.jpg"
										alt="" /></span>
									<p>Phasellus quam turpis, feugiat sit amet ornare in,
										hendrerit in lectus. Praesent semper mod quis eget mi. Etiam
										eu ante risus. Aliquam erat volutpat. Aliquam luctus et mattis
										lectus sit amet pulvinar. Nam turpis nisi consequat etiam
										lorem ipsum dolor sit amet nullam.</p>
								</section>

								<section>
									<h3>More intriguing information</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
										Maecenas ac quam risus, at tempus justo. Sed dictum rutrum
										massa eu volutpat. Quisque vitae hendrerit sem. Pellentesque
										lorem felis, ultricies a bibendum id, bibendum sit amet nisl.
										Mauris et lorem quam. Maecenas rutrum imperdiet vulputate.
										Nulla quis nibh ipsum, sed egestas justo. Morbi ut ante mattis
										orci convallis tempor. Etiam a lacus a lacus pharetra
										porttitor quis accumsan odio. Sed vel euismod nisi. Etiam
										convallis rhoncus dui quis euismod. Maecenas lorem tellus,
										congue et condimentum ac, ullamcorper non sapien vulputate.
										Nulla quis nibh ipsum, sed egestas justo. Morbi ut ante mattis
										orci convallis tempor. Etiam a lacus a lacus pharetra
										porttitor quis accumsan odio. Sed vel euismod nisi. Etiam
										convallis rhoncus dui quis euismod. Maecenas lorem tellus,
										congue et condimentum ac, ullamcorper non sapien. Donec
										sagittis massa et leo semper a scelerisque metus faucibus.
										Morbi congue mattis mi. Phasellus sed nisl vitae risus
										tristique volutpat. Cras rutrum commodo luctus.</p>
								</section>

								<section>
									<h3>So in conclusion ...</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
										Maecenas ac quam risus, at tempus justo. Sed dictum rutrum
										massa eu volutpat. Quisque vitae hendrerit sem. Pellentesque
										lorem felis, ultricies a bibendum id, bibendum sit amet nisl.
										Mauris et lorem quam. Maecenas rutrum imperdiet vulputate.
										Nulla quis nibh ipsum, sed egestas justo. Morbi ut ante mattis
										orci convallis tempor. Etiam a lacus a lacus pharetra
										porttitor quis accumsan odio. Sed vel euismod nisi. Etiam
										convallis rhoncus dui quis euismod. Maecenas lorem tellus,
										congue et condimentum ac, ullamcorper non sapien. Donec
										sagittis massa et leo semper a scelerisque metus faucibus.
										Morbi congue mattis mi. Phasellus sed nisl vitae.</p>
									<p>Suspendisse laoreet metus ut metus imperdiet interdum
										aliquam justo tincidunt. Mauris dolor urna, fringilla vel
										malesuada ac, dignissim eu mi. Praesent mollis massa ac nulla
										pretium pretium. Maecenas tortor mauris, consectetur
										pellentesque dapibus eget, tincidunt vitae arcu.</p>
								</section>

							</article>

						</div>
					</div>
					<div class="col-12">

						<!-- Features -->
						<section class="box features">
							<h2 class="major">
								<span>A Major Heading</span>
							</h2>
							<div>
								<div class="row">
									<div class="col-3 col-6-medium col-12-small">

										<!-- Feature -->
										<section class="box feature">
											<a href="#" class="image featured"><img
												src="images/pic01.jpg" alt="" /></a>
											<h3>
												<a href="#">A Subheading</a>
											</h3>
											<p>Phasellus quam turpis, feugiat sit amet ornare in, a
												hendrerit in lectus dolore. Praesent semper mod quis eget
												sed etiam eu ante risus.</p>
										</section>

									</div>
									<div class="col-3 col-6-medium col-12-small">

										<!-- Feature -->
										<section class="box feature">
											<a href="#" class="image featured"><img
												src="images/pic02.jpg" alt="" /></a>
											<h3>
												<a href="#">Another Subheading</a>
											</h3>
											<p>Phasellus quam turpis, feugiat sit amet ornare in, a
												hendrerit in lectus dolore. Praesent semper mod quis eget
												sed etiam eu ante risus.</p>
										</section>

									</div>
									<div class="col-3 col-6-medium col-12-small">

										<!-- Feature -->
										<section class="box feature">
											<a href="#" class="image featured"><img
												src="images/pic03.jpg" alt="" /></a>
											<h3>
												<a href="#">And Another</a>
											</h3>
											<p>Phasellus quam turpis, feugiat sit amet ornare in, a
												hendrerit in lectus dolore. Praesent semper mod quis eget
												sed etiam eu ante risus.</p>
										</section>

									</div>
									<div class="col-3 col-6-medium col-12-small">

										<!-- Feature -->
										<section class="box feature">
											<a href="#" class="image featured"><img
												src="images/pic04.jpg" alt="" /></a>
											<h3>
												<a href="#">And One More</a>
											</h3>
											<p>Phasellus quam turpis, feugiat sit amet ornare in, a
												hendrerit in lectus dolore. Praesent semper mod quis eget
												sed etiam eu ante risus.</p>
										</section>

									</div>
									<div class="col-12">
										<ul class="actions">
											<li><a href="#" class="button large">Do Something</a></li>
											<li><a href="#" class="button alt large">Think About
													It</a></li>
										</ul>
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
								<span>What's this about?</span>
							</h2>
							<p>
								This is <strong>TXT</strong>, yet another free responsive site
								template designed by <a href="http://twitter.com/ajlkn">AJ</a>
								for <a href="http://html5up.net">HTML5 UP</a>. It's released
								under the <a href="http://html5up.net/license/">Creative
									Commons Attribution</a> license so feel free to use it for whatever
								you're working on (personal or commercial), just be sure to give
								us credit for the design. That's basically it :)
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
								<li><a class="icon fa-facebook" href="#"><span
										class="label">Facebook</span></a></li>
								<li><a class="icon fa-twitter" href="#"><span
										class="label">Twitter</span></a></li>
								<li><a class="icon fa-instagram" href="#"><span
										class="label">Instagram</span></a></li>
								<li><a class="icon fa-dribbble" href="#"><span
										class="label">Dribbble</span></a></li>
								<li><a class="icon fa-linkedin" href="#"><span
										class="label">LinkedIn</span></a></li>
							</ul>
						</section>

					</div>
				</div>

				<!-- Copyright -->
				<div id="copyright">
					<ul class="menu">
						<li>&copy; Untitled. All rights reserved</li>
						<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
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