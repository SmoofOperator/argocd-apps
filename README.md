# ArgoCD Repository

## Repository Structure

```plaintext
argocd-apps/
├── application-config/
│   ├── kustomization.yaml
│   ├── traefik/
│   │   ├── deployment.yaml
│   │   └── service.yaml
│   └── ...
└── kustomization.yaml
```

### Directory Breakdown

- **application-config/**: Contains the core configurations for each application. Each application has its own folder with deployment and service files.
  
- **kustomization.yaml**: Combines the resources for all applications into a single coherent application deployment.

### Steps to Deploy

1. **Clone the Repository**:
   ```bash
   git clone git@github.com:smoofoperator/argocd-apps.git
   cd homelab-argocd
   ```

2. **Add the Git Repository to ArgoCD**:
   Use the ArgoCD CLI to add this repository with an SSH key:
   ```bash
   argocd repo add https://github.com/smoofoperator/argocd-apps.git \
  --username smoofoperator \
  --password <access_token>

   ```

3. **Create the Traefik Application in ArgoCD**:
   Use the ArgoCD CLI to add the Traefik application:
   ```bash
   argocd app create traefik \
     --repo git@github.com:your_username/homelab-argocd.git \
     --path application-config/traefik \
     --dest-server https://kubernetes.default.svc \
     --dest-namespace traefik
   ```

4. **Sync the Application**:
   After creating the application, use the following command to sync:
   ```bash
   argocd app sync traefik
   ```

5. **Add Additional Applications via the ArgoCD UI**:
   - Now that Traefik is set up, you can continue to add other applications through the ArgoCD UI.