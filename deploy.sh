#!/bin/bash


eval $(docker run --rm -i -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY quay.io/keboola/aws-cli ecr get-login --region us-east-1)
docker tag keboola/logspout:latest 147946154733.dkr.ecr.us-east-1.amazonaws.com/keboola/logspout:latest
docker push 147946154733.dkr.ecr.us-east-1.amazonaws.com/logspout:latest
docker tag keboola/logspout:latest 147946154733.dkr.ecr.us-east-1.amazonaws.com/keboola/logspout:$TRAVIS_COMMIT
docker push 147946154733.dkr.ecr.us-east-1.amazonaws.com/keboola/logspout:$TRAVIS_COMMIT