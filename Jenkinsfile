pipeline {
    agent any
    tools {
        //jdk 'jdk11'
        jdk 'jdk-8u152'
        ant
    }

    stages {
        stage('Setup') {
            steps {
                checkout scm
            }
        }
        stage('Build on Linux') {
            when {
                isUnix
            }
            steps {
                sh "'${antHome}/bin/ant' clean package"
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