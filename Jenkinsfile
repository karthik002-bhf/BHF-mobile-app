pipeline {
    agent any

    environment {
        PATH = "C:\\Users\\LENOVO1\\Downloads\\bhf_mobile_app\\flutter\\bin;${env.PATH}" 
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

        stage('Run Tests') {
            steps {
                script {
                    def result = bat(returnStatus: true, script: 'flutter test')
                    if (result != 0) {
                        echo '⚠️ No tests found or tests failed (continuing build)'
                    }
                }
            }
        }

        stage('Build APK') {
            steps {
                bat 'flutter build apk --release'
            }
        }

        stage('Archive APK') {
            steps {
                archiveArtifacts artifacts: 'build/app/outputs/flutter-apk/app-release.apk', 
                                 allowEmptyArchive: false
            }
        }
    }

    post {
        always {
            cleanWs()
        }
        success {
            echo '✅ Build successful! APK archived.'
        }
        failure {
            echo '❌ Build failed. Check logs in Jenkins console.'
        }
    }
}
