<%@page import="com.inquiry.model.StudentCourse"%>
<%@page import="java.util.List"%>
<%@page import="com.inquiry.model.StudentDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Update Status</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Glance Design Dashboard Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />

<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />

<!-- font-awesome icons CSS -->
<link href="css/font-awesome.css" rel="stylesheet">
<!-- //font-awesome icons CSS-->

<!-- side nav css file -->
<link href='css/SidebarNav.min.css' media='all' rel='stylesheet'
	type='text/css' />
<!-- //side nav css file -->

<!-- js-->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/modernizr.custom.js"></script>

<!--webfonts-->
<link
	href="//fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i&amp;subset=cyrillic,cyrillic-ext,latin-ext"
	rel="stylesheet">
<!--//webfonts-->

<!-- chart -->
<script src="js/Chart.js"></script>
<!-- //chart -->

<!-- Metis Menu -->
<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<link href="css/custom.css" rel="stylesheet">
<!--//Metis Menu -->
<style>
#chartdiv {
	width: 100%;
	height: 295px;
}
</style>

<!-- requried-jsfiles-for owl -->
<link href="css/owl.carousel.css" rel="stylesheet">
<script src="js/owl.carousel.js"></script>
<script>
							$(document).ready(function() {
								$("#owl-demo").owlCarousel({
									items : 3,
									lazyLoad : true,
									autoPlay : true,
									pagination : true,
									nav:true,
								});
							});
						</script>
<!-- //requried-jsfiles-for owl -->
</head>
<%
	session=request.getSession(false);  
	String uname=(String)session.getAttribute("uname");
	if(uname == null) 
	{
		response.sendRedirect("Login");		
	}
%>
<body class="cbp-spmenu-push">
	<div class="main-content">
		<div class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left"
			id="cbp-spmenu-s1">
			<!--left-fixed -navigation-->
			<aside class="sidebar-left">
				<nav class="navbar navbar-inverse">
					<div class="navbar-header">
						<h1>
							<a class="navbar-brand" href="index.html"><span
								class="fa fa-area-chart"></span> Inquiry<span
								class="dashboard_text">Design dashboard</span></a>
						</h1>
					</div>
					<div>
						<ul class="sidebar-menu">
							<li class="header">MAIN NAVIGATION</li>
							<li class="treeview">
								<a href="index"> 
									<i class="fa fa-dashboard"></i> 
									<span>Dashboard</span>
								</a>
							</li>
							<li class="treeview">
							  <a href="ViewCourse">
							  <i class="fa fa-book"></i> <span>View Course</span>
							  </a>
							</li>
							<li class="treeview">
								<a href="InquiryForm"> 
									<i class="fa fa-edit"></i>
									<span>Add Inquiry</span>
								</a>
							</li>
							<li class="treeview">
								<a href="ViewInquiry"> 
									<i class="fa fa-table"></i> 
									<span>View Inquiry</span>
								</a>
							</li>
							<li class="treeview">
				                <a href="ViewStudent" style="background-color: black">
				                <i class="fa fa-users"></i> <span>View Student</span>
				                </a>
				            </li>
				            <li class="treeview">
				                <a href="ViewFees">
				                <i class="fa fa-dollar"></i> <span>Fees</span>
				                </a>
				            </li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</nav>
			</aside>
		</div>
	</div>
	<!--left-fixed -navigation-->

	<!-- header-starts -->
		<div class="sticky-header header-section ">
		<div class="header-left">
				<!--toggle button start-->
				<button id="showLeftPush"><i class="fa fa-bars"></i></button>
				<!--toggle button end-->
		</div>
			<div class="header-right">
				<div class="profile_details">		
					<ul>
						<li class="dropdown profile_details_drop">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
								<div class="profile_img">	
									<span class="prfil-img"><img src="images/2.jpg" alt=""> </span> 
									<div class="user-name">
										<p><%=uname %></p>
										<span>Administrator</span>
									</div>
									<i class="fa fa-angle-down lnr"></i>
									<i class="fa fa-angle-up lnr"></i>
									<div class="clearfix"></div>	
								</div>	
							</a>
							<ul class="dropdown-menu drp-mnu"> 
								<%
								if(uname == null)
								{
									
								}
								else if(uname.equals("jaymodi99"))
								{
								%>
									<li> <a href="Setting"><i class="fa fa-cog"></i> Settings</a> </li>
									<li> <a href="SignUp"><i class="fa fa-user"></i> Sign Up</a> </li> 
								<%
								}
								%>
								<li> <a href="Profile"><i class="fa fa-suitcase"></i> Profile</a> </li> 
								<li> <a href="LogoutController"><i class="fa fa-sign-out"></i> Logout</a> </li>
							</ul>
						</li>
					</ul>
				</div>			
			</div>
		</div>
		<!-- //header-ends -->

	<!-- main content start-->
	
<%
	StudentDetails student = (StudentDetails)request.getAttribute("student");
	List<StudentCourse> list11 = student.getStudentCourse();
	for(StudentCourse studentCourse :list11)
	{
		if(studentCourse.getStatus() == 0)
		{
%>
	
	<div id="page-wrapper">
		<div class="main-page">
			<div class="row">
				<h3 class="title1">Update Status :</h3>
				<div class="form-three widget-shadow">
					<form class="form-horizontal" action="UpdateStudentStatusController" method="post">
					<input type="hidden" class="form-control1" id="focusedinput" name="id" value="<%=student.getID() %>">
						<div class="form-group">
							<label for="focusedinput" class="col-sm-2 control-label">Date of Joining</label>
							<div class="col-sm-8">
								<input type="date" class="form-control1" id="focusedinput" name="joiningDate" value="<%=studentCourse.getJoining_date() %>" disabled>
							</div>
						</div>
						<div class="form-group">
							<label for="focusedinput" class="col-sm-2 control-label">Student Name</label>
							<div class="col-sm-8">
								<input type="text" class="form-control1" id="focusedinput" name="studentName" value="<%=student.getStudent_name() %>" disabled>
							</div>
						</div>
						<div class="form-group">
							<label for="focusedinput" class="col-sm-2 control-label">Mobile Number</label>
							<div class="col-sm-8">
								<input type="number" class="form-control1" id="focusedinput" name="mobileNumber" value="<%=student.getMob_no() %>" disabled>
							</div>
						</div>
						<div class="form-group">
							<label for="focusedinput" class="col-sm-2 control-label">Course</label>
							<div class="col-sm-8">
								<input type="text" class="form-control1" id="focusedinput" name="course" value="<%=studentCourse.getCourse() %>" disabled>
							</div>
						</div>
						<div class="form-group">
							<label for="focusedinput" class="col-sm-2 control-label">Teacher Appointed</label>
							<div class="col-sm-8">
								<input type="text" class="form-control1" id="focusedinput" name="teacherAppointed" value="<%=studentCourse.getTeacher() %>" disabled>
							</div>
						</div>
						<div class="form-group">
							<label for="focusedinput" class="col-sm-2 control-label">Fees</label>
							<div class="col-sm-8">
								<input type="number" class="form-control1" id="focusedinput" name="fees" value="<%=studentCourse.getFees() %>" disabled>
							</div>
						</div>
						<div class="form-group">
							<label for="focusedinput" class="col-sm-2 control-label">Fees Paid</label>
							<div class="col-sm-8">
								<input type="number" class="form-control1" id="focusedinput" name="feesPaid" value="<%=studentCourse.getFeesPaid() %>" disabled>
							</div>
						</div>
						<div class="form-group">
							<label for="selector1" class="col-sm-2 control-label">Choose Status</label>
							<div class="col-sm-8">
								<select name="status" id="selector1" class="form-control1">
									<option value="1">Completed</option>
									<option value="2">Discontinue</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="focusedinput" class="col-sm-2 control-label">Score</label>
							<div class="col-sm-8">
								<input type="number" class="form-control1" id="focusedinput" name="score"placeholder="Enter Score (Enter 0 if Discontinued)" required>
							</div>
						</div>
						<div class="form-group">
							<label for="selector1" class="col-sm-2 control-label">Certificate Given</label>
							<div class="col-sm-8">
								<select name="certificate" id="selector1" class="form-control1">
									<option value="0">No</option>
									<option value="1">Yes (Only if Course is Completed)</option>
								</select>
							</div>
						</div>
						<div class="col-sm-offset-2">
							<button type="submit" class="btn btn-default">Submit</button>
							<button type="reset" class="btn btn-default" onClick="window.location.replace('ViewStudent')">Cancel</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<%
		}
	}
%>
	<!-- main contents end -->

	<!-- Classie -->
	<!-- for toggle left push menu script -->
	<script src="js/classie.js"></script>
	<script>
			var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
				showLeftPush = document.getElementById( 'showLeftPush' ),
				body = document.body;
				
			showLeftPush.onclick = function() {
				classie.toggle( this, 'active' );
				classie.toggle( body, 'cbp-spmenu-push-toright' );
				classie.toggle( menuLeft, 'cbp-spmenu-open' );
				disableOther( 'showLeftPush' );
			};
			

			function disableOther( button ) {
				if( button !== 'showLeftPush' ) {
					classie.toggle( showLeftPush, 'disabled' );
				}
			}
		</script>
	<!-- //Classie -->
	<!-- //for toggle left push menu script -->


	<!--scrolling js-->
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/scripts.js"></script>
	<!--//scrolling js-->

	<!-- side nav js -->
	<script src='js/SidebarNav.min.js' type='text/javascript'></script>
	<script>
      $('.sidebar-menu').SidebarNav()
    </script>
	<!-- //side nav js -->

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.js"> </script>
	<!-- //Bootstrap Core JavaScript -->
	
	<!--Confirm Delete javaScript-->
	<script>
		function submitConfirm() {
			var r = confirm("Fees not Paid");
			if (r == false) {
				document.getElementById("submitConfirm").href="#";
			  } else{
				  document.getElementById("submitConfirm").href="#";
			  }
		}
	</script>

</body>
</html>