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

        stage('Check Pytest Installation') {
    steps {
        script {
            docker.image("python-docker").inside {
                sh 'pip show pytest'
            }
        }
    }
}


        stage('Run Tests') {
            steps {
                script {
                    docker.image("python-docker").withRun('-p 5000:5000') { c ->
                        sh '/app/venv/bin/pytest /app/tests/'
                    }
                }
            }
        }
    }
}