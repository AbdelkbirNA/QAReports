pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/AbdelkbirNA/QAReports.git', branch: 'main'
            }
        }

        stage('Prepare Folders') {
            steps {
                bat 'if not exist results\\allure-results mkdir results\\allure-results'
            }
        }

        stage('Run Tests with Docker') {
            steps {
                bat 'docker compose up --build --abort-on-container-exit'
            }
        }

        stage('Check Results') {
            steps {
                bat 'dir /s results'
            }
        }
    }

    post {
        always {
        allure includeProperties: false,
               jdk: '',
               results: [
                 [path: 'results/allure-results-api'],
                 [path: 'results/allure-results-ui']
               ]
    }

        success {
            echo 'SUCCESS 🚀 Tests OK'
        }

        failure {
            echo 'FAILED ❌ Check logs'
        }
    }
}