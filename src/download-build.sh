#!/bin/sh
########################
# unittest template script
# unittest only needs to exit sucess/failure to indicate success
# this is a template for the unittest script to be used during the inital pipeline setup
# the template can be replaced with your own logic to run their unit tests on the dynamic build hosts
########################
# the current directory is /opt/pipeline/scripts/<pipeline_name> where the unittest script will reside in the build host
cd $(dirname ${0})
# moving one level above to /opt/pipeline/scripts

cd ..
GINGHAM_DIR=`pwd`

cd ..
REPO_DIR=`pwd`
git clone https://pmaruapaka:99945a690dbdf3310da892e8e7c029bfbff4ee3b@git.soma.salesforce.com/infrastructure-fabric/gretty.git
cd $GINGHAM_DIR
touch private_config.properties
mkdir -p /tmp/SecretServiceKeys/Gingham
echo "SECRET_SERVICE_KEY_DIR=$GINGHAM_DIR/ginghamEngine/src/test/resources/keys/vczar2-1/vault1" >> private_config.properties

more private_config.properties

echo "executing tests"

# ./gradlew ginghamFront:test  -PmavenUser=${mavenUser} -PmavenPassword=${mavenPassword}
# ./gradlew ginghamEngine:test -PmavenUser=${mavenUser} -PmavenPassword=${mavenPassword}
