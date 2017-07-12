FROM ubuntu:latest

ENV SDK_TOOLS_FILE_NAME sdk-tools-linux-3859397.zip
ENV SDK_TOOLS_URL https://dl.google.com/android/repository/${SDK_TOOLS_FILE_NAME}
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools/bin

RUN apt-get update && apt-get install -y \
    git \
    wget \
    unzip \
    openjdk-8-jdk

RUN wget -q ${SDK_TOOLS_URL} -P ${ANDROID_HOME} && \
    unzip -oq ${ANDROID_HOME}/${SDK_TOOLS_FILE_NAME} -d ${ANDROID_HOME}

# accept SDK licences
RUN mkdir -p ${ANDROID_HOME}/licenses
RUN echo -e "\n8933bad161af4178b1185d1a37fbf41ea5269c55" > ${ANDROID_HOME}/licenses/android-sdk-license
RUN echo -e "\n84831b9409646a918e30573bab4c9c91346d8abd" > ${ANDROID_HOME}/licenses/android-sdk-preview-license
