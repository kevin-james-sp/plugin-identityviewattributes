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
        stage('Build on Linux') {
            steps {
                script {
                    // Run the build
                    if (isUnix()) {
                        echo "isUnix"
                        sh "printenv"
                        sh "'${antHome}/bin/ant' clean package"
                    } else {
                        echo "not isUnix"
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