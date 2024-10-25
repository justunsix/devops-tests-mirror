#!/usr/bin/env groovy

def call() {
  echo 'building application'
  sh 'mvn package'
}

