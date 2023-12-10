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
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
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
}
