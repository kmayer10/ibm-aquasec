pipeline {
    agent any

    stages {
        stage('Scan Base Image') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/kmayer10/ibm-aquasec.git'
                sh label: '', script: 'trivy client --remote http://54.144.250.10:8080 centos:8'
            }
        }
    }
}
