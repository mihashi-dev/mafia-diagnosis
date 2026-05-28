<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>診断結果 - マフィア組織適性診断</title>
<style>
body {
	background-color: #1a1a1a;
	color: #fff;
	font-family: sans-serif;
	text-align: center;
	padding-top: 80px;
}

.result-container {
	max-width: 600px;
	margin: 0 auto;
	padding: 40px;
	border: 3px double #ff3333;
	background-color: #262626;
}

.title-label {
	color: #888;
	font-size: 0.9em;
	letter-spacing: 3px;
}

.result-title {
	color: #ff3333;
	font-size: 2.5em;
	margin: 15px 0;
	font-weight: bold;
}

.result-detail {
	line-height: 1.8;
	color: #ddd;
	background: #1a1a1a;
	padding: 20px;
	border-radius: 5px;
	text-align: left;
}

.btn {
	display: inline-block;
	background-color: #333;
	color: white;
	padding: 10px 20px;
	text-decoration: none;
	border-radius: 3px;
	margin-top: 30px;
	border: 1px solid #555;
}

.btn:hover {
	background-color: #444;
}
</style>
</head>
<body>
	<div class="result-container">
		<div class="title-label">YOUR POSITION IS...</div>

		<div class="result-title">${title}</div>

		<p class="result-detail">${detail}</p>

		<a href="index.html" class="btn">もう一度診断する</a>
	</div>
</body>
</html>