@Library('Shared') _
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
                    myapp = docker.build("abigael081497/ledger-service:${env.BUILD_ID}", "--build-arg VERSION='${env.BUILD_ID}' .")
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
				test("Cãtãlin")
				uploadFilesToS3()
				

			}
		}

	 
	
 }
  post{
        always{
            echo "Job execution complete."
        }
		success{
            archiveArtifacts artifacts : 'target/springbootrestapiexample-*.jar'
        }
        unsuccessful{
            echo "Job execution status is failed, please check error logs"
        }
	 }
  
}
