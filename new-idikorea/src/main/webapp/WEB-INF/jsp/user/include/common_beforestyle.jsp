<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ page import="com.brighten.idi.util.SessionUtil" %>


<%
request.setCharacterEncoding("UTF-8");
String pagetype = request.getParameter("pagetype");
String pagename = request.getParameter("pagename");
String pagetxt = request.getParameter("pagetxt");
String [] cssBaseLinks = request.getParameterValues("cssBaseLinks");
String [] cssLinks = request.getParameterValues("cssLinks");
String navId = request.getParameter("navId");

String pathBase = "";
String pathPage = "";
String siteName = "이디코리아";
Boolean isLogin = SessionUtil.isLogin(); 
if(SessionUtil.isLogin()){
	request.setAttribute("isLogin", SessionUtil.isLogin());
	request.setAttribute("memberNo", SessionUtil.getMemberNo());
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<script>
const isLogin = `${isLogin}`;
const memberNo = `${memberNo}`;
</script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta name='Description' content="160년 피부 과학이 탄생시킨 유럽이 인정한 프리미엄 화장품 이디코리아" />
    <meta name='Keywords' content="이디코리아, IDI KOREA, 프리미엄 화장품" />
    <meta content="website" property="og:type">
    <meta content="IDI KOREA" property="og:site_name" />
    <meta content="IDI KOREA" property="og:title">
    <meta content="160년 피부 과학이 탄생시킨 유럽이 인정한 프리미엄 화장품 이디코리아" property="og:description">
    <meta content="http://www.mariasons.or.kr/img/apostolate_3.jpg" property="og:image">
    <title><%=siteName%></title>
    

    <link rel="stylesheet" href="https://code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/css/vendors/jquery-ui/jquery-ui.min.css">
    <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"    />    
    <link rel="stylesheet" href="<%=pathBase%>/css/vendors/swiper/swiper-bundle.min.css">

    
    <% if(cssBaseLinks != null ) { %>

        <% for(String link : cssBaseLinks ) { %>
            <link rel="stylesheet" href="<%=pathBase%>/css/<%=link%>.css">
        <% } %>

    <% } %>

    <link rel="stylesheet" href="/css/user/compile/style.css">
    <link rel="stylesheet" href="/css/user/before/user/layout.css">
    
    
    <% if(cssLinks != null ) { %>

        <% for(String link : cssLinks ) { %>
            <link rel="stylesheet" href="<%=pathBase%>/css/<%=link%>.css">
        <% } %>

    <% } %>



    <!-- js -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.14.0/jquery-ui.min.js" integrity="sha256-Fb0zP4jE3JHqu+IBB9YktLcSjI1Zc6J2b6gTjB0LpoM=" crossorigin="anonymous"></script>
    <script defer src="/js/vendors/jquery-ui/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="<%=pathBase%>/js/vendors/swiper/swiper-bundle.min.js"></script>    
    <script src="/js/user/common/common.js" defer></script>
    

    <script language=javascript>
        const pagetype = "<%=pagetype%>";
        const pagename = "<%=pagename%>";
        const navId = "<%=navId%>";
    </script>
    
</head>
<body>