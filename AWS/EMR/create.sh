#!/bin/bash


# parse command-line options
while getopts "b:m:p:n:t:q:r:" opt
do
    case $opt in
        b)
            S3_BUCKET_NAME=$OPTARG/AWS-EMR
            ;;
        m)
            MASTER_INSTANCE_TYPE=$OPTARG
            ;;
        p)
            MASTER_INSTANCE_PRICE=$OPTARG
            ;;
        n)
            NB_WORKER_NODES=$OPTARG
            ;;
        t)
            WORKER_INSTANCE_TYPE=$OPTARG
            ;;
        q)
            WORKER_INSTANCE_PRICE=$OPTARG
            ;;
        r)
            REMARKS=$OPTARG
            ;;
    esac
done


# CONSTANTS
AWS_EMR_SCRIPT_RUNNER_JAR=s3://elasticmapreduce/libs/script-runner/script-runner.jar
AWS_EMR_BOOTACT_INSTALL_BASICS_SCRIPT_NAME=AWS-EMR-BootAct-InstallBasics.sh
AWS_EMR_BOOTACT_INSTALL_SQL_SOFTWARE_SCRIPT_NAME=AWS-EMR-BootAct-InstallSQLSoftware.sh
AWS_EMR_BOOTACT_INSTALL_SCIPY_SCRIPT_NAME=AWS-EMR-BootAct-InstallSciPy.sh
AWS_EMR_BOOTACT_LAUNCH_JUPYTER_SCRIPT_NAME=AWS-EMR-BootAct-LaunchJupyter.sh
AWS_EMR_STEP_SET_SPARK_DEFAULTS_CONF_SCRIPT_NAME=AWS-EMR-Step-SetSparkDefaultsConf.sh
AWS_EMR_STEP_INSTALL_VISUALIZATION_PACKAGES_SCRIPT_NAME=AWS-EMR-Step-InstallVisualizationPackages.sh
AWS_EMR_STEP_INSTALL_SCIKITS_AND_ML_PACKAGES_SCRIPT_NAME=AWS-EMR-Step-InstallSciKitsAndMachineLearningPackages.sh
AWS_EMR_STEP_INSTALL_GRAPH_AND_NETWORK_PACKAGES_SCRIPT_NAME=AWS-EMR-Step-InstallGraphAndNetworkPackages.sh
AWS_EMR_STEP_INSTALL_GEOSPATIAL_PACKAGES_SCRIPT_NAME=AWS-EMR-Step-InstallGeospatialPackages.sh
AWS_EMR_STEP_INSTALL_DEEP_LEARNING_PACKAGES_SCRIPT_NAME=AWS-EMR-Step-InstallDeepLearningPackages.sh
AWS_EMR_STEP_INSTALL_CHICAGOBOOTHML_HELPY_PACKAGE_SCRIPT_NAME=AWS-EMR-Step-InstallChicagoBoothMLHelpyPackage.sh
AWS_EMR_STEP_CLEAN_YUM_CACHE_SCRIPT_NAME=AWS-EMR-Step-CleanYumCache.sh
ENV_VARS_SCRIPT_NAME=.EnvVars
THEANORC_SCRIPT_NAME=.theanorc
AWS_REGION=us-west-1


# upload AWS EMR Bootstrap Action & Step scripts to S3 Bucket
echo "Uploading AWS EMR Bootstrap Action & Step scripts to s3://$S3_BUCKET_NAME..."

dos2unix BootActs/*.sh
dos2unix Steps/*.sh

aws s3 cp \
    BootActs/$AWS_EMR_BOOTACT_INSTALL_BASICS_SCRIPT_NAME \
    s3://$S3_BUCKET_NAME/$AWS_EMR_BOOTACT_INSTALL_BASICS_SCRIPT_NAME \
    --region $AWS_REGION \
    --no-verify-ssl

aws s3 cp \
    BootActs/$AWS_EMR_BOOTACT_INSTALL_SQL_SOFTWARE_SCRIPT_NAME \
    s3://$S3_BUCKET_NAME/$AWS_EMR_BOOTACT_INSTALL_SQL_SOFTWARE_SCRIPT_NAME \
    --region $AWS_REGION \
    --no-verify-ssl

aws s3 cp \
    BootActs/$AWS_EMR_BOOTACT_INSTALL_SCIPY_SCRIPT_NAME \
    s3://$S3_BUCKET_NAME/$AWS_EMR_BOOTACT_INSTALL_SCIPY_SCRIPT_NAME \
    --region $AWS_REGION \
    --no-verify-ssl

aws s3 cp \
    BootActs/$AWS_EMR_BOOTACT_LAUNCH_JUPYTER_SCRIPT_NAME \
    s3://$S3_BUCKET_NAME/$AWS_EMR_BOOTACT_LAUNCH_JUPYTER_SCRIPT_NAME \
    --region $AWS_REGION \
    --no-verify-ssl

aws s3 cp \
    Steps/$AWS_EMR_STEP_SET_SPARK_DEFAULTS_CONF_SCRIPT_NAME \
    s3://$S3_BUCKET_NAME/$AWS_EMR_STEP_SET_SPARK_DEFAULTS_CONF_SCRIPT_NAME \
    --region $AWS_REGION \
    --no-verify-ssl

aws s3 cp \
    Steps/$AWS_EMR_STEP_INSTALL_VISUALIZATION_PACKAGES_SCRIPT_NAME \
    s3://$S3_BUCKET_NAME/$AWS_EMR_STEP_INSTALL_VISUALIZATION_PACKAGES_SCRIPT_NAME \
    --region $AWS_REGION \
    --no-verify-ssl

aws s3 cp \
    Steps/$AWS_EMR_STEP_INSTALL_SCIKITS_AND_ML_PACKAGES_SCRIPT_NAME \
    s3://$S3_BUCKET_NAME/$AWS_EMR_STEP_INSTALL_SCIKITS_AND_ML_PACKAGES_SCRIPT_NAME \
    --region $AWS_REGION \
    --no-verify-ssl

aws s3 cp \
    Steps/$AWS_EMR_STEP_INSTALL_GRAPH_AND_NETWORK_PACKAGES_SCRIPT_NAME \
    s3://$S3_BUCKET_NAME/$AWS_EMR_STEP_INSTALL_GRAPH_AND_NETWORK_PACKAGES_SCRIPT_NAME \
    --region $AWS_REGION \
    --no-verify-ssl

aws s3 cp \
    Steps/$AWS_EMR_STEP_INSTALL_GEOSPATIAL_PACKAGES_SCRIPT_NAME \
    s3://$S3_BUCKET_NAME/$AWS_EMR_STEP_INSTALL_GEOSPATIAL_PACKAGES_SCRIPT_NAME \
    --region $AWS_REGION \
    --no-verify-ssl

aws s3 cp \
    Steps/$AWS_EMR_STEP_INSTALL_DEEP_LEARNING_PACKAGES_SCRIPT_NAME \
    s3://$S3_BUCKET_NAME/$AWS_EMR_STEP_INSTALL_DEEP_LEARNING_PACKAGES_SCRIPT_NAME \
    --region $AWS_REGION \
    --no-verify-ssl

aws s3 cp \
    Steps/$AWS_EMR_STEP_INSTALL_CHICAGOBOOTHML_HELPY_PACKAGE_SCRIPT_NAME \
    s3://$S3_BUCKET_NAME/$AWS_EMR_STEP_INSTALL_CHICAGOBOOTHML_HELPY_PACKAGE_SCRIPT_NAME \
    --region $AWS_REGION \
    --no-verify-ssl

aws s3 cp \
    Steps/$AWS_EMR_STEP_CLEAN_YUM_CACHE_SCRIPT_NAME \
    s3://$S3_BUCKET_NAME/$AWS_EMR_STEP_CLEAN_YUM_CACHE_SCRIPT_NAME \
    --region $AWS_REGION \
    --no-verify-ssl

aws s3 cp \
    .config/$ENV_VARS_SCRIPT_NAME \
    s3://$S3_BUCKET_NAME/$ENV_VARS_SCRIPT_NAME \
    --region $AWS_REGION \
    --no-verify-ssl

aws s3 cp \
    .config/$THEANORC_SCRIPT_NAME \
    s3://$S3_BUCKET_NAME/$THEANORC_SCRIPT_NAME \
    --region $AWS_REGION \
    --no-verify-ssl

echo "done!"


echo "Bidding for AWS EMR cluster with 1 x $MASTER_INSTANCE_TYPE Master @ \$$MASTER_INSTANCE_PRICE/node/hr + $NB_WORKER_NODES x $WORKER_INSTANCE_TYPE Core Workers @ \$$WORKER_INSTANCE_PRICE/node/hr..."

aws emr create-cluster \
    --name \
        "$REMARKS: 1 x $MASTER_INSTANCE_TYPE Master @ \$$MASTER_INSTANCE_PRICE/node/hr + $NB_WORKER_NODES x $WORKER_INSTANCE_TYPE Core Workers @ \$$WORKER_INSTANCE_PRICE/node/hr" \
    --release-label \
        emr-4.7.2 \
    --instance-groups \
        InstanceGroupType=MASTER,InstanceCount=1,InstanceType=$MASTER_INSTANCE_TYPE,BidPrice=$MASTER_INSTANCE_PRICE \
        InstanceGroupType=CORE,InstanceCount=$NB_WORKER_NODES,InstanceType=$WORKER_INSTANCE_TYPE,BidPrice=$WORKER_INSTANCE_PRICE \
    --no-auto-terminate \
    --use-default-roles \
    --log-uri \
        s3://$S3_BUCKET_NAME/zzzLogs \
    --ec2-attributes \
        KeyName=keypair \
    --no-termination-protected \
    --visible-to-all-users \
    --enable-debugging \
    --applications \
        Name=Spark \
    --bootstrap-actions \
        Path=s3://$S3_BUCKET_NAME/$AWS_EMR_BOOTACT_INSTALL_BASICS_SCRIPT_NAME,Name=$AWS_EMR_BOOTACT_INSTALL_BASICS_SCRIPT_NAME \
        Path=s3://$S3_BUCKET_NAME/$AWS_EMR_BOOTACT_INSTALL_SQL_SOFTWARE_SCRIPT_NAME,Name=$AWS_EMR_BOOTACT_INSTALL_SQL_SOFTWARE_SCRIPT_NAME \
        Path=s3://$S3_BUCKET_NAME/$AWS_EMR_BOOTACT_INSTALL_SCIPY_SCRIPT_NAME,Name=$AWS_EMR_BOOTACT_INSTALL_SCIPY_SCRIPT_NAME \
        Path=s3://$S3_BUCKET_NAME/$AWS_EMR_BOOTACT_LAUNCH_JUPYTER_SCRIPT_NAME,Name=$AWS_EMR_BOOTACT_LAUNCH_JUPYTER_SCRIPT_NAME \
    --steps \
        Type=CUSTOM_JAR,Jar=$AWS_EMR_SCRIPT_RUNNER_JAR,Args=s3://$S3_BUCKET_NAME/$AWS_EMR_STEP_SET_SPARK_DEFAULTS_CONF_SCRIPT_NAME,Name=$AWS_EMR_STEP_SET_SPARK_DEFAULTS_CONF_SCRIPT_NAME,ActionOnFailure=TERMINATE_CLUSTER \
        Type=CUSTOM_JAR,Jar=$AWS_EMR_SCRIPT_RUNNER_JAR,Args=s3://$S3_BUCKET_NAME/$AWS_EMR_STEP_INSTALL_VISUALIZATION_PACKAGES_SCRIPT_NAME,Name=$AWS_EMR_STEP_INSTALL_VISUALIZATION_PACKAGES_SCRIPT_NAME,ActionOnFailure=TERMINATE_CLUSTER \
        Type=CUSTOM_JAR,Jar=$AWS_EMR_SCRIPT_RUNNER_JAR,Args=s3://$S3_BUCKET_NAME/$AWS_EMR_STEP_INSTALL_SCIKITS_AND_ML_PACKAGES_SCRIPT_NAME,Name=$AWS_EMR_STEP_INSTALL_SCIKITS_AND_ML_PACKAGES_SCRIPT_NAME,ActionOnFailure=TERMINATE_CLUSTER \
        Type=CUSTOM_JAR,Jar=$AWS_EMR_SCRIPT_RUNNER_JAR,Args=s3://$S3_BUCKET_NAME/$AWS_EMR_STEP_INSTALL_GRAPH_AND_NETWORK_PACKAGES_SCRIPT_NAME,Name=$AWS_EMR_STEP_INSTALL_GRAPH_AND_NETWORK_PACKAGES_SCRIPT_NAME,ActionOnFailure=TERMINATE_CLUSTER \
        Type=CUSTOM_JAR,Jar=$AWS_EMR_SCRIPT_RUNNER_JAR,Args=s3://$S3_BUCKET_NAME/$AWS_EMR_STEP_INSTALL_GEOSPATIAL_PACKAGES_SCRIPT_NAME,Name=$AWS_EMR_STEP_INSTALL_GEOSPATIAL_PACKAGES_SCRIPT_NAME,ActionOnFailure=TERMINATE_CLUSTER \
        Type=CUSTOM_JAR,Jar=$AWS_EMR_SCRIPT_RUNNER_JAR,Args=s3://$S3_BUCKET_NAME/$AWS_EMR_STEP_INSTALL_DEEP_LEARNING_PACKAGES_SCRIPT_NAME,Name=$AWS_EMR_STEP_INSTALL_DEEP_LEARNING_PACKAGES_SCRIPT_NAME,ActionOnFailure=TERMINATE_CLUSTER \
        Type=CUSTOM_JAR,Jar=$AWS_EMR_SCRIPT_RUNNER_JAR,Args=s3://$S3_BUCKET_NAME/$AWS_EMR_STEP_INSTALL_CHICAGOBOOTHML_HELPY_PACKAGE_SCRIPT_NAME,Name=$AWS_EMR_STEP_INSTALL_CHICAGOBOOTHML_HELPY_PACKAGE_SCRIPT_NAME,ActionOnFailure=TERMINATE_CLUSTER \
        Type=CUSTOM_JAR,Jar=$AWS_EMR_SCRIPT_RUNNER_JAR,Args=s3://$S3_BUCKET_NAME/$AWS_EMR_STEP_CLEAN_YUM_CACHE_SCRIPT_NAME,Name=$AWS_EMR_STEP_CLEAN_YUM_CACHE_SCRIPT_NAME,ActionOnFailure=TERMINATE_CLUSTER

echo "For your cluster's status, please check: $AWS_REGION.console.aws.amazon.com/elasticmapreduce"
