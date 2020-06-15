####
# FROM maven:3.3.9-jdk-8-alpine AS build
# RUN apk update
# RUN apk add --no-cache \
# 	alsa-lib \
# 	curl \
# 	expat \
# 	gmp \
# 	gnutls \
# 	jasper \
# 	jpeg \
# 	lame \
# 	lcms2 \
# 	libass \
# 	libbz2 \
# 	libdrm \
# 	libffi \
# 	libgcc \
# 	libjpeg-turbo \
# 	libogg \
# 	libpciaccess \
# 	librtmp \
# 	libstdc++ \
# 	libtasn1 \
# 	libtheora \
# 	libva \
# 	libvorbis \
# 	libvpx \
# 	libx11 \
# 	libxau \
# 	libxcb \
# 	libxdamage \
# 	libxdmcp \
# 	libxext \
# 	libxfixes \
# 	libxshmfence \
# 	libxxf86vm \
# 	mesa-gl \
# 	mesa-glapi \
# 	nettle \
# 	openjdk8-jre \
# 	opus \
# 	p11-kit \
# 	sdl \
# 	ttf-dejavu \
# 	v4l-utils-libs \
# 	x264-libs \
# 	x265 \
# 	xvidcore && \
#  echo "**** installed all pending pacthes ****" 

# COPY pom.xml /tmp/
# WORKDIR /tmp/
# RUN mvn package

# FROM openjdk:8-jre-alpine

# WORKDIR /tmp/
# COPY --from=build /tmp/target/rahul-charan.jar /tmp/rahul-charan.jar
# ENTRYPOINT ["java", "-jar", ,"/tmp/rahul-charan.jar "]

# FROM maven:3.3.9-jdk-8-alpine AS build
# RUN apk update bzip2
# RUN apk add --no-cache \
# 	x265 \
# 	xvidcore && \
#  echo "**** installed all pending pacthes ****" 

# COPY pom.xml /tmp/
# WORKDIR /tmp/
# RUN mvn package

# FROM openjdk:8-jre-alpine

# WORKDIR /tmp/
# COPY --from=build /tmp/target/rahul-charan.jar /tmp/rahul-charan.jar
# ENTRYPOINT ["java", "-jar", ,"/tmp/rahul-charan.jar "]
FROM alpine:3.7 AS build
# RUN openjdk:8-jre-alpine
RUN apk add maven

COPY pom.xml /tmp/
WORKDIR /tmp/
RUN mvn package

FROM openjdk:8-jre-alpine

WORKDIR /tmp/
COPY --from=build /tmp/target/rahul-charan.jar /tmp/rahul-charan.jar
ENTRYPOINT ["java", "-jar", ,"/tmp/rahul-charan.jar "]
