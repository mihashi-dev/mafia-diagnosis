# Tomcatの実行環境を用意
FROM tomcat:10.1-jdk17-temurin

# 念のためデフォルトのアプリを削除
RUN rm -rf /usr/local/tomcat/webapps/*

# Eclipseのビルド成果物（WARファイルまたはWebContentの中身）をTomcatにデプロイ
# ※通常、EclipseのWebContent（またはwebapp）の中身をROOTとしてコピーします
COPY ./WebContent /usr/local/tomcat/webapps/ROOT

# Tomcatの起動
CMD ["catalina.sh", "run"]