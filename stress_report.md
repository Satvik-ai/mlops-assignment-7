## Phase 1 - Normal AutoScaling (1–3 pods)
```
Running 30s test @ http://34.58.82.31/predict/
  8 threads and 1000 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.33s   462.20ms   2.00s    66.21%
    Req/Sec    52.01     81.34   383.00     85.28%
  3853 requests in 30.06s, 683.71KB read
  Socket errors: connect 0, read 0, write 0, timeout 802
Requests/sec:    128.18
Transfer/sec:     22.74KB
```
### 📊 Phase 1 Summary
| Metric | Value |
|:--------|:--------|
| Requests/sec | 128.18 |
| Avg Latency | 1.33s 462.20ms |
| Transfer/sec | 22.74KB  |
### 📈 HPA and Pod Status After Phase 1
NAME               REFERENCE                 TARGETS         MINPODS   MAXPODS   REPLICAS   AGE
iris-fastapi-hpa   Deployment/iris-fastapi   cpu: 500%/60%   1         3         3          168m
 
### Restricted autoscaling to 1 pod
NAME               REFERENCE                 TARGETS         MINPODS   MAXPODS   REPLICAS   AGE
iris-fastapi-hpa   Deployment/iris-fastapi   cpu: 500%/60%   1         1         1          169m
 
## Phase 2 - Bottleneck Test (1 Pod, 2000 concurrent requests)
```
Running 30s test @ http://34.58.82.31/predict/
  8 threads and 2000 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.54s   353.68ms   2.00s    58.31%
    Req/Sec    48.85    116.15   757.00     91.69%
  3827 requests in 30.08s, 675.29KB read
  Socket errors: connect 0, read 0, write 0, timeout 1450
Requests/sec:    127.24
Transfer/sec:     22.45KB
```
### 📊 Phase 2 Summary
| Metric | Value |
|:--------|:--------|
| Requests/sec | 127.24 |
| Avg Latency | 1.54s 353.68ms |
| Transfer/sec | 22.45KB  |
 
### ✅ Restored original HPA settings after phase 2
NAME               REFERENCE                 TARGETS         MINPODS   MAXPODS   REPLICAS   AGE
iris-fastapi-hpa   Deployment/iris-fastapi   cpu: 500%/60%   1         3         1          169m
