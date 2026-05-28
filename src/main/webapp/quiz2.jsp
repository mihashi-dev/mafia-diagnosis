<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マフィア診断 - 第2問</title>
<style>
body {
	background-color: #1a1a1a;
	color: #fff;
	font-family: sans-serif;
	padding: 50px;
}

.quiz-box {
	max-width: 600px;
	margin: 0 auto;
	background: #262626;
	padding: 30px;
	border-left: 5px solid #ff3333;
}

.progress {
	color: #888;
	font-size: 0.9em;
}

label {
	display: block;
	background: #333;
	margin: 10px 0;
	padding: 15px;
	border-radius: 5px;
	cursor: pointer;
}

label:hover {
	background: #444;
}

.btn {
	background: #8b0000;
	color: white;
	padding: 10px 25px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="quiz-box">
		<p class="progress">QUESTION 2 / 5</p>
		<h2>Q2. 敵対組織の幹部が、こちらの縄張りに一人で迷い込んできた。どうする？</h2>

		<form action="DiagnosisServlet" method="POST">
			<input type="hidden" name="qNum" value="2"> <label><input
				type="radio" name="answerType" value="atk" required>
				「今すぐ仕留める。絶好のチャンスを逃す手はない」</label> <label><input type="radio"
				name="answerType" value="int"> 「あえて見逃して尾行し、敵のアジトを突き止める」</label> <label><input
				type="radio" name="answerType" value="coop">
				「囲んで脅し、こちらのスパイにならないか交渉する」</label>

			<button type="submit" class="btn">次へ進む ➔</button>
		</form>
	</div>
</body>
</html>