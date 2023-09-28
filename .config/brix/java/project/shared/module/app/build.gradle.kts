group = "com.xenoterracide"
version = "0.1.0-SNAPSHOT"

plugins {
  id("our.java-library")
}

dependencies {
  implementation(platform(libs.spring.platform))
  implementation(libs.spring.boot.autoconfigure)
  testImplementation(libs.bundles.spring.test)
  runtimeOnly(libs.spring.boot.starter.core)
  runtimeOnly(libs.spring.boot.starter.log4j2)
  runtimeOnly(libs.spring.boot.starter.webflux)
  runtimeOnly(libs.spring.boot.starter.actuator)
  modules {
    module("org.springframework.boot:spring-boot-starter-logging") {
      replacedBy("org.springframework.boot:spring-boot-starter-log4j2", "Use Log4j2 instead of Logback")
    }
  }
}


tasks.withType<JacocoCoverageVerification>().configureEach {
  dependsOn(project.tasks.withType<JacocoReport>())
  violationRules {
    rule {
      limit {
        minimum = 0.3.toBigDecimal()
      }
    }
  }
}
