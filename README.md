# Iris Classification ML Model - CI/CD Pipeline

**MLOps - Week 7 - Assignment - 21f1000344**

## Assignment Objective : 
- Extend week 6 Github CI/CD workflow to stress test the deployment 
- Use wrk to stimulate the scenario of high number(>1000) of requests after successful deployment 
- Demonstrate Kubernetes auto scaling with max_pods : 3 and default pod availability of 1
- Observe bottlenecks when auto scaling is restricted to 1 pod and request concurrency increased from 1000 to 2000

## Tools Used :
- Git for code versioing
- DVC for data versioning
- MLFlow for model versioning, expermiment tracking and reproducibility
- GitHub Actions for Continuous Integration, Continuous Deployment and stress testing
- FastAPI for serving the model via `/predict/` endpoint
- Docker for creating image
- Google Artifact Registry for storing the docker image
- Google Kubernetes Engine for running the instance of the docker image
- Google Cloud Logging, Trace and Monitoring


---

## Files

### 1. `data` folder
- **Key Utilities:**
  - Stores `iris.csv` data

### 2. `artifacts` folder
- **Key Utilities:**
  - Stores the trained iris classification model locally

### 3. `src/train.py`
- **Key Utilities:**
  - Loads the `iris.csv` 
  - Trains a `Decision Tree` model
  - Logs experiment parameters, eval metrics and models utilizing MLFlow

### 4. `tests/test_data_validation.py` and `tests/test_model_evaluation`
- **Key Utilities:**
  - Runs unit tests using pytest on data and model

### 5. `requirements.txt`
- **Key Utilities:**
  - List of required packages for the Continuous Integration (CI) with GitHub Actions

### 6. `.github/worflows/ci-dev.yml` and `.github/worflows/ci-main.yml`
- **Key Utilities:**
  - YAML file for configuring GitHub Actions to perform Continuous Integration (CI)
  - `ci-dev.yml` perfroms CI for `dev` branch on push and pull request
  - `ci-main.yml` perfroms CI for `main` branch on push and pull request
  - On push, CI for the respective branch will be triggered
  - On pull request, CI for the both the branch be triggered
  - Fetches the model and data needed for evaluation from DVC
  - Runs sanity test and prints report as a comment using cml

### 7. `.github/worflows/cd.yml`
- **Key Utilities:**
  - YAML file for configuring GitHub Actions to perform Continuous Deploymement (CD)
  - Gets triggered after a successful CI on main branch
  - Builds the docker image using DockerFile
  - Pushes the image to Google Artifact Registry
  - Deploys the container image of Iris FastAPI application on Google Kubernetes Engine

### 8. `.github/worflows/stress_test.yml`
- **Key Utilities:**
  - Uses wrk to stimulate the scenario of high number(1000) of requests after successful deployment to demonstrate Kubernetes auto scaling from 1 pod to 3 pods
  - Performs bottleneck testing by restricting autoscaling to 1 pod and concurrently sending 2000 requests

### 8. `app` folder
- **Key Utilities:**
  - Serves as the root directory for deployment
  - `main.py` :- Loads the model, creates a FastAPI app, and builds a `/predict/` endpoint which accepts a post request with features in the body and serves the predicted classification label. Googe cloud logging, trace and monitoring has also been setup.
  - `Dockerfile` :- It is used to create image that spuns out a lightweight Python 3.10 container to run a FastAPI application with its dependencies and model files using Uvicorn on port 8000
  - `k8s/deployment.yaml` :- Deploys a replica of the Iris FastAPI application (using the specified container image)
  - `k8s/service.yaml` :- Exposes Iris FastAPI application externally via a LoadBalancer service that maps port 80 to container port 8000
  - `k8s/hpa.yaml` :- Defines rules for horizontal autoscaling
  - `requirements.txt` :- Contains the list of packages needed for running the main.py. Dockerfile uses it to download the dependencies

### 9. `week7_GA_setup.ipynb`
- **Key Utilities:**
  - Created in Vertex AI workbench
  - Serves as an interface for performing actions local working directory
  - Setup Git Repository with `dev` and `main` branch
  - Setup DVC with GCS bucket as remote storage
  - Created YAML file for GitHub Actions
  - Pushed the local working directory to remote repo on GitHub

### 10. `create_gke_cluster.sh`
- **Key Utilities:**
  - Bash script to provision Google Kubbernetes Cluster

### 11. `stress_report.md`
- **Key Utilities:**
  - Output report of stress test performed


---
