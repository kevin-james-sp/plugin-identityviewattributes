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
                    sh "/sbin/ip route|awk \'/default/ { print $3 }\'"
                    sh "aws cloudformation create-stack --stack-name jenkins-test-$BUILD_NUMBER --template-url https://maven-iiq.s3.amazonaws.com/iiq-cfn.yml"
                    sh "aws cloudformation wait stack-create-complete --stack-name jenkins-test-$BUILD_NUMBER"
                    def props = readProperties file: 'build.num'
                    env.MVN_BUILD_NUM = props['build.number']
                    sh '''addr=`aws cloudformation describe-stacks --stack-name jenkins-test-$BUILD_NUMBER --output text --query Stacks[0].Outputs[0].OutputValue`
                        [ `curl -v -s -w \"%{http_code}\" -u spadmin:admin -F \"file=@$WORKSPACE/target/identityviewattributes-1.0.$MVN_BUILD_NUM.zip\" $addr/rest/plugins` -eq 200 ]
                    '''
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