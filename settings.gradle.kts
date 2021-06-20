pluginManagement {
    repositories {
        gradlePluginPortal()
        maven("https://papermc.io/repo/repository/maven-public/")
    }
}

rootProject.name = "PaperDragon"

include(":PaperDragon-API", "PaperDragon-Server")
