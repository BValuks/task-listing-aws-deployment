#!/bin/bash

# See link for format required by AWS for the Dockerrun.aws.json file
# https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/single-container-docker-configuration.html
cat <<EOF > Dockerrun.aws.json
{
  "AWSEBDockerrunVersion": "1",
  "Image": {
    "Name": "$ECR_REGISTRY/$ECR_REPOSITORY:$CI_COMMIT_SHA",
    "Update": "true"
  },
  "Ports": [
    {
      "ContainerPort": "80"
    }
  ]
}
EOF

echo "Created Dockerrun file"
cat Dockerrun.aws.json
