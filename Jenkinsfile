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
                    docker.image("python-docker").inside('-p 5000:5000') { c ->
                    // sh 'nohup python /app/app.py &'
                    sh 'until curl -s http://localhost:5000; do echo "Waiting for Flask to be ready..."; sleep 1; done'
                        sh '. /app/venv/bin/activate && pytest /app/tests/'
                    }
                }
            }
        }
    }
}