/* groovylint-disable NestedBlockDepth */
pipeline {
    agent any

    environment {
        PATH = "C:\\flutter\\flutter\\bin;C:\\Android\\sdk\\platform-tools;C:\\Android\\sdk\\cmdline-tools\\latest\\bin;${env.PATH}"
        ANDROID_HOME = 'C:\\Android\\sdk'
        ANDROID_SDK_ROOT = 'C:\\Android\\sdk'
        SONARQUBE_SCANNER_HOME = tool 'SonarScanner'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/karthik002-bhf/BHF-mobile-app.git'
            }
        }

        stage('Flutter Setup') {
            steps {
                echo 'Setting up Flutter SDK'
                bat 'flutter --version'
                bat 'flutter doctor -v'
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'flutter pub get'
            }
        }

        stage('Run Tests with Coverage') {
            steps {
                echo '🧪 Running Flutter tests with coverage...'
                bat 'flutter test --coverage'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    echo '🔍 Running SonarQube code analysis...'
                    withSonarQubeEnv('SonarQube') {
                        bat "\"%SONARQUBE_SCANNER_HOME%\\bin\\sonar-scanner.bat\" -Dsonar.dart.lcov.reportPaths=coverage/lcov.info"
                    }
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 10, unit: 'MINUTES') {
                    script {
                        echo '⏳ Checking SonarQube Quality Gate...'
                        waitForQualityGate abortPipeline: true
                    }
                }
            }
        }

        // Optional stage if you want to run tests separately again
        // stage('Run Tests') {
        //     steps {
        //         script {
        //             def result = bat(returnStatus: true, script: 'flutter test')
        //             if (result != 0) {
        //                 echo '⚠️ No tests found or tests failed (continuing build)'
        //             }
        //         }
        //     }
        // }

        stage('Build APK') {
            steps {
                bat 'flutter build apk --release'
            }
        }

        stage('Archive APK') {
            steps {
                archiveArtifacts(
                    artifacts: 'build/app/outputs/flutter-apk/app-release.apk',
                    allowEmptyArchive: false
                )
            }
        }
    }

    post {
        success {
            echo '✅ Build successful! APK archived.'
            script {
                try {
                    cleanWs()
                } catch (Exception e) {
                    echo '⚠️ Could not clean workspace'
                }
            }
        }
        failure {
            echo '❌ Build failed. Check logs in Jenkins console.'
        }
    }
}
