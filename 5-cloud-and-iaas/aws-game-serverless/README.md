# AWS Serverless Example from Game Workshop

Support code while working on the [AWS Alien Attack Workshop](https://alienattack.workshop.aws/).
Workshop has long and short labs focused on different AWS services.

- See more code at the [Alien Attack Workshop repository](https://github.com/aws-samples/aws-alien-attack)
- `GameTopXStats.js` file: Function reads data from a table and
  processes data into statitics for a game to work on
  [Build Your First Microservice, short lab in the workshop](https://catalog.us-east-1.prod.workshops.aws/workshops/3ae476e4-e66d-4e78-b22f-6190c79ddee2/en-US/architecture-samples/full-microservice/)
  - The lab creates a microservice using:
    - Database: Amazon Dynamo
    - Serverless compute: AWS Lambda using NodeJS
      - Computes statistics for top 10 players of a game using
        database information
      - Handler function is the entry point for the lambda function
        - Gets event sent by API Gateway and context (environment information)
    - API service to provide service to users
