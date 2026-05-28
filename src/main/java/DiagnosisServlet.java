import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DiagnosisServlet")
public class DiagnosisServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		// 画面から送られてきたデータを受け取る
		String qNumStr = request.getParameter("qNum");
		String answerType = request.getParameter("answerType");

		int qNum = (qNumStr != null) ? Integer.parseInt(qNumStr) : 0;

		// 【スタート画面から来た場合】セッションを初期化して第1問へ
		if (qNum == 0) {
			session.setAttribute("atk", 0);
			session.setAttribute("int", 0);
			session.setAttribute("coop", 0);
			request.getRequestDispatcher("/quiz1.jsp").forward(request, response);
			return;
		}

		// 【回答の集計処理】選んだタイプに応じてセッションの数値を+3する
		if (answerType != null) {
			int currentAtk = (int) session.getAttribute("atk");
			int currentInt = (int) session.getAttribute("int");
			int currentCoop = (int) session.getAttribute("coop");

			if ("atk".equals(answerType))
				session.setAttribute("atk", currentAtk + 3);
			if ("int".equals(answerType))
				session.setAttribute("int", currentInt + 3);
			if ("coop".equals(answerType))
				session.setAttribute("coop", currentCoop + 3);
		}

		// 【画面遷移のコントロール】
		if (qNum < 5) {
			// 1〜4問目なら、次の質問JSPへ飛ばす（例: qNum=1 なら quiz2.jsp へ）
			int nextQNum = qNum + 1;
			request.getRequestDispatcher("/quiz" + nextQNum + ".jsp").forward(request, response);

		} else {
			// 【最終問（5問目）が終わったら判定ロジック発動！】
			int finalAtk = (int) session.getAttribute("atk");
			int finalInt = (int) session.getAttribute("int");
			int finalCoop = (int) session.getAttribute("coop");

			String resultTitle = "";
			String resultDetail = "";

			// if文ゴリゴリポイント（合計15点満点中の配分で判定）
			if (finalAtk >= 12) {
				resultTitle = "特攻隊長（ヒットマン）";
				resultDetail = "考える前に体が動く、前線特化型の武闘派。圧倒的な戦闘力でファミリーの障壁を粉砕する、組織の最強兵器です。";
			} else if (finalInt >= 12) {
				resultTitle = "冷徹な参謀（コンシリエーレ）";
				resultDetail = "感情を一切排除し、論理と計算だけで組織を勝利へ導く影の支配者。ボスの右腕として恐れられる存在です。";
			} else if (finalCoop >= 12) {
				resultTitle = "お調子者の情報屋";
				resultDetail = "街の裏路地に深く根を張る顔役。軽薄な態度とは裏腹に、掴んだ秘密と人脈で組織の命脈を握っています。";
			} else if (finalAtk >= 6 && finalInt >= 6) {
				resultTitle = "絶対的ボス（首領）";
				resultDetail = "圧倒的なカリスマ、武力、そして知略。すべてを高次元で併せ持つ、組織の絶対にして唯一の頂点です。";
			} else {
				resultTitle = "闇の武器商人（調達屋）";
				resultDetail = "カネとビジネス、己の職人技しか信じない孤高の存在。彼が手を引けば組織は干上がる、隠れた重要人物です。";
			}

			// 結果画面に渡すデータをリクエストに詰める
			request.setAttribute("title", resultTitle);
			request.setAttribute("detail", resultDetail);

			// 使い終わったセッションをクリア
			session.invalidate();

			// 結果画面JSPへフォワード
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		}
	}
}