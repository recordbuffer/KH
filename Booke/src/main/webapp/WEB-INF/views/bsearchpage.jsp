<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="com.mvc.book.kakaoapi.BookController"%>
<%@page import="com.mvc.book.kakaoapi.BookInfodto" %>
<%@page import="java.util.List" %>
<%
String query = request.getParameter("query");
String sort = "accuracy";

String temp = request.getParameter("sort");	// accuracy or recency
if(temp != null){
	sort = temp;
}

BookController control = new BookController();

List<BookInfodto> books;
try{
	books = control.getBookList(query, sort);
}catch(Exception e){
	books = new ArrayList<BookInfodto>();
}
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

<link rel="stylesheet" href="resources/css/searchpage.css" type="text/css">

	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link href="./css/Bookserchcardview.css"/>

<style type="text/css">
#mainnav {
	background-color: #b5e3d8 !important;
}

#mainhd {
	background-color: #f5f5f5 !important;
}

#mainbody {
	background-color: #f5f5f5 !important;
}

#hddiv {
	background-color: rgb(119, 109, 97) !important;
	margin-top: 50px;
}

p>button{
	background-color: rgb(181, 227, 216) !important;
}
</style>
</head>

<body style="background-color: #f5f5f5;">

	<jsp:include page="header.jsp"></jsp:include>
	<br>
	<br>
	

	
	<!-- Header -->
	<header class="bg-primary py-2 mb-5" id="mainhd">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-lg-12" id="hddiv">
					<h1 class="display-4 text-white mt-1 mb-1">
						<button type="button" class="btn btn-dark">북이온앤온 검색하기</button>
						<form class="d-flex" action="bres.do">
							<input class="form-control me-2" type="text" name="query" placeholder="Search"
								<%if(query != null) { %>
								value="<%=query %>"
								<%} %>
								aria-label="Search">&nbsp; 
							<input class="btn btn-outline-dark" type="submit" value="Search">
						</form>
					</h1>
				</div>
			</div>
		</div>
	</header>
	<!-- Page Content -->

	<main class="bg-primary py-2 mb-5" id="mainbody">
	
	<div class="container">
    <div class="row">
        <div class="col-lg-4"><img src="resources/images/bookimg1.png"></div>
        <div class="col-lg-4"><img src="resources/images/bookimg2.png"></div>
        <div class="col-lg-4"><img src="resources/images/bookimg3.png"></div>
        <br>
        <div class="col-lg-4"><p><button type="button" class="btn btn-block">자기소개 책 추천</button></p></div>
        <div class="col-lg-4"><p><button type="button" class="btn btn-block">국내 베스트 셀러</button></p></div>
        <div class="col-lg-4"><p><button type="button" class="btn btn-block">해외 배스트 셀러</button></p></div>
    </div>
	</div>
		
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>