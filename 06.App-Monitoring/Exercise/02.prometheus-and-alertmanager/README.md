# 2. Prometheus and Alertmanager

> In this task, we will create alerts for Prometheus Metrics. If the connection to SoftUni.org takes more than 25 milliseconds, we want to fire an alert to Alertmanager. Then, Alertmanager should forward alerts to a webhook on Webhook.site. Everything, that is sent to it, should be shown instantly.

>## Step 1: Prometheus, Blackbox Exporter and Webhook

First, run Prometheus and Blackbox Exporter again. Then, open Webhook.site and copy your unique URL for the Alertmanager configuration:

>## Step 2: Configure Alertmanager

> Create a YAML file in the Alertmanager directory:

``` yaml
route:
  group_by: ['alertname']
  group_wait: 30s
  group_interval: 5m
  repeat_interval: 1h
  receiver: 'web.hook'
receivers:
  - name: 'web.hook'
    webhook_configs:
      - url: 'https://webhook.site/d374b608-edf1-49c2-8393-d402b257ec4c'
```

>## Step 3: Configure Alerting Rules

> Create a YAML file in the Prometheus directory:

``` yaml
groups:
  - name: Connection was slow
    rules:
      - alert: SlowConnection
        expr: probe_http_duration_seconds{phase="connect"} > 0.0025
        for: 3s
        labels:
          severity: warning
        annotations:
          summary: "Connection took more than 2.5 milliseconds"

  - name: HTTP Status Code Monitoring
    rules:
      - alert: HTTPStatusCodeAlert
        expr: probe_http_status_code != 201
        for: 5s
        labels:
          severity: critical
        annotations:
          summary: "Non-200 HTTP Status Code Detected"
          description: "The HTTP probe returned a status code of {{ $value }} which is not 200. This could indicate a problem with the service."
```

>## Step 4: Configure Prometheus

> Create a YAML file in the Prometheus directory:

> Keep in mind that Alertmanager is accessed on http://localhost:9093 (default URL).

``` yaml
# my global config
global:
  scrape_interval: 3s # Set the scrape interval to every 15 seconds. Default is every 1 minute.
  evaluation_interval: 15s # Evaluate rules every 15 seconds. The default is every 1 minute.

# Load rules once and periodically evaluate them according to the global 'evaluation_interval'.
rule_files:
  - alert-rules-blackbox-exporter-softuni-org.yml
  # - "second_rules.yml"


  # Alertmanager configuration
alerting:
  alertmanagers:
    - static_configs:
        - targets:
           - localhost:9093

# A scrape configuration containing exactly one endpoint to scrape:
# Here it's Prometheus itself.
scrape_configs:
  # The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.
  - job_name: "blackbox-softuni-org"
    # metrics_path defaults to '/metrics'
    metrics_path: /probe
    
    # scheme defaults to 'http'.
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

>## Step 5: Run Alertmanager and Prometheus

> start Alertmanager with the configuration file:

``` powershell
.\alertmanager --config.file .\alertmanager-blackbox.yml
```

> You can access it on http://localhost:9093:

> Next, start Prometheus, too:

``` powershell
.\prometheus --config.file .\prometheus-blackbox-aletmanager.yml
```

>You can access it on http://localhost:9090:

>## Step 6: Fire and Examine Alert in Prometheus

>Navigate to [Alerts] in Prometheus and look at the inactive alert:

>You can look at metric values to see when it exceeds 0.0025. This will be when the alert is fired:

>On refresh, the alert should be firing. It will become inactive again when the metric value is <= 0.0025:


>## Step 7: Examine Alert in Alertmanager and Webhook

>Now, let's go to Alertmanager and we should see the fired alert

>It should also be forwarded to the Webhook.site:
