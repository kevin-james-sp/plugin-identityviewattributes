pipeline {
    agent any
    tools {
        //jdk 'jdk11'
        maven 'Maven 3.2.2'
        jdk 'jdk-8u152'
    }

    stages {
        stage('Setup') {
            steps {
                checkout scm
            }
        }
        stage('Build on Linux') {
            steps {
                script {
                    sh "echo $MAVEN_HOME"
                    sh "echo $MVN_HOME"
                    sh "echo $M2_HOME"
                    sh "mvn clean package"
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