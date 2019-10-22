//
// Copyright (c) 2019 gematik - Gesellschaft für Telematikanwendungen der Gesundheitskarte mbH
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//    http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

//
// This static POM file is supposed to be used by the Maven.swift shell script to download
// the exec-jar and its dependencies. Unfortunately we cannot add this as a script file in a Bundle resource as the
// SwiftPM won't include it in the target's framework

internal let pomXml = """
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <name>CardSimulation-exec</name>
    <artifactId>cardsimulation.exec</artifactId>
    <groupId>de.gematik.ti</groupId>
    <version>[Do not touch - will be overriden]</version>

    <scm>
        <url>https://build.top.local/source/git/refImpl/tools/CardSimulation-Loader.git</url>
        <connection>scm:git:https://build.top.local/source/git/refImpl/tools/CardSimulation-Loader.git</connection>
        <developerConnection>scm:git:https://build.top.local/source/git/refImpl/tools/CardSimulation-Loader.git
        </developerConnection>
    </scm>

    <dependencies>
        <dependency>
            <groupId>de.gematik</groupId>
            <artifactId>de.gematik.egk.g2sim.product</artifactId>
            <version>${project.version}</version>
        </dependency>
    </dependencies>

    <build>
      <finalName>${project.artifactId}</finalName>
      <directory>./${project.name}-${project.version}</directory>
    </build>
</project>
"""
