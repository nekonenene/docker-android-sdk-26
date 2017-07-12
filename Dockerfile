FROM alpine:latest

ENV BUILD_SDK_VERSION 26.0.0
ENV SDK_TOOLS_FILE_NAME sdk-tools-linux-3859397.zip
ENV SDK_TOOLS_URL https://dl.google.com/android/repository/${SDK_TOOLS_FILE_NAME}
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/build-tools/${BUILD_SDK_VERSION}

RUN apk update && apk add \
    git \
    wget \
    ca-certificates \
    openjdk8 \
    bash

RUN wget -q ${SDK_TOOLS_URL} -P ${ANDROID_HOME} && \
    unzip -oq ${ANDROID_HOME}/${SDK_TOOLS_FILE_NAME} -d ${ANDROID_HOME}

RUN (while sleep 2; do echo "y"; done) | sdkmanager "build-tools;${BUILD_SDK_VERSION}" --sdk_root=${ANDROID_HOME}
