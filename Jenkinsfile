pipeline {
    agent any

    stages {
        stage('Setup') {
            checkout scm
            antHome = tool name: 'ant-1.9.7', type: 'ant'
        }
        stage('Build') {
            // Run the build
            if (isUnix()) {
                sh "'${antHome}/bin/ant' clean package"
            } else {
                bat(/"${antHome}\bin\ant" clean package/)
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}