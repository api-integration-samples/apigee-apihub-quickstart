# Apigee API Hub Quickstart
This is a project for setting up a test instance of [Apigee API Hub](https://cloud.google.com/apigee/docs/apihub/what-is-api-hub) as a basis for universal API management (multi-cloud, multi-gateway, multi-team).

## Step 1
To begin, you will need a Google Cloud project to work in, and have environment variables initialized to your GCP Project Id and Region. You can set the variables using these commands.

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
## Step 2
Now we will load some sample test data into API Hub. Take a look at the file `2.update.data.sh` to see the data that will be updated, which includes adding other cloud gateways to the deployment types, and some sample business units and teams. Make any adjustments that you would like to have in your environment.
```sh
# update the API Hub metadata
./2.update.data.sh
```