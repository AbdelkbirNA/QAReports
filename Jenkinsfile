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
            allure results: [[path: 'results/allure-results']]
            echo 'Cleaning workspace...'
            cleanWs()
        }

        success {
            echo 'SUCCESS 🚀 Tests OK'
        }

        failure {
            echo 'FAILED ❌ Check logs'
        }
    }
}