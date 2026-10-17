pipeline {
    agent any

    environment {
        STUDENT_NAME    = 'Kamilla'
        STUDENT_SURNAME = 'Bekmukhametova'
        STUDENT_GROUP   = 'IT2-2313'
        STUDENT_ID      = '38239'
        IMAGE_NAME      = 'bekmukhametova-kamilla-devops'
        CONTAINER_NAME  = 'bekmukhametova-kamilla-container'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'git log -1 --oneline'
            }
        }

        stage('Build') {
            steps {
                echo "Student: ${STUDENT_NAME} ${STUDENT_SURNAME}"
                echo "Group: ${STUDENT_GROUP}"
                echo "Student ID: ${STUDENT_ID}"
                sh 'chmod +x scripts/Bekmukhametova_Kamilla_system.sh'
                sh 'bash -n scripts/Bekmukhametova_Kamilla_system.sh'
                sh 'python3 -m py_compile app/app.py'
            }
        }

        stage('Test') {
            steps {
                sh 'test -f Bekmukhametova_Kamilla_info.txt'
                sh 'test -f Dockerfile'
                sh 'test -f docker-compose.yml'
                sh 'grep -q "38239" Bekmukhametova_Kamilla_info.txt'
                sh './scripts/Bekmukhametova_Kamilla_system.sh'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t ${IMAGE_NAME} .'
                sh 'docker images ${IMAGE_NAME}'
            }
        }

        stage('Docker Run') {
            steps {
                sh 'docker rm -f ${CONTAINER_NAME} || true'
                sh '''
                    docker run -d \
                      -e STUDENT_NAME=${STUDENT_NAME} \
                      -e STUDENT_SURNAME=${STUDENT_SURNAME} \
                      -e STUDENT_GROUP=${STUDENT_GROUP} \
                      -e STUDENT_ID=${STUDENT_ID} \
                      --name ${CONTAINER_NAME} \
                      ${IMAGE_NAME}
                '''
                sh 'sleep 3'
                sh 'docker ps --filter name=${CONTAINER_NAME}'
                sh 'docker logs ${CONTAINER_NAME}'
            }
        }
    }

    post {
        success { echo 'Pipeline finished successfully!' }
        failure { echo 'Pipeline failed - check the stage that is red.' }
    }
}
