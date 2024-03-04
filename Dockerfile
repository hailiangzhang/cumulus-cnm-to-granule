FROM openjdk:11-jdk

# Install Maven using apt-get
RUN apt-get update && \
    apt-get install -y maven && \
    apt-get clean;


# Set environment variables
ENV GRADLE_VERSION=8.3
ENV GRADLE_HOME=/opt/gradle

# Download and install Gradle
RUN mkdir -p /opt && \
    cd /opt && \
    curl -LO https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
    unzip gradle-${GRADLE_VERSION}-bin.zip && \
    rm -f gradle-${GRADLE_VERSION}-bin.zip && \
    ln -s /opt/gradle-${GRADLE_VERSION} ${GRADLE_HOME} && \
    ln -s ${GRADLE_HOME}/bin/gradle /usr/bin/gradle

# Add Gradle to PATH
ENV PATH="${PATH}:${GRADLE_HOME}/bin"

# Verify Gradle installation
RUN gradle --version

# Run the following script to build the package
# mvn clean dependency:copy-dependencies
# gradle build
