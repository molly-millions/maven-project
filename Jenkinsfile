pipeline {
    agent any

    parameters {
         string(name: 'tomcat_dev', defaultValue: '18.197.109.213', description: 'Staging Server')
         string(name: 'tomcat_prod', defaultValue: '52.59.219.45', description: 'Production Server')
    }

    triggers {
         pollSCM('* * * * *')
     }

stages{
        stage('Build'){
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }

        stage ('Deployments'){
            parallel{
                stage ('Deploy to Staging'){
                    steps {
                        sh "scp -i /home/alex/tomcat-demo.pem -o 'StrictHostKeyChecking no' **/target/*.war ec2-user@${params.tomcat_dev}:/var/lib/tomcat8/webapps"
                    }
                }

                stage ("Deploy to Production"){
                    steps {
                        sh "scp -i /home/alex/tomcat-demo.pem -o 'StrictHostKeyChecking no' **/target/*.war ec2-user@${params.tomcat_prod}:/var/lib/tomcat8/webapps"
                    }
                }
            }
        }
    }
}
