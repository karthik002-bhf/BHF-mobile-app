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
        bat 'flutter --version'
      }
    }

    stage('Install Dependencies') {
      steps {
        bat 'flutter pub get'
      }
    }

    stage('Run Tests') {
      steps {
        bat 'flutter test'
      }
    }

    stage('Build APK') {
      steps {
        bat 'flutter build apk --release'
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
