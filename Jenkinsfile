pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/karthik002-bhf/BHF-mobile-app.git'
      }
    }

    stage('Flutter Setup') {
      steps {
        echo 'Setting up Flutter SDK'
        sh 'flutter --version'
      }
    }

    stage('Install Dependencies') {
      steps {
        sh 'flutter pub get'
      }
    }

    stage('Run Tests') {
      steps {
        sh 'flutter test'
      }
    }

    stage('Build APK') {
      steps {
        sh 'flutter build apk --release'
      }
    }
  }

  post {
    success {
      echo '✅ Build successful!'
    }
    failure {
      echo '❌ Build failed. Check logs in Jenkins console.'
    }
  }
}
