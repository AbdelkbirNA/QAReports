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
                bat 'if not exist results mkdir results'
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

        stage('Generate Allure Report') {
            steps {
                bat '''
                if exist results\\allure-results (
                    allure generate results\\allure-results -o results\\allure-report --clean
                ) else (
                    echo No Allure results found
                )
                '''
            }
        }
    }

    post {
        always {
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