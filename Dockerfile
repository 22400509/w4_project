# --- 1단계: Maven을 사용하여 .war 파일 빌드 ---
# (Gradle을 사용하신다면 이 부분을 "gradle"로 수정해야 합니다)
FROM maven:3.8.5-openjdk-11 AS build

# 소스 코드를 Docker 이미지 안으로 복사
WORKDIR /app
COPY . .

# Maven으로 프로젝트를 빌드 (test는 생략)
RUN mvn clean package -DskipTests


# --- 2단계: 톰캣에 .war 파일 배포 ---
FROM tomcat:9.0-jdk11-temurin

# 1단계(build)에서 생성된 .war 파일을 톰캣 webapps 폴더에 복사
#
# [수정된 부분]
# 특정 파일 이름 대신, target/ 폴더에 있는 .war 파일을 찾도록
# 와일드카드(*)를 사용합니다.
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# 포트 8080 노출 (Railway가 이 포트를 자동으로 감지합니다)
EXPOSE 3036

# 톰캣 실행
CMD ["catalina.sh", "run"]