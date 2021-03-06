<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mobiland.model.Product"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<!DOCTYPE html>
<!--
        ustora by freshdesignweb.com
        Twitter: https://twitter.com/freshdesignweb
        URL: https://www.freshdesignweb.com/ustora/
-->
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Ustora products</title>

        <!-- Google Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/responsive.css">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="header-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="user-menu">
						
<!--edited by Hatem Al-Amir
	adding th login form to the top shortcut bar
-->

                        <ul>
							<c:choose>
								<c:when test="${not empty sessionScope && not empty sessionScope.customer}">
									<li><a href="profile.jsp"><i class="fa fa-user"></i> My Account</a></li>
									<li><a href="cart.jsp"><i class="fa fa-user"></i> My Cart</a></li>
								</c:when>
								
								<c:otherwise>
									<li><a href="signup.jsp"><i class="fa fa-user"></i> Sign up</a></li>

									<li>
										<a  data-toggle="collapse" href="#login-form-wrap-top" aria-expanded="false" aria-controls="login-form-wrap-top"><i class="fa fa-user"></i> Login</a>
									</li>

									<form id="login-form-wrap-top" class="login collapse" method="post" action="login-serv?page=searchResult.jsp">
										<p class="form-row form-row-first">
											<label for="username">Username or email <span class="required">*</span>
											</label>
											<input type="text" id="username-top" name="userName" class="input-text"  required="true" pattern= "[\w\.-]*[a-zA-Z0-9_]@[\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]"/>
										</p>
										<p class="form-row form-row-last">
											<label for="password">Password <span class="required">*</span>
											</label>
											<input type="password" id="password-top" name="password" class="input-text" required="true" />
										</p>
										<div class="clear"></div>

										<p class="form-row">
											<input type="submit" value="Login" name="login" class="button">
										</p>

										<div class="clear"></div>
									</form>

									<div id="loginFirstModal" class="modal fade" role="dialog">
										<div class="modal-dialog">
											<!-- Modal content-->
											<div class="modal-content">
											  <div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h4 class="modal-title">Be our guest!</h4>
											  </div>
											  <div class="modal-body">
												<p>Please login first</p>
											  </div>
											  <div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
											  </div>
											</div>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End header area -->
    
	<c:if test="${not empty param.status}">
		<c:choose>
			<c:when test="${param.status eq StatusHandler.ERR_DB_CONN}">
				<div class="alert alert-danger">
					<strong>Error!</strong> Internal database error.
				</div>
			</c:when>
			
			<c:when test="${param.status eq StatusHandler.ERR_LOGIN_EMAIL}">
				<div class="alert alert-danger">
					<strong>Error!</strong> Email does not exist.
				</div>
			</c:when>
			
			<c:when test="${param.status eq StatusHandler.ERR_LOGIN_PASSWD}">
				<div class="alert alert-danger">
					<strong>Error!</strong> Password is wrong.
				</div>
			</c:when>
		</c:choose>
    </c:if>
	
<!--end of edited part by Hatem Al-Amir-->

        <div class="site-branding-area">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="logo">
                            <h1><a href="./"><img src="img/logo.png"></a></h1>
                        </div>
                    </div>

                    <c:if test="${not empty sessionScope && not empty sessionScope.customer}">
						<div class="col-sm-6">
							<div class="shopping-item">
								<a href="cart.jsp">Cart<i class="fa fa-shopping-cart"></i></a>
							</div>
						</div>
					</c:if>
                </div>
            </div>
        </div> <!-- End site branding area -->

        <div class="mainmenu-area">
            <div class="container">
                <div class="row">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div> 
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
							<li class="active"><a href="index.jsp">Home</a></li>
							<li><a href="shop.jsp">Shop</a></li>
							<c:choose>
								<c:when test="${not empty sessionScope && not empty sessionScope.customer}">
									<li><a href="cart.jsp">Cart</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="signup.jsp">Sign up</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
                    </div>
                </div>
            </div>
        </div> <!-- End mainmenu area -->

        <div class="product-big-title-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-bit-title text-center">
                            <h2>Shop</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="single-product-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">

                    <c:if test="${!empty requestScope.products}">
                        <c:forEach items="${requestScope.products}" var="product">
                            <div class="col-md-3"+1+" col-sm-6">
                                <div class="single-shop-product">
                                    <div class="product-upper">
                                        <img src="GetImage?x=${product.productId}" alt="">
                                    </div>
                                    <h2><a href="">${product.desc}</a></h2>
                                    <div class="product-carousel-price">
                                        <ins>${product.price}</ins> <del>$999.00</del>
                                    </div>  

                                    <div class="product-option-shop">
                                        <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a>
                                    </div>                       
                                </div>    
                            </div>
                        </c:forEach>
                    </c:if>

                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-pagination text-center">
                            <nav>
                                <ul class="pagination">
                                    <li>
                                        <a href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <li><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li>
                                        <a href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>                        
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="footer-top-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="footer-about-us">
                            <h2>u<span>Stora</span></h2>
                            <p>uStora is one of the most prominent web sites in Egypt. We provide a wide variety of products that meet all needs and tastes.</p>
                            <div class="footer-social">
                                <a href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                                <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                                <a href="#" target="_blank"><i class="fa fa-youtube"></i></a>
                                <a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="footer-menu">
                            <h2 class="footer-wid-title">User Navigation </h2>
                            <ul>
                                <li><a href="">My account</a></li>
                                <li><a href="">Order history</a></li>
                                <li><a href="">Wishlist</a></li>
                                <li><a href="">Vendor contact</a></li>
                                <li><a href="">Front page</a></li>
                            </ul>                        
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="footer-menu">
                            <h2 class="footer-wid-title">Categories</h2>
                            <ul>
                                <li><a href="">Mobile Phone</a></li>
                                <li><a href="">Home accesseries</a></li>
                                <li><a href="">LED TV</a></li>
                                <li><a href="">Computer</a></li>
                                <li><a href="">Gadets</a></li>
                            </ul>                        
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="footer-newsletter">
                            <h2 class="footer-wid-title">Newsletter</h2>
                            <p>Sign up to our newsletter and get exclusive deals you wont find anywhere else straight to your inbox!</p>
                            <div class="newsletter-form">
                                <input type="email" placeholder="Type your email">
                                <input type="submit" value="Subscribe">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="copyright">
                            <p>&copy; 2015 uCommerce. All Rights Reserved. <a href="http://www.freshdesignweb.com" target="_blank">freshDesignweb.com</a></p>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="footer-card-icon">
                            <i class="fa fa-cc-discover"></i>
                            <i class="fa fa-cc-mastercard"></i>
                            <i class="fa fa-cc-paypal"></i>
                            <i class="fa fa-cc-visa"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Latest jQuery form server -->
        <script src="https://code.jquery.com/jquery.min.js"></script>

        <!-- Bootstrap JS form CDN -->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

        <!-- jQuery sticky menu -->
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.sticky.js"></script>

        <!-- jQuery easing -->
        <script src="js/jquery.easing.1.3.min.js"></script>

        <!-- Main Script -->
        <script src="js/main.js"></script>
    </body>
</html>
