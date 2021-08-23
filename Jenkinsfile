node('maven') {
  stage('Clone Git') {
    sh " oc whoami"
    sh " pwd ; id;"
    git url: "https://github.com/cerabi2010/simple.git"
  }

  stage('Maven Build') {
//    sh "cp configuration/settings.xml ~/.m2/"
//    sh "cp settings.xml ~/.m2/"
    sh "mvn package"
    sh "ls  *"
  }

  stage('Test') {
    parallel(
      "Cart Tests": {
        sh "curl -s -X POST http://jws-app:8080/index.jsp"
      },
      "Discount Tests": {
        sh "curl -s -X POST http://jws-app:8080/failover.jsp"
      }
    )
  }

  stage('Build Image') {
    sh "oc start-build jws-app --from-file=target/ROOT.war --follow"
  }
 
//  stage('Deploy') {
//    sh "oc rollout latest dc/eap-app -n sample-ci2"
//  }
 
 
  stage('System Test') {
    sh " sleep 30"
    sh "curl -s http://eap-app:8080/index.jsp"
  }
}
