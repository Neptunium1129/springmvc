<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<title>SPRING_PROJECT</title>
	<style type="text/css">
	.ajaxLayer {
		display: none;
		position: fixed;
		_position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		z-index: 100;
	}
	
	.ajaxLayer .ajaxLayer-bg {
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background: #DBDBDB;
		opacity: .5;
		filter: alpha(opacity = 50);
	}
	
	.ajaxLayer .ajaxLayerImg {
		display: block;
	}
	
	.ajaxLayerImg {
		display: none;
		position: absolute;
		top: 50%;
		left: 50%;
		width: 128px;
		height: auto;
		z-index: 10;
	}
	</style>
	<link  href="/resources/css/fotorama.css" rel="stylesheet">
	<script src="/resources/js/jquery-2.1.1.min.js"></script>
	<script src="/resources/js/jquery.form.js"></script>
	<script src="/resources/js/jquery.cookie.js"></script>
	<script src="/resources/ckeditor/ckeditor.js"></script>
	<script src="/resources/js/fotorama.js"></script>
	<script src="/resources/js/angular.1.4.8.min.js"></script>
	<script src="/resources/js/show_img.js"></script>
	<script type="text/javascript" src="/resources/js/rsa/jsbn.js"></script>
	<script type="text/javascript" src="/resources/js/rsa/rsa.js"></script>
	<script type="text/javascript" src="/resources/js/rsa/prng4.js"></script>
	<script type="text/javascript" src="/resources/js/rsa/rng.js"></script>
	<script>
	
		$(document).ready(function(){
		    if( '' != $.cookie("MAIL") ) {
		        $("#mail").val($.cookie("MAIL"));
		    }
		    $('#frm1').ajaxForm({
		        dataType : 'text', 
		        beforeSerialize: function(){
		             // form을 직렬화하기전 엘레먼트의 속성을 수정할 수도 있다.            
		        },
		        beforeSubmit : function() {
		        	openAjaxLayer();
		        //action에 걸어주었던 링크로 가기전에 실행 ex)로딩중 표시를 넣을수도 있다.
		        },
		        success : function(data) {
		        	$('.ajaxLayer').hide();
		             //컨트롤러 실행 후 성공시 넘어옴
		            alert(data);            
		        }
		    });
		});
	
		function doAjax() {
			openAjaxLayer();
			var message = $('#message').val();
			$.ajax({
				type : "POST",
				url : "/ajax",
				data : {
					message : message
				},
				dataType : "json"
			//contentType: "application/json; charset=utf-8"
			}).done(function(msg) {
				$('.ajaxLayer').hide();
				//alert(msg.message);
				//var html = '<div>'+msg.message+'</div>';
				$('#test_Div').html(msg.message);
			});
		}
		
		function doRSA() {
			var userID = $('#userID').val();
			var userPW = $('#userPW').val();
			if( '' == userID || '' == userPW ){
				alert('아이디와 패스워드를 입력해주세요.');
				return false;
			}
			var rsaPublicKeyModulus = $('#rsaPublicKeyModulus').val();
			var rsaPublicKeyExponent = $('#rsaPublicKeyExponent').val();
			var rsa = new RSAKey();
			rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent);
			rsa.encrypt(userPW);
			var encPassword = rsa.encrypt(userPW);
			alert(encPassword);
			$('#encPw').val(encPassword);
			$('#frm2').submit();
		}
		
		function openAjaxLayer() {
			var ajaxLayer = $('.ajaxLayerImg');
			$('.ajaxLayer').show();
			if (ajaxLayer.outerHeight() < $(document).height())
				ajaxLayer.css('margin-top', '-' + ajaxLayer.outerHeight() / 2
						+ 'px');
			else
				ajaxLayer.css('top', '0px');
			if (ajaxLayer.outerWidth() < $(document).width())
				ajaxLayer.css('margin-left', '-' + ajaxLayer.outerWidth() / 2
						+ 'px');
			else
				ajaxLayer.css('left', '0px');
			return false;
		}
		
		function sendMail() {
			openAjaxLayer();
			var mail = $('#mail').val();
			$.cookie("MAIL", $("#mail").val(), { expires: 30 });
			$.ajax({
				type : "POST",
				url : "/mail",
				data : {
					mail : mail
				},
				dataType : "json"
			//contentType: "application/json; charset=utf-8"
			}).done(function(msg) {
				$('.ajaxLayer').hide();
				if ( 'Y' == msg.isSuccess ) {
					alert('메일이 정상적으로 발송되었습니다.');
				} else {
					alert('시스템 에러가 발생했습니다.');
				}
			});
		}
		
	/* 	$(function(){
			var name = $('#userName');
			var greeting = $('#greeting');
			name.keyup(function(){
				greeting.text('Hello ' + name.val() + '!');
			});
		}) */
		
		var app = angular.module('myApp', []);
		app.controller('UserSearchController', function($scope, $http) {
		    $scope.myFunc = function() {
		    	var name = $scope.searchKeyword;
				if ('' != name) {
			    	$http.get('/member/jsonList?name='+$scope.searchKeyword).success(
		    			function(data){
		    				$scope.members = data;
		    			}
		    		);
				}else{
					$scope.members = '';
				}
		    }
		});
		
		function enterChat(){
			var nick = $.trim($('#nick').val());			
			if( 0 == nick.length ) {
				alert('대화명을 입력해주세요.');
				$('#nick').focus();
				return false;
			}
			document.location.href = '/enterChat?nick=' + nick;
		}
		
	</script>
</head>
<body>
	<h1>Hello world!</h1>
	<div class="fotorama" data-autoplay="1500">
		<c:forEach var="i" begin="1" end="6">
			<img src="/resources/images/gallery/image_${i }.jpg">
		</c:forEach>
	  
	</div>
	<div class="ajaxLayer">
		<div class="ajaxLayer-bg"></div>
		<div class="ajaxLayerImg">
			<img src="/resources/images/ajax-loader.gif" width="128" height="128" />
		</div>
	</div>
	<a href="/member/list">회원관리</a><br>
	<br>
	<input type="text" id="nick" placeholder="대화명"/>
	<input type="button" value="채팅방 입장" onclick="enterChat();return false;"/>
	<br>
	<P>The time on the server is ${fn:substring(serverTime,0,12)}</P>
	<br>
	<c:if test="${!empty originalFileName}">
		<P>OriginalFileName is ${originalFileName}.</P>
		<img src="/resources/upload/${originalFileName}" />
	</c:if>
	<form id="frm1" action="/upload" method="post" enctype="multipart/form-data">
		<input type="file" name="file" />
		<br>
		<input type="file" name="file" />
		<br>
		<input type="submit"/>
	</form>
	<br>
	<a href="/download">파이썬 교재 다운받기</a>
	<br><br>
	<input type="text" name="message" id="message" />
	<input type="button" onclick="doAjax()" value="AJAX" />
	<br>
	<div id="test_Div"></div>
	<br>
	<input type="text" name="mail" id="mail" />
	<input type="button" onclick="sendMail()" value="Mail" />
	<br>
	<br>
	패스워드 : ${decPW }
	<br>
	<form id="frm2" action="/rsa" method="post">
		<input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus}"/>
		<input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent}"/>
		<input type="hidden" name="encPw" id="encPw"/>
		<input type="text" name="id" id="userID" placeholder="아이디"/>
		<br>
		<input type="text" name="pw" id="userPW" placeholder="패스워드"/>
		<br>
		<input type="button" onclick="doRSA()" value="RSA" />
	</form>
	<br>
	<div ng-app="myApp" ng-controller="UserSearchController">
		<input type="text" ng-keyup="myFunc()" ng-model="searchKeyword" placeholder="AngularJS"/>
		<!-- <h2 id="greeting">Hello {{userName}}!</h2> -->
		<ul>
			<li ng-repeat="member in members">
				아이디 : {{member.id}}<br />
				아이디 : {{member.name}}<br />
				전화번호 : {{member.phone}}<br />
				나이 : {{member.age}}
			</li>
		</ul>
	</div>
	<br>
	<textarea class="ckeditor" cols="80" id="content" name="content" rows="10">
	</textarea>
	<br>
	<input type="file" id="take-picture" accept="image/*">
	<br>
	<img style="border-radius:50%;width:200px;hegiht:200px" src="/resources/images/no_img.jpg" alt="" id="show-picture">
</body>
</html>
