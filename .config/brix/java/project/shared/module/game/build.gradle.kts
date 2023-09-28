group = "com.xenoterracide"
version = "0.1.0-SNAPSHOT"

buildscript {
  dependencyLocking.lockAllConfigurations()
}

plugins {
  id("our.java-library")
  id("org.gradlex.extra-java-module-info").version("1.+")
}

extraJavaModuleInfo {
  automaticModule("org.inferred:freebuilder", "org.inferred.freebuilder")
  failOnMissingModuleInfo.set(false)
}

dependencies {
  annotationProcessor(libs.freebuilder)
  compileOnly(libs.freebuilder)
  implementation(platform(libs.spring.platform))
  implementation(libs.bundles.measure)
  runtimeOnly(libs.spring.boot.starter.core)
  runtimeOnly(libs.spring.boot.starter.log4j2)
  constraints {
    compileOnly(libs.javax.annotation) {
      because("need the 1.0 api")
    }
  }
  modules {
    module("org.springframework.boot:spring-boot-starter-logging") {
      replacedBy("org.springframework.boot:spring-boot-starter-log4j2", "Use Log4j2 instead of Logback")
    }
  }
}
