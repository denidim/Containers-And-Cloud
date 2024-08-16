# 1. Prometheus and Blackbox Exporter: Run Prometheus Server that Monitors SoftUni.org

> Our task is to configure Prometheus to monitor https://softuni.org. In order for this to happen, we shall use the Prometheus Blackbox Exporter.

Prometheus Blackbox Exporter is designed to probe various endpoints and expose the results as metrics that Prometheus can scrape.

>## Step 1: Install and Run Blackbox Exporter

``` powershell
docker run -p 9115:9115 quay.io/prometheus/blackbox-exporter

#Step 2: Navigate to the exporter URL in the browser with the correct target:
http://localhost:9115/probe?target=https://softuni.org

```
>## Step 3: Configure and Run Prometheus

> Configure Prometheus to use the Blackbox Exporter metrics:
``` yaml
global:
  scrape_interval: 3s

scrape_configs:
  
  - job_name: "blackbox-softuni-org"
    metrics_path: /probe

    static_configs:
      - targets:
        - https://softuni.org
    relabel_configs:
      - source_labels: [__address__]
        target_label: __param_target
      - source_labels: [__param_target__]
        target_label: instance
      - target_label: __address__
        replacement: 127.0.0.1:9115
```

> Start Prometheus server with the configuration file:
``` powershell
PS C:Users\PC>.\prometheus.exe --config.file=prometheus-blackbox-softuni-org.yml
```

>## Step 4: Access Prometheus
 http://localhost:9090
 
>## Step 5: Examine Metrics