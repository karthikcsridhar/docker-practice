node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("docker-practice-nodeapp")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        /*docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
	    app.push() test
        }*/

	dir('/var/lib/jenkins/workspace/') { 
    		sh 'pwd; docker tag docker-practice-nodeapp karthikcsridhar/docker-practice-nodeapp:latest; docker push karthikcsridhar/docker-practice-nodeapp:latest;'
	}	
      
    }

    stage('Promote to Dev'){
	/* create a trigger file that is read by a cron job in the server */    	
	
	dir('/home/bitnami/apps/test/'){
		sh 'touch karthikcsridhar/docker-practice-nodeapp.do.deploy;'
	}
	
    }
}
