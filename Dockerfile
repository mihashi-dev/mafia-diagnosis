# --- ステージ1: JavaコードをコンパイルしてWARファイルを作る（Mavenビルド） ---
FROM maven:3.8.8-eclipse-temurin-17 AS build
WORKDIR /app

# プロジェクトの全ファイルをコピー
COPY . .

# ディレクトリを移動してMavenビルドを実行 (テストはスキップ)
# ※GitHubのトップにMafiaDiagnosisフォルダがあるため、そこに移動してビルドします
RUN cd MafiaDiagnosis && mvn clean package -DskipTests

# --- ステージ2: 作成したWARファイルをTomcatに載せて起動する ---
FROM tomcat:10.1-jdk17-temurin
RUN rm -rf /usr/local/tomcat/webapps/*

# ステージ1で作ったWARファイルを、TomcatのROOT.warとしてコピー
COPY --from=build /app/MafiaDiagnosis/target/*.war /usr/local/tomcat/webapps/ROOT.war

CMD ["catalina.sh", "run"]