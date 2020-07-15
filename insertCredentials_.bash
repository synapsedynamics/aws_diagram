#!/usr/bin/env bash
set -x
if [ -z "$AWS_ACCESS_KEY_ID" ] || [ -z "$AWS_DEFAULT_REGION" ] ; then
    echo "One of AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_DEFAULT_REGION missing"  ; exit ; fi

set +x
if [ -z "$AWS_SECRET_ACCESS_KEY" ] ; then
    echo "One of AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_DEFAULT_REGION missing"  ; exit ; fi
set -x

sed -i s@__accesskey__@"$AWS_ACCESS_KEY_ID"@g      ./terraform.tf ./*/terraform.tf ./*/*/terraform.tf
set +x
sed -i s@__secretkey__@"$AWS_SECRET_ACCESS_KEY"@g  ./terraform.tf ./*/terraform.tf ./*/*/terraform.tf
set -x
sed -i s@__awsregion__@"$AWS_DEFAULT_REGION"@g     ./variables.tf
