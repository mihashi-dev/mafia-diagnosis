<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マフィア診断 - 最終問</title>
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
	color: #ff3333;
	font-size: 0.9em;
	font-weight: bold;
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
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="quiz-box">
		<p class="progress">FINAL QUESTION</p>

		<h2>Q5. めでたく大金を手に入れた！何に使う？</h2>

		<form action="DiagnosisServlet" method="POST">
			<input type="hidden" name="qNum" value="5"> <label><input
				type="radio" name="answerType" value="atk" required>
				「最新の武器や、自分の強さを示す高級車を買う」</label> <label><input type="radio"
				name="answerType" value="int"> 「次のビジネスの元手として投資する、または貯金する」</label> <label><input
				type="radio" name="answerType" value="coop">
				「お世話になった先輩や、部下たちを集めてド派手に奢る」</label>

			<button type="submit" class="btn">運命の診断結果へ ➔</button>
		</form>
	</div>
</body>
</html>