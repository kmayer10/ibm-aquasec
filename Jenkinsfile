pipeline {
    agent any

    stages {
        stage('Scan Base Image') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/kmayer10/ibm-aquasec.git'
                sh label: '', script: 'trivy client --remote http://54.144.250.10:8080 --format template --template @junit.tpl -o base-image.xml centos:8'
                junit allowEmptyResults: true, testResults: 'base-image.xml'
            }
        }
        stage('Create Docker Image') {
            steps {
                sh label: '', script: 'docker build -t thinknyx/devopsinaction:1.0 --build-arg downloadLink=http://apachemirror.wuchna.com/tomcat/tomcat-8/v8.5.57/bin/apache-tomcat-8.5.57.tar.gz --build-arg tomcatVersion=8.5.57 .'
            }
        }
        stage('Scan App Image') {
            steps {
                sh label: '', script: 'trivy client --exit-code 1 --severity CRITICAL,HIGH --remote http://54.144.250.10:8080 --format template --template @junit.tpl -o app-image.xml thinknyx/devopsinaction:1.0'
                junit allowEmptyResults: true, testResults: 'app-image.xml'
            }
        }
        stage('Push to DockerHub') {
            steps {
                input 'Would you like to Procced?'
                sh label: '', script: 'docker push thinknyx/devopsinaction:1.0'
            }
        }
    }
}
