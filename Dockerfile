# 実行環境としてTomcat10を使用
FROM tomcat:10.1-jdk17-temurin

# 最初から入っている不要な初期アプリを削除
RUN rm -rf /usr/local/tomcat/webapps/*

# Eclipseでエクスポートした「ROOT.war」を、Tomcatのwebappsフォルダにコピー
COPY ./ROOT.war /usr/local/tomcat/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]