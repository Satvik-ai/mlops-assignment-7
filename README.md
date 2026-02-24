# 🌸 Iris Classification ML Model — CI/CD Pipeline with Stress Testing & Kubernetes Autoscaling

This project extends the **Iris ML CI/CD pipeline** to evaluate **deployment robustness under high load**.  
It demonstrates how to **stress test a production ML API**, observe system behavior, and validate **Kubernetes Horizontal Pod Autoscaling (HPA)**.

The pipeline automates testing scenarios using **wrk**, enabling performance benchmarking and bottleneck analysis.

---

## 🎯 Assignment Objective

- Extend the [CI/CD workflow](https://github.com/Satvik-ai/mlops-assignment-6) to include **stress testing**
- Simulate high traffic scenarios (>1000 requests)
- Demonstrate **Kubernetes autoscaling**:
  - Default pods: **1**
  - Maximum pods: **3**
- Analyze system bottlenecks when autoscaling is restricted
- Compare performance at **1000 vs 2000 concurrent requests**

---

## 🧰 Tools & Technologies

- Git — Code versioning  
- DVC — Data versioning  
- MLflow — Experiment tracking & model registry  
- GitHub Actions — CI, CD, and stress testing automation  
- FastAPI — Model serving (`/predict/` endpoint)  
- Docker — Containerization  
- Google Artifact Registry — Image storage  
- Google Kubernetes Engine — Deployment  
- wrk — Load testing tool  
- Google Cloud Logging, Trace & Monitoring — Observability  

---

## 🗂️ Repository Structure

```
├── data/
│ └── iris.csv
├── artifacts/
├── src/
│ └── train.py
├── tests/
│ ├── test_data_validation.py
│ └── test_model_evaluation.py
├── app/
│ ├── main.py
│ ├── Dockerfile
│ ├── requirements.txt
│ └── k8s/
│ ├── deployment.yaml
│ ├── service.yaml
│ └── hpa.yaml
├── .github/workflows/
│ ├── ci-dev.yml
│ ├── ci-main.yml
│ ├── cd.yml
│ └── stress_test.yml
├── create_gke_cluster.sh
├── stress_report.md
├── requirements.txt
├── week7_GA_setup.ipynb
└── README.md
```

---

## 📁 File Details

### 🔹 data/
Stores `iris.csv` dataset tracked with DVC.

---

### 🔹 artifacts/
Contains locally stored trained model artifacts.

---

### 🔹 src/train.py

- Loads dataset  
- Trains a **Decision Tree classifier**  
- Logs parameters, metrics, and model to MLflow  

---

### 🔹 tests/

- **test_data_validation.py** — Validates dataset integrity  
- **test_model_evaluation.py** — Validates model performance  

---

### 🔹 GitHub Actions Workflows

#### ci-dev.yml
Runs CI for **dev branch**.

#### ci-main.yml
Runs CI for **main branch**.

#### cd.yml
Continuous Deployment pipeline:

1. Builds Docker image  
2. Pushes to Artifact Registry  
3. Deploys to Kubernetes  

#### stress_test.yml
Performs automated load testing:

- Sends ~1000 concurrent requests  
- Observes autoscaling (1 → 3 pods)  
- Restricts autoscaling to 1 pod  
- Sends 2000 concurrent requests for bottleneck analysis  

---

### 🔹 app/

#### main.py
- Loads model  
- Creates FastAPI app  
- Exposes `/predict/` endpoint  
- Integrates Cloud Logging & Monitoring  

#### Dockerfile
Builds lightweight Python container with FastAPI app.

#### k8s/deployment.yaml
Defines application deployment.

#### k8s/service.yaml
Exposes API via LoadBalancer.

#### k8s/hpa.yaml
Configures Horizontal Pod Autoscaler.

---

### 🔹 create_gke_cluster.sh
Script to provision Kubernetes cluster.

---

### 🔹 stress_report.md
Contains performance metrics and observations from load tests.

---

### 🔹 week7_GA_setup.ipynb
Notebook used for environment and workflow setup.

---

## 🔄 End-to-End Workflow

1️⃣ Code pushed → CI runs tests  
2️⃣ Successful CI → CD builds & deploys API  
3️⃣ Stress test workflow triggers  
4️⃣ Load generated using wrk  
5️⃣ Kubernetes autoscaling observed  
6️⃣ Metrics captured via Cloud Monitoring  

---

## 🎥 Video Presentation  
[▶️ Click Here](https://drive.google.com/file/d/1L6O3i4ROsIamXOt1njYAP6v3JJMisHuR/view?usp=drive_link)
