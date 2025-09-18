pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "mahmooddev/ci_cd_python:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'jenkins',
                    url: 'https://github.com/mahmooddev01/ci_cd_python',
                    credentialsId: 'github-credentials'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        def app = docker.build("${DOCKER_IMAGE}")
                        app.push()
                    }
                }
            }
        }

        stage('Deploy to Render') {
            steps {
                withCredentials([string(credentialsId: 'render-api-key', variable: 'RENDER_KEY')]) {
                    sh '''
                    curl -X POST https://api.render.com/v1/services/<service-id>/deploys \
                    -H "Authorization: Bearer $RENDER_KEY" \
                    -H "Content-Type: application/json"
                    '''
                }
            }
        }
    }
}
