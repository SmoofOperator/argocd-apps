# NGINX Helm Chart with Argo CD

This repository contains a Helm chart for deploying NGINX in a single environment and an Argo CD Application manifest for GitOps deployment.

```csharp
argocd-apps/
├── nginx/
│   └── templates/              # Go-templated Kubernetes manifests rendered by Helm.
│       ├── _helpers.tpl        # Reusable template helpers for naming and labels.
│       ├── deployment.yaml
│       ├── ingress.yaml
│       ├── namespace.yaml
│       └── service.yaml
├── application.yaml            # Argo CD Application manifest
├── Chart.yaml                  # Helm chart metadata
└── values.yaml                 # Default configuration for the chart
```

## Deployment

To render the manifests locally with Helm:
```bash
helm template nginx ./nginx-chart -f nginx-chart/values.yaml
```