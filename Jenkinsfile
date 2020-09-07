pipeline {
    agent any
    tools {
        //jdk 'jdk11'
        jdk 'jdk-8u152'
    }

    stages {
        stage('Setup') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                script {
                    // Run the build
                    if (isUnix()) {
                        sh "'${antHome}/bin/ant' clean package"
                    } else {
                        bat(/"${antHome}\bin\ant" clean package/)
                    }
                }
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