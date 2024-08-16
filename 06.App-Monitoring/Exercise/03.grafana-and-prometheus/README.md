# 3. Grafana and Prometheus

> Our task is to configure Prometheus to monitor https://softuni.org. In order for this to happen, we shall use the Prometheus Blackbox Exporter.

Prometheus Blackbox Exporter is designed to probe various endpoints and expose the results as metrics that Prometheus can scrape.

>## Step 1: Log in to Grafana

By default, Grafana will be listening on http://localhost:3000. You can log in with the default credentials:

· Email or username: admin

· Password: admi


>## Step 2: Create Prometheus Data Source in Grafana

Open the sidebar on the left and go to [Connections]:


>## Step 3: Configure Prometheus Data Source

Now, let's create a Prometheus data source:


>## Step 4: Create a Grafana Dashboard

Now, let's create a new dashboard. Go to the left sidebar again and click on [Dashboards]. Click on the [New] button and select [New Dashboard]

>## Step 5: Import and Export Dashboards

You can export and import Grafana dashboards as JSON files.

``` json
{
  "datasource": {
    "type": "prometheus",
    "uid": "fdv0dqpxc47pce"
  },
  "fieldConfig": {
    "defaults": {
      "custom": {
        "stacking": {
          "mode": "none",
          "group": "A"
        },
        "lineWidth": 1,
        "fillOpacity": 80,
        "gradientMode": "none",
        "hideFrom": {
          "tooltip": false,
          "viz": false,
          "legend": false
        }
      },
      "color": {
        "mode": "palette-classic"
      },
      "mappings": [],
      "thresholds": {
        "mode": "absolute",
        "steps": [
          {
            "color": "green",
            "value": null
          },
          {
            "color": "red",
            "value": 80
          }
        ]
      }
    },
    "overrides": []
  },
  "gridPos": {
    "h": 8,
    "w": 12,
    "x": 0,
    "y": 0
  },
  "id": 1,
  "options": {
    "legend": {
      "showLegend": true,
      "displayMode": "list",
      "placement": "bottom",
      "calcs": []
    }
  },
  "targets": [
    {
      "datasource": {
        "type": "prometheus",
        "uid": "fdv0dqpxc47pce"
      },
      "disableTextWrap": false,
      "editorMode": "builder",
      "expr": "probe_duration_seconds",
      "fullMetaSearch": false,
      "includeNullMetadata": true,
      "instant": false,
      "legendFormat": "__auto",
      "range": true,
      "refId": "A",
      "useBackend": false
    }
  ],
  "title": "Histogram",
  "type": "histogram"
}
```

In order to export a dashboard, open Dashboards and then click on [Share]:

