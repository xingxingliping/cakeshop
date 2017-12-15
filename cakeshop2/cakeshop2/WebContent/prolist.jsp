<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> 
    addEventListener("load",
		function() { setTimeout(hideURLbar, 0); }, false);
        function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- //Custom Theme files -->
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<link href="css/form.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->	
<!-- cart -->
<script src="js/simpleCart.min.js"> </script>
<!-- cart -->
<!-- the jScrollPane script -->
<script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
		<script type="text/javascript" id="sourcecode">
			$(function()
			{
				$('.scroll-pane').jScrollPane();
			});
		</script>
<!-- //the jScrollPane script -->
<script type="text/javascript" src="js/jquery.mousewheel.js"></script>
<!-- the mousewheel plugin -->	
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<!-- js -->
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->	
<!-- cart -->
<script src="js/simpleCart.min.js"> </script>
<!-- cart -->
<title>商品列表</title>
<style>
.item{}
</style>
</head>
<body>
<%@include file="header.jsp" %>
	<!--products-->
	<div class="products">	 
		<div class="container">
			<h2>Our Products</h2>			
			<div class="col-md-9 product-model-sec">
				<div class="product-grid"> 
				<c:forEach items="${list }" var="list">		
						<div class="more-product"><span> </span></div>	
						<div class="item">
						<div class="product-img b-link-stripe b-animate-go  thickbox">
							<img src="${list.listimg}" class="img-responsive" alt="">
							<%-- <div class="b-wrapper">
								<h4 class="b-animate b-from-left  b-delay03">							
									<a href="content.action?proid=${list.proid }"><button>View</button></a>
								</h4>
							</div> --%>
						</div>				
					<div class="product-info simpleCart_shelfItem">
						<div class="product-info-cust prt_name">
							<h4>${list.proname}</h4>						
							<span class="item_price">￥:${list.price}</span>
								<input type="text" class="item_quantity" value="1" />
								<a href="content.action?proid=${list.proid }">
									<button class="item_add items" >Add</button>
								</a>
							<div class="clearfix"> </div>
						</div>												
					</div>
					</div>
					</c:forEach>
				</div>
							<div class="product-grid"> 
				<c:forEach items="${list }" var="list">		
						<div class="more-product"><span> </span></div>	
						<div class="item">
						<div class="product-img b-link-stripe b-animate-go  thickbox">
							<img src="${list.listimg}" class="img-responsive" alt="">
							<%-- <div class="b-wrapper">
								<h4 class="b-animate b-from-left  b-delay03">							
									<a href="content.action?proid=${list.proid }"><button>View</button></a>
								</h4>
							</div> --%>
						</div>				
					<div class="product-info simpleCart_shelfItem">
						<div class="product-info-cust prt_name">
							<h4>${list.proname}</h4>						
							<span class="item_price">￥:${list.price}</span>
								<input type="text" class="item_quantity" value="1" />
								<a href="content.action?proid=${list.proid }">
									<button class="item_add items" >Add</button>
								</a>
							<div class="clearfix"> </div>
						</div>												
					</div>
					</div>
					</c:forEach>
				</div>
							<div class="product-grid"> 
				<c:forEach items="${list }" var="list">		
						<div class="more-product"><span> </span></div>	
						<div class="item">
						<div class="product-img b-link-stripe b-animate-go  thickbox">
							<img src="${list.listimg}" class="img-responsive" alt="">
							<%-- <div class="b-wrapper">
								<h4 class="b-animate b-from-left  b-delay03">							
									<a href="content.action?proid=${list.proid }"><button>View</button></a>
								</h4>
							</div> --%>
						</div>				
					<div class="product-info simpleCart_shelfItem">
						<div class="product-info-cust prt_name">
							<h4>${list.proname}</h4>						
							<span class="item_price">￥:${list.price}</span>
								<input type="text" class="item_quantity" value="1" />
								<a href="content.action?proid=${list.proid }">
									<button class="item_add items" >Add</button>
								</a>
							<div class="clearfix"> </div>
						</div>												
					</div>
					</div>
					</c:forEach>
				</div>
			</div>
				<div class="col-md-3 rsidebar span_1_of_left">
				<section  class="sky-form">
					<div class="product_right">
						<h4 class="m_2"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>商品查询</h4>
						<div class="tab1">
							<ul class="place">								
								<a href="newProduct.action"><li class="sort">最新商品</li></a>
							</ul>
							<div class="clearfix"> </div>
					    </div>						  
						<div class="tab2">
							<ul class="place">								
								<a href="hotProduct.action"><li class="sort">最热商品</li></a>
							</ul>
							<div class="clearfix"> </div>
					    </div>
						<!--script-->
						<script>
							$(document).ready(function(){
								$(".tab1 .single-bottom").hide();
								$(".tab2 .single-bottom").hide();
								$(".tab3 .single-bottom").hide();
								$(".tab4 .single-bottom").hide();
								$(".tab5 .single-bottom").hide();
								
								$(".tab1 ul").click(function(){
									$(".tab1 .single-bottom").slideToggle(300);
									$(".tab2 .single-bottom").hide();
									$(".tab3 .single-bottom").hide();
									$(".tab4 .single-bottom").hide();
									$(".tab5 .single-bottom").hide();
								})
								$(".tab2 ul").click(function(){
									$(".tab2 .single-bottom").slideToggle(300);
									$(".tab1 .single-bottom").hide();
									$(".tab3 .single-bottom").hide();
									$(".tab4 .single-bottom").hide();
									$(".tab5 .single-bottom").hide();
								})
								$(".tab3 ul").click(function(){
									$(".tab3 .single-bottom").slideToggle(300);
									$(".tab4 .single-bottom").hide();
									$(".tab5 .single-bottom").hide();
									$(".tab2 .single-bottom").hide();
									$(".tab1 .single-bottom").hide();
								})
								$(".tab4 ul").click(function(){
									$(".tab4 .single-bottom").slideToggle(300);
									$(".tab5 .single-bottom").hide();
									$(".tab3 .single-bottom").hide();
									$(".tab2 .single-bottom").hide();
									$(".tab1 .single-bottom").hide();
								})	
								$(".tab5 ul").click(function(){
									$(".tab5 .single-bottom").slideToggle(300);
									$(".tab4 .single-bottom").hide();
									$(".tab3 .single-bottom").hide();
									$(".tab2 .single-bottom").hide();
									$(".tab1 .single-bottom").hide();
								})	
							});
						</script>
						<!--//script -->	
					</div>
				</section>
				<section  class="sky-form">
					<h4><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>DISCOUNTS</h4>
					<div class="row row1 scroll-pane">
						<div class="col col-4">
							<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Upto - 10% (20)</label>
						</div>
						<div class="col col-4">
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>70% - 60% (5)</label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>50% - 40% (7)</label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>30% - 20% (2)</label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>10% - 5% (5)</label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>30% - 20% (7)</label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>10% - 5% (2)</label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Other(50)</label>
						</div>
					</div>
				</section>  				 
				<section  class="sky-form">
					<h4><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Price</h4>
					<ul class="dropdown-menu1">
						<li><a href="">								               
							<div id="slider-range"></div>							
							<input type="text" id="amount" style="border: 0; font-weight: NORMAL;   font-family: 'Dosis-Regular';" />
							</a></li>			
					</ul>
				</section>
				<!---->
				<script type="text/javascript" src="js/jquery-ui.min.js"></script>
				<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
					<script type='text/javascript'>//<![CDATA[ 
						$(window).load(function(){
						 $( "#slider-range" ).slider({
									range: true,
									min: 0,
									max: 100000,
									values: [ 500, 100000 ],
									slide: function( event, ui ) {  $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
									}
						 });
						$( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) + " - $" + $( "#slider-range" ).slider( "values", 1 ) );

						});//]]> 
					</script>
				<!---->
				<section  class="sky-form">
					<h4><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>By Flavour</h4>
					<div class="row row1 scroll-pane">
						<div class="col col-4">
							<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Vanilla</label>			
						</div>
						<div class="col col-4">
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Chocolate</label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Butterscotch</label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Strawberry</label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Black Forest</label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Mixed Fruit</label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Honey</label>
						</div>
					</div>
				</section>
				<section  class="sky-form">
					<h4><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Weight</h4>
					<div class="row row1 scroll-pane">
						<div class="col col-4">
							<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Half KG</label>
						</div>		
						<div class="col col-4">
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>One KG</label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>TwO KG</label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>More</label>
						</div>
					</div>
				</section>	
				<section  class="sky-form">
					<h4><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Color</h4>
					<div class="row row1 scroll-pane">
						<div class="col col-4">
							<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>White</label>
						</div>
						<div class="col col-4">
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Pink</label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Gold</label>
							<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Silver</label>
						</div>
					</div>
				</section>			 
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<!--//products-->	
<%@include file="footer.jsp" %>
</body>
</html>