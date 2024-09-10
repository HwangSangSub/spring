<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	String htmlType = request.getParameter("htmlType") != null ? " class=\"" + request.getParameter("htmlType") + "\""  : "";
 %>
<!DOCTYPE html>
<html lang="ko"<%= htmlType %>>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="/images/common/kakao.png" property="og:image">
<title>IDI</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/plugins/mngr/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/plugins/mngr/yearpicker/yearpicker.css">
<link rel="stylesheet" href="/css/mngr/common.css">
<link rel="stylesheet" href="/css/mngr/layout.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=46933a30184f377cbde7d34d9d52b5d2&libraries=services,clusterer,drawing"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-ui-monthpicker@1.0.3/jquery.ui.monthpicker.min.js"></script>
<script src="https://cdn.tiny.cloud/1/o5nzwvdn4i5mi9gg0ugsp1ee96t9yzxahar0ixmic3754ycp/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
<script src="/plugins/mngr/qrcodejs-master/qrcode.min.js"></script>
<script src="/plugins/mngr/yearpicker/yearpicker.js"></script>
<script src="/js/mngr/layout.js"></script>
<script type="module">
	import {loading} from '/js/util/loading/loading.js';
	window.loading = loading;
</script>
</head>
<body class="box_layout">