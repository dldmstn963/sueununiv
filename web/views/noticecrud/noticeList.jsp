<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="employee.model.vo.Employee,notice.model.vo.Notice,java.util.ArrayList"%>
<%@ page import="student.model.vo.Student"%>
<%@ page import="professor.model.vo.Professor"%>
<%
	Employee loginEmployee = (Employee) session.getAttribute("loginEmployee");
Student loginStudent = (Student) session.getAttribute("loginStudent");
Professor loginProfessor = (Professor) session.getAttribute("loginProfessor");
ArrayList<Notice> list = (ArrayList<Notice>) request.getAttribute("list");
int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
int beginPage = ((Integer)request.getAttribute("beginPage")).intValue();
int endPage = ((Integer)request.getAttribute("endPage")).intValue();
int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();	
%>
<!DOCTYPE html>
<html>
<title>수은 대학교</title>
<script type="text/javascript" src="/eunsu/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function classEnroll() {
	var f = document.classEnroll2;
	f.action = "/eunsu/classenrollList";
	f.method = "post"
	f.submit();
}

function Chat() {
	var f = document.Chat2;
	f.action = "/eunsu/chattinglist";
	f.method = "get"
	f.submit();
}
</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/eunsu/resources/css/w3.css">
<link rel="stylesheet"
	href="/eunsu/resources/css/w3-theme-blue-grey.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<body class="w3-theme-l5">

	<!-- Navbar -->
	<div class="w3-top">
		<div class="w3-bar w3-theme-d2 w3-left-align w3-large">
			<a
				class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2"
				href="javascript:void(0);" onclick="openNav()"><i
				class="fa fa-bars"></i></a> <a href="/eunsu/views/main.jsp"
				class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i
				class="fa fa-home w3-margin-right"></i>수은 대학교</a> <a href="/eunsu/noticelist"
				class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
				title="News"><i class="fa fa-flag"></i></a> <a href="/eunsu/calendarlist"
				class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
				title="Account Settings"><i class="fa fa-calendar"></i></a> <a href="#" onclick="Chat();"
				class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
				title="Messages"><i class="fa fa-comments"></i></a> <a href="#"
				class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white"
				title="My Account"> </a>
							<form name="Chat2">
								<%if (loginProfessor != null) {%>
								<input type="hidden" name="employeeNo" value="<%=loginProfessor.getProfessorNo()%>" />
								<%} else if (loginEmployee != null) {%>
								<input type="hidden" name="employeeNo" value="<%=loginEmployee.getEmployeeNo()%>" />
								<%} else if (loginStudent != null) {%>
								<input type="hidden" name="employeeNo" value="<%=loginStudent.getStudentNo()%>" />
								<%} %>
							</form>
				
		</div>
	</div>

	<!-- Navbar on small screens -->
		<div id="navDemo"
		class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
		<a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>
		<a href="/eunsu/noticelist" class="w3-bar-item w3-button w3-padding-large">공지사항</a>
		<a href="/eunsu/calendarlist" class="w3-bar-item w3-button w3-padding-large">일정</a>
		<a href="#" onclick="Chat();" class="w3-bar-item w3-button w3-padding-large">채팅</a>
	</div>

	<!-- Page Container -->
	<div class="w3-container w3-content"
		style="max-width: 1400px; margin-top: 80px">
		<!-- The Grid -->
		<div class="w3-row">
			<!-- Left Column -->
			<div class="w3-col m3">
				<!-- Profile -->
					<div class="w3-card w3-round w3-white">
					<%
						if (loginProfessor != null) {
					%>
					<div class="w3-container">
						<h4 class="w3-center">
							내 정보
							<form action="/eunsu/pmyinfo" method="post">
								<input type="hidden"
									value="<%=loginProfessor.getProfessorNo()%>" name="empno">
								<input type="hidden"
									value="<%=loginProfessor.getProfessorPassword()%>"
									name="emppass"> <input type="submit" value="수정">
							</form>
						</h4>
						<p class="w3-center">
							<img src="<%=loginProfessor.getProfessorImage()%>"
								class="w3-circle" style="height: 106px; width: 106px"
								alt="Avatar">
						</p>
						<hr>
						<p>
							<i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i>
							<%=loginProfessor.getProfessorName()%></p>
						<p>
							<i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i>
							<%=loginProfessor.getCategory()%></p>
						<p>
							<i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i>
							<%=loginProfessor.getDepartmentName()%></p>
						<br> <a href="/eunsu/logout" style="text-decoration: none;">로그아웃</a>
					</div>
					<%
						} else if (loginEmployee != null) {
					%>
					<div class="w3-container">
						<h4 class="w3-center">
							내 정보 &nbsp;
							<form action="/eunsu/emyinfo" method="post">
								<input type="hidden" value="<%=loginEmployee.getEmployeeNo()%>"
									name="empno"> <input type="hidden"
									value="<%=loginEmployee.getEmployeePassword()%>" name="emppass">
								<input type="submit" value="수정">
							</form>
						</h4>
						<p class="w3-center">
							<img src="<%=loginEmployee.getEmployeeimage()%>"
								class="w3-circle" style="height: 106px; width: 106px"
								alt="Avatar">
						</p>
						<hr>
						<p>
							이름 :
							<%=loginEmployee.getEmployeeName()%>
						</p>
						<p>
							소속 부서 :
							<%=loginEmployee.getEmpDepartment()%>
						</p>
						<a href="/eunsu/logout" style="text-decoration: none;">로그아웃</a>
					</div>
					<%
						} else if (loginStudent != null) {
					%>
					<div class="w3-container">
						<h4 class="w3-center">
							내 정보
							<form action="/eunsu/smyinfo" method="post">
								<input type="hidden" value="<%=loginStudent.getStudentNo()%>"
									name="empno"> <input type="hidden"
									value="<%=loginStudent.getStudentPassword()%>" name="emppass">
								<input type="submit" value="수정">
							</form>
						</h4>
						<p class="w3-center">
							<img src="<%=loginStudent.getStudentImage()%>"
								class="w3-circle" style="height: 106px; width: 106px"
								alt="Avatar">
						</p>
						<hr>
						<p>
							<i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i>
							<%=loginStudent.getStudentName()%></p>
						<p>
							<i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i>
							<%=loginStudent.getCategory()%></p>
						<p>
							<i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i>
							<%=loginStudent.getDepartmentname()%></p>
						<br> <a href="/eunsu/logout" style="text-decoration: none;">로그아웃</a>
					</div>
					<%
						}
					%>
				</div>
				<br>

				<!-- Accordion -->
				<%
					if (loginProfessor != null) {
				%>
				<div class="w3-card w3-round">
					<div class="w3-white">
						<button onclick="myFunction('Demo1')"
							class="w3-button w3-block w3-theme-l1 w3-left-align">
							<i class="fa fa-graduation-cap fa-fw w3-margin-right"></i> 강의 과목
							보기
						</button>
						<div id="Demo1" class="w3-hide w3-container">
							<p>
								<a href="/eunsu/classcheck?pno=<%=loginProfessor.getProfessorNo()%>">강의 과목 보기</a>
							</p>
						</div>
						<button onclick="myFunction('Demo2')"
							class="w3-button w3-block w3-theme-l1 w3-left-align">
							<i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> 성적
							입력
						</button>
						<div id="Demo2" class="w3-hide w3-container">
							<p>
								<a href="#" onclick="classUpdate();">성적 수정</a>
							</p>

							<form name="classUpdate2">
								<input type="hidden" name="professorNo"
									value="<%=loginProfessor.getProfessorNo()%>" />
							</form>
						</div>
						
					</div>
				</div>
				<%
					} else if (loginEmployee != null) {
				%>
				<div class="w3-card w3-round">
					<div class="w3-white">
						<button onclick="myFunction('Demo1')"
							class="w3-button w3-block w3-theme-l1 w3-left-align">
							<i class="fa fa-graduation-cap fa-fw w3-margin-right"></i> 과목 관리
						</button>
						<div id="Demo1" class="w3-hide w3-container">
							<p>
							<p>
								<a href="/eunsu/views/classcrud/classOpen.jsp">수강 신청 페이지 열기</a>
							</p>
							<p>
								<a href="/eunsu/views/classcrud/classinsert.jsp">과목 추가</a>
							</p>
							<p>
								<a href="/eunsu/classslist">과목 수정 및 삭제</a>
							</p>
							</p>
						</div>
						<button onclick="myFunction('Demo2')"
							class="w3-button w3-block w3-theme-l1 w3-left-align">
							<i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> 학과
							관리
						</button>
						<div id="Demo2" class="w3-hide w3-container">
							<p>
								<a href="/eunsu/views/departmentcrud/departmentinsert.jsp">학과
									추가</a>
							</p>
							<p>
								<a href="/eunsu/departmentlist">학과 수정 및 삭제</a>
							</p>
						</div>
						<button onclick="myFunction('Demo3')"
							class="w3-button w3-block w3-theme-l1 w3-left-align">
							<i class="fa fa-users fa-fw w3-margin-right"></i>학생 관리
						</button>
						<div id="Demo3" class="w3-hide w3-container">
							<p>
								<a href="/eunsu/views/studentcrud/studentinsert.jsp">학생 추가</a>
							</p>
							<p>
								<a href="/eunsu/slist">학생 수정 및 삭제</a>
							</p>
						</div>
						<button onclick="myFunction('Demo4')"
							class="w3-button w3-block w3-theme-l1 w3-left-align">
							<i class="fa fa-users fa-fw w3-margin-right"></i>교수 관리
						</button>
						<div id="Demo4" class="w3-hide w3-container">
							<p>
								<a href="/eunsu/views/professorcrud/professorinsert.jsp">교수
									추가</a>
							</p>
							<p>
								<a href="/eunsu/professorlist">교수 수정 및 삭제</a>
							</p>
						</div>
						<button onclick="myFunction('Demo5')"
							class="w3-button w3-block w3-theme-l1 w3-left-align">
							<i class="fa fa-users fa-fw w3-margin-right"></i>직원 관리
						</button>
						<div id="Demo5" class="w3-hide w3-container">
							<p>
								<a href="/eunsu/views/employeecrud/employeeinsert.jsp">직원 추가</a>
							</p>
							<p>
								<a href="/eunsu/employeelist">직원 수정 및 삭제</a>
							</p>
							
						</div>
					</div>
				</div>
				<%
					} else {
				%>
				<div class="w3-card w3-round">
					<div class="w3-white">
						<button onclick="myFunction('Demo1')"
							class="w3-button w3-block w3-theme-l1 w3-left-align">
							<i class="fa fa-graduation-cap fa-fw w3-margin-right"></i> 수강 신청
						</button>
						<div id="Demo1" class="w3-hide w3-container">
							<p>
								<a href="#" onclick="classEnroll();">신청하기</a>
							</p>

							<form name="classEnroll2">
								<input type="hidden" name="studentNo"
									value="<%=loginStudent.getStudentNo()%>" />
							</form>


						</div>
						<button onclick="myFunction('Demo2')"
							class="w3-button w3-block w3-theme-l1 w3-left-align">
							<i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> 수강
							과목 확인
						</button>
						<div id="Demo2" class="w3-hide w3-container">
							<p>
								<a href="#" onclick="gradeCheck();">성적 조회</a>
							</p>
						</div>
					
					</div>
				</div>
				<%
					}
				%>
				<br>



				<!-- End Left Column -->
			</div>
			<!-- End Grid -->
		<h1 align="center">공지사항</h1>
		<table align="center" border="1" cellspacing="0" cellpadding="3">
			<tr>
			<th>번호</th>
			<th>제목</th>
			<th>날짜</th>
			<th>글쓴이</th>
			<th>조회수</th>
			</tr>
			<% for(Notice d : list){ %>	
			<tr>
			<td width="50px"><%=d.getNoticeNo() %></td>
			<td width="500px"><a href="/eunsu/NoticeDetailServlet?nno=<%=d.getNoticeNo()%>&page=<%=currentPage%>"><%=d.getNoticeTitle() %></a></td>
			<td width="100px"><%=d.getNoticeDate() %></td>
			<td width="60px">관리자</td>
			<td width="50px"><%=d.getViews() %></td>
			</tr>
			<%} %>	
		</table>
		<br>
		<center>
		<%if(loginEmployee!=null){ %>
		<button onclick="location.href='/eunsu/views/noticecrud/noticeInsert.jsp'">새 게시글 등록</button>&nbsp;
		<%} %>
		</center>
		<br>
		<div id="pagebox" align="center">
			<a href="/eunsu/noticelist?page=1">|◁</a>&nbsp;
			<% if((beginPage - 10) < 1){ %>
			<a href="/eunsu/noticelist?page=1">◀◀</a>&nbsp;
			<%}else{ %>
			<a href="/eunsu/noticelist?page=<%= beginPage - 10%>">◀◀</a>&nbsp;
			<%} %>
			<% for(int p = beginPage; p <= endPage; p++){
				if(p == currentPage){%>
				<a href="/eunsu/noticelist?page=<%= p%>"><font color="red"><b>[<%=p %>]</b></font></a>&nbsp;			
				<%}else{ %>
				<a href="/eunsu/noticelist?page=<%= p%>"><%=p %></a>&nbsp;
				<%}} %>
			
			<% if((endPage + 10)>maxPage){%>
				<a href="/eunsu/noticelist?page=<%= maxPage%>">▶▶</a>&nbsp;
			<%}else{ %>
				<a href="/eunsu/noticelist?page=<%= endPage + 10%>">▶▶</a>&nbsp;
			<%} %>
				<a href="/eunsu/noticelist?page=<%= maxPage%>">▷|</a>&nbsp;
			
			
		</div>
		</div>
		<!-- End Page Container -->
	</div>
	<br>

	<!-- Footer -->
	<footer class="w3-container w3-theme-d3 w3-padding-16">
		<h5>서울특별시 강남구 테헤란로14길 6</h5>
		<h6>수은대학교 | Tel. 02-880-5114 | Fax. 02-885-5272 Copyright 2019 Su
			Eun University All Rights Reserved.</h6>
	</footer>

	<script>
		// Accordion
		function myFunction(id) {
			var x = document.getElementById(id);
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
				x.previousElementSibling.className += " w3-theme-d1";
			} else {
				x.className = x.className.replace("w3-show", "");
				x.previousElementSibling.className = x.previousElementSibling.className
						.replace(" w3-theme-d1", "");
			}
		}

		// Used to toggle the menu on smaller screens when clicking on the menu button
		function openNav() {
			var x = document.getElementById("navDemo");
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
			} else {
				x.className = x.className.replace(" w3-show", "");
			}
		}
	</script>

</body>
</html>
