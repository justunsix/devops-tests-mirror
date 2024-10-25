#!/usr/bin/env groovy

// src/com/example/docker.groovy

package com.example

// serializable allows saving of state
class docker implements serializable {

  def script 
    docker(script) {
      this.script = script
    }

  def builddockerimage(string imagename) {
    script.echo "building the docker image"
      script.sh "docker build -t $imagename ."
  }

  def dockerlogin() {
    script.echo "building the docker image"
      script.withcredentials([usernamepassword(credentialsid: 'docker-hub-repo', passwordvariable: 'pass', usernamevariable: 'user')]) {

      }

    def dockerpush(string imagename) {
      script.sh "docker push $imagename" 

    }
  }

  // src/dockerlogin.groovy
  import com.example.docker

    def call(string imagename){
      return new docker(this).dockerlogin()
    }

  // src/dockerpush.groovy
  import com.example.docker

    def call(string imagename){
      return new docker(this).dockerpush(imagename)
    }

  // src/buildimage.groovy
  // calls docker class
  import com.example.docker

    def call(string imagename){
      return new Docker(this).buildDockerImage(imageName)
    }

