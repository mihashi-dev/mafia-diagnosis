# Tomcatの実行環境を用意
FROM tomcat:10.1-jdk17-temurin

# 念のためデフォルトのアプリを削除
RUN rm -rf /usr/local/tomcat/webapps/*

# 挟まっているフォルダ名と、正しいwebappへのルートを指定
COPY ./MafiaDiagnosis/src/main/webapp /usr/local/tomcat/webapps/ROOT

# Tomcatの起動
CMD ["catalina.sh", "run"]