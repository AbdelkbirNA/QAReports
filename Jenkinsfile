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
                sh 'mkdir -p results'
            }
        }

        stage('Run Tests with Docker') {
            steps {
            sh 'docker compose up --build --abort-on-container-exit'            }
        }

        stage('Check Results') {
            steps {
                sh 'ls -R results || true'
            }
        }

        stage('Generate Allure Report') {
            steps {
                sh '''
                    if [ -d results/allure-results ]; then
                        allure generate results/allure-results -o results/allure-report --clean
                    else
                        echo "No Allure results found"
                    fi
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