# Apigee API Hub Quickstart
This is a project for setting up a test instance of [Apigee API Hub](https://cloud.google.com/apigee/docs/apihub/what-is-api-hub) as a basis for universal API management (multi-cloud, multi-gateway, multi-team).

To begin, set your GCP project information as shown below.

```sh
# first copy the 0.env.sh file to a local version
cp 0.env.sh 0.env.local.sh
# now edit the local file to set your project information
nano 0.env.local.sh
# source the file to apply the variables into your shell
source 0.env.local.sh
```

If you don't have an active GCP project, You can provision one, along with an Apigee Trial (free tier), API Hub (free with Apigee), and Application Integration (free tier) using a script like the quickstart [here](https://github.com/api-integration-samples/apigee-integration-quickstart), or by using the console wizards or your automation tool of choice.

The script here will activate API Hub in an existing GCP project.

```sh
# provision API Hub into an existing GCP project, if not already done.
./1.provision.sh
```
Now 
```sh
# update the API Hub metadata
./2.update.data.sh
```