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
                    sh "mkdir -p ~/.m2"
                    sh "echo '<settings><mirrors><mirror><id>other-mirror</id><url>https://repo.maven.apache.org/maven2</url><mirrorOf>central</mirrorOf></mirror></mirrors></settings>' > ~/.m2/settings.xml"
                    sh "echo $AWS_ACCESS_KEY_ID"
                    sh "mvn clean package"
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                script {
                    sh "aws cloudformation create-stack --region us-east-1 --stack-name jenkins-test-$BUILD_NUMBER --template-url s3://maven-iiq/iiq-cfn.yml"
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}