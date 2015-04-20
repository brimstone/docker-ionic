FROM brimstone/ubuntu:14.04

# install packages we need on the system
RUN dpkg --add-architecture i386 \
 && echo "deb [arch=i386] http://us.archive.ubuntu.com/ubuntu trusty main restricted multiverse universe" > /etc/apt/sources.list.d/i386.list \
 && echo "deb [arch=i386] http://us.archive.ubuntu.com/ubuntu trusty-updates main restricted multiverse universe" >> /etc/apt/sources.list.d/i386.list \
 && package --no-install-recommends nodejs wget npm openjdk-7-jdk ant libc6:i386 zlib1g:i386 libstdc++6:i386
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

# fix up the node one
RUN ln -s /usr/bin/nodejs /usr/bin/node

# install cordova and ionic
RUN npm install -g cordova ionic

# install the android sdk
RUN wget http://dl.google.com/android/android-sdk_r24.1.2-linux.tgz -O - | tar -C /opt -zx
ENV ANDROID_HOME /opt/android-sdk-linux


ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/android-sdk-linux/tools:/opt/android-sdk-linux/platform-tools

# download stuff for platform 4.0 - 14
RUN printf "y\n" \
	| /opt/android-sdk-linux/tools/android update sdk --no-ui \
		--filter android-21,build-tools-22.0.1,tools,platform-tools
