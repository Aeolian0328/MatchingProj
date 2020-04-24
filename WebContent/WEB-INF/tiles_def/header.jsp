<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" style="background-color: #e3f2fd; id="mainNav"> -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top py-3" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="main.do">MatchingService</a><button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto my-2 my-lg-0">
                      
                        <c:if test="${loginData.who eq 't'}">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="upload.do">강좌 업로드</a></li>
                        </c:if>
                        <c:if test="${loginData.who eq 's'}">
          				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="index1.do?name=컴퓨터">수강신청</a></li>
          				</c:if>
          				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="graph1.do">통계</a></li>
          				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="BoardList.do">QnA</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" id = "logIn" href="loginSelect.do">로그인</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="RegistSelect.do">회원가입</a></li>

               
                          <c:if test="${loginData.name ne null}">
                        	<li class="nav-item"><a class="nav-link js-scroll-trigger" onclick="logout()">로그아웃</a></li>
                        	<li class="nav-item"><a class="nav-link js-scroll-trigger" href="index" >[회원 : ${loginData.name}]</a></li>
                        </c:if>
                         
                    </ul>
                </div>
            </div>
        </nav>
