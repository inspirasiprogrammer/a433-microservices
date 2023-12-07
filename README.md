# kubernetes
Kubernetes

### How Running
1. First you must install minikube on ubuntu 22.04
```
https://phoenixnap.com/kb/install-minikube-on-ubuntu
```
2. Running Minikube
```
minikube start
```
3. Running kubectl for backend and mongodb
```
kubectl apply -f mongodb -f backend
```
4. Check minikube ip dan service
```
minikube ip
```
```
kubectl get service
```
5. Akses service melalui browser
```
minikube service karsajobs
```
6. Kunjungi url yang ditanpilkan pada terminal
```
http://192.168.49.2:30080/jobs
```
Jika null maka sudah benar.

7. Ganti ip konfigurasi pada frontend/karsajobs-ui-deployment.yaml
```
...
    spec:
      containers:
      - name: karsajobs-ui
        image: karsajobs-ui:latest
        ports:
        - containerPort: 8000
        env:
        - name: VUE_APP_API_URL
          value: http://192.168.49.2:30080
...
```
8. Running kubectl for frontend
```
kubectl apply -f frontend
``` 
9. Check Pods is running
```
kubectl get pods
```
10. Check service frontend
```
minikube service karsajobs-ui
```
11. Check detail pods
```
kubectl describe pods karsajobs-ui-5b8b8f6b4f-8q9q2
```
12. Check detail service
```
kubectl describe service karsajobs-ui
```