# Deploy AWS Lambda functions with Razorops CI/CD 

If you have forked this repo, then connect with Razorops to create your demo pipeline by following the below button

[![Connect](https://github.com/razorops-public/images/blob/main/connect_with_github.svg)](https://dashboard.razorops.com/get-github-installation-link-for-org)

This is an example code to demonstrate how to deploy serverless functions on [AWS lambda][1] using pipeline on [Razorops](https://docs.razorops.com/).

It contains simple functions written in [Python](https://docs.aws.amazon.com/lambda/latest/dg/lambda-python.html) runtime and includes steps to deploy on AWS lambda service. 

## Automating deployment 

We've provided two functions defined in (python-1)[./python-1] and (python-2)[./python-2] directories based on Python runtime supported by Lambda service and [automation](./razorops.yaml) to deploy them based on AWS. 

### Creating AWS credentials for deployment

Before deploying your changes via CI/CD pipeline, you need to create AWS credentials to enable access from the pipeline. You will most likely have a IAM user having the following policy linked to you lambda functions - 

```
lambda:GetFunctionConfiguration
lambda:UpdateFunctionConfiguration
lambda:UpdateFunctionCode
lambda:PublishVersion
```

We have included [terraform](./terraform/) script to help you create a IAM role that can be used for deployment in pipeline.

After creating the IAM user, you can set `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` in pipeline's variables in the dashboard.

### Commit code

You can now simply change your code and commit to your main/master branch to trigger the deployment process. It would detect the folders in which you've made the changes and only deploy them if code for a function is changed.

    git commit -a -m <mesage>
    git push


### CI/CD pipeline

If you're new to Razorops, feel free to fork this repository and use it to [create a project](https://docs.razorops.com/getting_started/).

`.razorops.yaml` contains the pipeline code to build and execute the tests for this project. To know more about how to write and customize, refer to the [documentation](https://docs.razorops.com). Here is the link of [the pipeline](https://dashboard.razorops.com/apps/weathered-frost-6792687//workflows) workflows page.

### License

Copyright (c) 2024 Razorops LLC

Distributed under the MIT License. See the file LICENSE.md.

[1]: https://aws.amazon.com/lambda/
