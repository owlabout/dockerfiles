FROM debian:9-slim

WORKDIR /opt/project

# install basics
RUN groupadd --gid 1000 owl \
    && useradd --uid 1000 --gid owl --shell /bin/bash --create-home owl \
    && apt-get -qq update && apt-get install -qqy --no-install-recommends \
    ca-certificates curl unzip nano \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install Nodejs
RUN apt-get install -y gnupg \
    && curl -sL https://deb.nodesource.com/setup_11.x | bash && apt-get install -y nodejs

# install Android SDK
ENV ANDROID_HOME='/opt/sdk' PATH=$PATH:/opt/gradle/bin
RUN VERSION_SDK_TOOLS="4333796" \
    && VERSION_GRADLE="4.10.2" \
    && PATH="$PATH:${ANDROID_HOME}/tools" && DEBIAN_FRONTEND='noninteractive' \
    && mkdir -p /usr/share/man/man1 \
    && apt-get -qq update && apt-get install -qqy --no-install-recommends \
    openjdk-8-jdk \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && JAVA_HOME='dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'\
    /var/lib/dpkg/info/ca-certificates-java.postinst configure \
    && curl -s https://dl.google.com/android/repository/sdk-tools-linux-${VERSION_SDK_TOOLS}.zip > /sdk.zip \
    && unzip /sdk.zip -d "${ANDROID_HOME}" \
    && rm -v /sdk.zip \
    && yes | ${ANDROID_HOME}/tools/bin/sdkmanager --licenses \
    && ${ANDROID_HOME}/tools/bin/sdkmanager --update \
    && ${ANDROID_HOME}/tools/bin/sdkmanager "build-tools;28.0.3" "platform-tools" "platforms;android-28" "platforms;android-27" \
    && curl -s -L https://services.gradle.org/distributions/gradle-${VERSION_GRADLE}-bin.zip > /gradle.zip \
    && unzip /gradle.zip -d /opt \
    && mv /opt/gradle-* /opt/gradle \
    && rm -v /gradle.zip

CMD ["bash"]