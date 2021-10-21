pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo "Building..."
                docker system prune -a --force
                ./build_image.sh
            }
        }
        stage('Test') {
            steps {
                echo "Testing..."
            }
        }
        stage('Deploy') {
            steps {
                echo "Deploying..."
            }
        }
    }
}
