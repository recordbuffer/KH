<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.mvc.book.model.dto.MemberDto"%>
<%
	MemberDto dto = (MemberDto) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<!-- bootstrap css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<!-- style css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<!-- Responsive-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/responsive.css">

<link rel="stylesheet" href="resources/css/mainpage.css" type="text/css">

<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>


<link rel="stylesheet" href="resources/css/footer.css">
<link rel="stylesheet" href="resources/css/mainpage.css">
</head>

<body>

	<jsp:include page="header.jsp"></jsp:include>
	<br>
	<br>
	<div style="height:100px"></div>

	<!-- Page Content -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-7 offset-md-1">
				<div class="container">
					<table>
						<tr>
							<td><input type="button" value="공지사항" class="form-control"
								id="btn"
								style="width: 170px; margin-top: 20px; font-size: 14pt;"
								onclick="location.href='notice.do'"></td>
							<td><input type="button" value="쪽지관리" class="form-control"
								id="btn"
								style="width: 170px; margin-top: 20px; font-size: 14pt;"
								onclick="location.href=''"></td>
							<td><input type="button" value="친구관리" class="form-control"
								id="btn"
								style="width: 170px; margin-top: 20px; font-size: 14pt;"
								onclick="location.href='friend.do'"></td>
						</tr>
						<tr>
							<td><input type="button" value="회원 정보 수정"
								class="form-control" id="btn"
								style="width: 170px; margin-top: 20px; font-size: 14pt;"
								onclick="location.href='updateform.do'"></td>
							<td><input type="button" value="회원 탈퇴" class="form-control"
								id="btn"
								style="width: 170px; margin-top: 20px; font-size: 14pt;"
								onclick="location.href='md_aks.do'"></td>
							<td><input type="button" value="감성 이미지 기능"
								class="form-control" id="btn"
								style="width: 170px; margin-top: 20px; font-size: 14pt;"
								onclick="location.href=''"></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-md-2">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<div class="login_menu">
								<!-- 서재 / 커뮤니티 / 내 서재 버튼 div -->
								<div>
									<div class="login_img">
										<img src="resources/images/kjh.png"
											style="border-radius: 100%;">
									</div>
									<div class="login_name">
										<!-- 설정 / 쪽지 버튼, 닉네임 -->
										<a href="setting.do"><i class="bi bi-gear-fill"
											style="font-size: 2.2rem; color: white; position: absolute; left: 160px; transform: translate(5px, 10px);"></i></a>
										<div style="transform: translate(-10px, 58px);">
											<p style="font-size: 15pt;">
												@
												<%=dto.getBe_id()%></p>
											<p style="font-size: 25pt;"><%=dto.getBe_nn()%>
												<span style="font-size: 19pt;">님</span>
											</p>
											<button type="button" class="btn btn-outline-dark"
												style="transform: translate(130px, -58px);">Logout</button>
										</div>
										<div style="transform: translate(-124px, 30px); color: white;">
											<span style="font-size: 20pt;">친구</span>&nbsp;&nbsp;&nbsp; <span
												style="font-size: 18pt;">44</span><span
												style="font-size: 16pt;"> 명</span> <a href="fsearch.do"><i
												class="bi bi-plus-circle"
												style="font-size: 1.8rem; color: white; position: relative; left: 80px;"></i></a>
											<a href="msg.do"><i class="bi bi-chat-text-fill"
												style="font-size: 1.8rem; color: white; position: relative; left: 90px;"></i></a>
										</div>
									</div>
								</div>
								<div
									style="color: white; text-align: center; transform: translate(0px, -30px);">
									<div style="font-size: 20pt;">
										<span>42</span><span style="font-size: 19pt;"> 권</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<span>143 권</span>
									</div>
									<div style="transform: translate(3px, 7px);">
										<span>읽은 책</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<span>읽고 싶은 책</span>
									</div>
								</div>
								<!-- 목표 달성도 -->
								<div class="attainment"
									style="transform: translate(0px, 220px); height: 155px;">
									목표달성도</div>
							</div>
							<div class="friend">
								<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
									integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
									crossorigin="anonymous"></script>
								<script
									src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
									integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
									crossorigin="anonymous"></script>
								<script
									src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
									integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
									crossorigin="anonymous"></script>
								<div id="demo" class="carousel slide" data-ride="carousel">
									<div class="carousel-inner">
										<!-- 슬라이드 쇼 -->
										<div class="carousel-item active">
											<!--가로-->
											<img class="d-block w-100" src="resources/images/slide.jpg"
												alt="First slide">
											<div class="carousel-caption d-none d-md-block">
												<div class="circle friend1">
													<h6 class="nickname">친구1</h6>
												</div>
												<div class="circle friend2">
													<h6 class="nickname">친구2</h6>
												</div>
												<div class="circle friend3">
													<h6 class="nickname">친구3</h6>
												</div>
											</div>
										</div>
										<div class="carousel-item">
											<img class="d-block w-100" src="resources/images/slide.jpg"
												alt="Second slide">
											<div class="carousel-caption d-none d-md-block">
												<div class="circle friend4">
													<h6 class="nickname">친구4</h6>
												</div>
												<div class="circle friend5">
													<h6 class="nickname">친구5</h6>
												</div>
												<div class="circle friend6">
													<h6 class="nickname">친구6</h6>
												</div>
											</div>
										</div>
										<div class="carousel-item">
											<img class="d-block w-100" src="resources/images/slide.jpg"
												alt="Third slide">
											<div class="carousel-caption d-none d-md-block">
												<div class="circle friend7">
													<h6 class="nickname">친구7</h6>
												</div>
												<div class="circle friend8">
													<h6 class="nickname">친구8</h6>
												</div>
												<div class="circle friend9">
													<h6 class="nickname">친구9</h6>
												</div>
											</div>
										</div>
										<!-- / 슬라이드 쇼 끝 -->
										<!-- 왼쪽 오른쪽 화살표 버튼 -->
										<a class="carousel-control-prev" href="#demo"
											data-slide="prev"> <span
											class="carousel-control-prev-icon" aria-hidden="true"></span>
											<!-- <span>Previous</span> -->
										</a> <a class="carousel-control-next" href="#demo"
											data-slide="next"> <span
											class="carousel-control-next-icon" aria-hidden="true"></span>
											<!-- <span>Next</span> -->
										</a>
										<!-- / 화살표 버튼 끝 -->
										<!-- 인디케이터 -->
										<ul class="carousel-indicators">
											<li data-target="#demo" data-slide-to="0" class="active"></li>
											<!--0번부터시작-->
											<li data-target="#demo" data-slide-to="1"></li>
											<li data-target="#demo" data-slide-to="2"></li>
										</ul>
										<!-- 인디케이터 끝 -->
									</div>
								</div>
								<div style="background-color: rgb(119, 109, 97);">
									<form class="d-flex" style="padding: 5px" action="fres.do"
										method="post">
										<input type="hidden" value="searchid"> <input
											class="form-control me-2" type="text" placeholder="친구 찾기"
											id="searchid" name="searchid">&nbsp; <input
											class="btn btn-outline-dark" type="submit" id="searchbtn"
											name="searchbtn" value="Search">
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>