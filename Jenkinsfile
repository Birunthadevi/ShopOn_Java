pipeline {
  environment {
    registry = "prabhavagrawal/shopon"
    registryCredential = 'docker_hub_prabhavagrawal'
    dockerImage = ''
  }
  agent any
  stages{
    stage ('Build') {
      steps{
        echo "Building Project"
        sh 'mvn package -DskipTests'
      }
    }
    stage ('Archive') {
      steps{
        echo "Archiving Project"
        archiveArtifacts artifacts: '**/*.war', followSymlinks: false
      }
    }
    stage ('Build Docker Image') {
      steps{
        echo "Building Docker Image"
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage ('Push Docker Image') {
      steps{
        echo "Pushing Docker Image"
        script {
          docker.withRegistry( '', registryCredential ) {
              dockerImage.push()
              dockerImage.push('latest')
          }
        }
      }
    }
    stage ('Deploy to Dev') {
      steps{
        echo "Deploying to Dev Environment"
        sh "docker rm -f shopon || true"
        sh "docker run -d --name=shopon -p 8080:8080 prabhavagrawal/shopon"
      }
    }
  }
}
