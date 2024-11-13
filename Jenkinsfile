pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Ojasik/DockerPython2.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("python-docker")
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    def appContainer  = docker.image("python-docker").run('-p 5000:5000') 
                    sh "docker exec ${appContainer.id} bash -c '/app/venv/bin/activate && pytest /app/tests/'"
                    }
                }
            }
        }
    }
