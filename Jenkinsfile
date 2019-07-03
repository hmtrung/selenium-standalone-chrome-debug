pipeline {
    agent { label 'master'}
    stages {
        stage('Checkout SCM') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/hmtrung/selenium-standalone-chrome-debug.git']]])
            }
        }
        stage('Build image') {
            steps {
                sh label: '', script: '''
                    docker build --build-arg http_proxy=http://10.10.10.10:8080 --build-arg https_proxy=http://10.10.10.10:8080 -t hmtrung/selenium-standalone-chrome-debug:${BUILD_NUMBER} .
                    docker tag hmtrung/selenium-standalone-chrome-debug:${BUILD_NUMBER} hmtrung/selenium-standalone-chrome-debug:3.141.59-radium
                    '''
            }
        }
    }
}
