FROM ubuntu:latest

ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools/bin

RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    unzip \
    openjdk-8-jdk

# accept SDK licences
RUN mkdir -p ${ANDROID_HOME}/licenses
RUN echo -e "\n8933bad161af4178b1185d1a37fbf41ea5269c55" > ${ANDROID_HOME}/licenses/android-sdk-license
RUN echo -e "\n84831b9409646a918e30573bab4c9c91346d8abd" > ${ANDROID_HOME}/licenses/android-sdk-preview-license
