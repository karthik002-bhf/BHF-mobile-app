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
                echo '🛠️ Setting up Flutter SDK...'
                bat 'flutter --version'
                bat 'flutter doctor -v'
            }
        }

        stage('Install Dependencies') {
            steps {
                echo '📦 Installing Flutter dependencies...'
                bat 'flutter pub get'
            }
        }

        stage('Run Tests with Coverage') {
            steps {
                script {
                    echo '🧪 Running Flutter tests with coverage...'
                    def testResult = bat(returnStatus: true, script: 'flutter test --coverage')
                    if (testResult != 0) {
                        echo '⚠️ Some tests failed — continuing build for SonarQube analysis.'
                    }
                    // Confirm coverage file exists
                    bat 'if exist coverage\\lcov.info (echo ✅ Coverage file found) else (echo ⚠️ Coverage file missing)'
                }
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

        stage('Build APK') {
            steps {
                echo '🏗️ Building Flutter release APK...'
                bat 'flutter build apk --release'
            }
        }

        stage('Archive APK') {
            steps {
                echo '📦 Archiving generated APK...'
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
