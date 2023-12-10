pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'docker image build --tag okbartz/cw2:1.0 .'

            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh 'docker container run --detach --publish 80:80 --name cw2 okbartz/cw2:1.0'
                sh 'docker container ls'
                sh 'docker container stop cw2'
                sh 'docker container rm cw2'
            }
        }

        stage('Push Image') {
        
            steps {
                DOCKER_COMMON_CREDS = credentials('dockerHub') 
                
                sh "docker login -u $DOCKER_COMMON_CREDS_USR -p $DOCKER_COMMON_CREDS_PSW"
                sh 'docker push okbartz/cw2:1.0'
            }
        }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
