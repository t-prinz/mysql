# Examples showing how to deploy MySQL via a container using both podman and OpenShift

Maven reference: https://www.oracle.com/webfolder/technetwork/tutorials/obe/java/Maven_SE/Maven.html

## Maven project started with

mvn archetype:generate -DgroupId=io.tprinz -DartifactId=readdb -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=False

## Building and running with the auto-generated pom.xml file

Notes:
* Running the jar file does not work
* An old version of java is used
* A warning message is displayed regarding not using UTF-8

mvn clean package
cd target/classes
java io.tprinz.App

## Add the following to line 1 of pom.xml (not sure if this is needed)

<?xml version="1.0" encoding="UTF-8"?>

## Add the following to pom.xml

Notes:
* This specifies UTF-8 and Java 11
* The build section specifies the 
* Specifying jar as the packaging doesn't appear to be necessary

  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <maven.compiler.source>11</maven.compiler.source>
    <maven.compiler.target>11</maven.compiler.target>
  </properties>

  <build>
      <plugins>
          <plugin>
              <groupId>org.apache.maven.plugins</groupId>
              <artifactId>maven-jar-plugin</artifactId>
              <version>2.4</version>
              <configuration>
                  <archive>
                      <manifest>
                          <mainClass>io.tprinz.App</mainClass>
                      </manifest>
                  </archive>
              </configuration>
          </plugin>
      </plugins>
  </build>

## Run with

java -cp ~/.m2/repository/com/mysql/mysql-connector-j/8.0.31/mysql-connector-j-8.0.31.jar:target/readdb-1.0-SNAPSHOT.jar io.tprinz.App
