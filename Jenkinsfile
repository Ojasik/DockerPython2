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
                    docker.image("python-docker").withRun('-p 5000:5000') { c ->
                        sh """
                            source /app/venv/bin/activate
                            pytest /app/tests/
                        """
                    }
                }
            }
        }
    }
}