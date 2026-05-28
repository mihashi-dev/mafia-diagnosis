<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マフィア診断 - 第1問</title>
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
		<p class="progress">QUESTION 1 / 5</p>

		<h2>Q1. 組織の入団テスト。あなたならどう自分をアピールする？</h2>

		<form action="DiagnosisServlet" method="POST">
			<input type="hidden" name="qNum" value="1"> <label><input
				type="radio" name="answerType" value="atk" required>
				「売られた喧嘩は100%買います。前線なら任せてください」</label> <label><input type="radio"
				name="answerType" value="int">
				「街の裏ルートの人間関係や、金の流れをすべて把握しています」</label> <label><input type="radio"
				name="answerType" value="coop">
				「どんなに気難しいボスの下でも、絶対に裏切らず忠誠を誓います」</label>

			<button type="submit" class="btn">次へ進む ➔</button>
		</form>
	</div>
</body>
</html>