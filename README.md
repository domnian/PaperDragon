PaperDragon ![Minecraft Version](https://img.shields.io/badge/Minecraft-1.20.5-red?style=for-the-badge)
===========
PaperDragon is a fork of the Paper server software with patches from other forks, namely [EmpireCraft][empirecraft]. It is not meant for widespread use, and is primarily a side-project. You are free to use PaperDragon for your server, but support will be limited compared to that of Paper.

It is recommended that you either look into using [Paper][paper] over using PaperDragon.

How To (Plugin Developers)
------
* See our API patches [here](patches/api)

### &#187; Using Maven
#### Repository:
```
This will come with time. For now, you just need to build it locally.
```
#### Artifact:
```xml
<dependency>
    <groupId>com.domnian.paperdragon</groupId>
    <artifactId>paperdragon-api</artifactId>
    <version>1.20.5-R0.1-SNAPSHOT</version>
    <scope>provided</scope>
</dependency>
 ```

### &#187; Using Gradle
#### Repository:
```
This will come with time. For now, you just need to build it locally.
```
#### Artifact (API only):
```groovy
dependencies {
    compileOnly 'com.domnian.paperdragon:paperdragon-api:1.20.5-R0.1-SNAPSHOT'
}
```
#### Paperweight UserDev Plugin (API + Server)
```kotlin
dependencies {
    paperweightDevBundle(
        group = "com.domnian.paperdragon",
        version = "1.20.5-R0.1-SNAPSHOT",
        ext = "zip"
    )
}
```

How To (Compiling Jar From Source)
------
*The instructions and requirements to compile are the same as [Paper][paper-build].*

To compile PaperDragon, you need JDK 21 and an internet connection.

Clone this repo, run `./gradlew applyPatches`, then `./gradlew createReobfBundlerJar` from your terminal. You can find the compiled jar in the `PaperDragon-Server/build/libs` directory.

To get a full list of tasks, run `./gradlew tasks`.

[empirecraft]: https://github.com/starlis/empirecraft
[paper]: https://github.com/PaperMC/Paper
[paper-build]: https://github.com/PaperMC/Paper/blob/master/README.md#how-to-compiling-jar-from-source
