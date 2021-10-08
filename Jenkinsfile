pipeline {
  agent any



  stages {
    stage('Build') {
      steps {
        sh 'mvn package'
      }
    }
    
        stage("Build image") {
            steps {
                script {
                    echo "Build image with tag: ${env.BUILD_ID}"
                    myapp = docker.build("catalinpoc/ledger-service:${env.BUILD_ID}", "--build-arg VERSION='${env.BUILD_ID}' .")
                }
            }
        }
    

      stage("Push image") {
        steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }
               }
          }
	  }
		stage("Push to S3") {
			steps {
				
				pushToS3([regiom: "us-east-1", s3Bucket: "test-bucket-222", s3Path: "/"])

			}
		}

	 
	
 }
  post{
        always{
            echo "Job execution complete."
        }
		success{
            archiveArtifacts artifacts : 'target/springbootrestapiexample-${env.BUILD_ID}.jar'
        }
        unsuccessful{
            echo "Job execution status is failed, please check error logs"
        }
	 }
  
}
