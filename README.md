# Mylar Helm Chart

Baseline Helm chart for [Mylar](https://github.com/mylar3/mylar3) (comics and manga collection manager), built on the [bjw-s app-template](https://github.com/bjw-s/helm-charts).

## What this baseline does

- Uses a sanitized baseline with no real hostnames or environment-specific claims.
- Keeps indexer and downloader endpoint settings unmanaged by chart defaults.
- Supports optional config generation/merge from chart-managed keys.
- Supports optional ExternalSecrets-backed sensitive inputs.

## Config generation behavior

Config generation is disabled by default (`MYLAR_CONFIG_GENERATION_ENABLED=false`).

When enabled, the init container:

- builds a managed config profile for core collector settings,
- compares managed keys against live `/config/config.ini`,
- logs `CONFIG_DIVERGENCE` if managed keys drift,
- merges managed keys only when `MYLAR_BOOTSTRAP_SYNC_ON_DIVERGENCE=true` (or force rewrite).

This means live config always remains the source of truth unless you explicitly enable sync behavior.

## Secrets required

No secrets are required for baseline startup.

Optional secret-driven values:

- `MYLAR_HTTP_USERNAME`
- `MYLAR_HTTP_PASSWORD`
- `MYLAR_API_KEY`

When `externalSecrets.enabled=true`, an ExternalSecret creates/refreshes `mylar-config-bootstrap` with those keys.

## Key values

| Area | Where | Default |
|------|-------|---------|
| Config generation | `mylar.controllers.main.initContainers.bootstrap-config.env.MYLAR_CONFIG_GENERATION_ENABLED` | `false` |
| Prowlarr ownership hint | `...MYLAR_PROWLARR_MANAGED` | `false` |
| Bootstrap secret source | `externalSecrets.enabled` | `false` |
| Ingress | `mylar.ingress.main.enabled` | `false` |
| Config storage | `mylar.persistence.config.*` | PVC (2Gi) |
| Comics/downloads | `mylar.persistence.comics/downloads.*` | `emptyDir` |

## Render & validation

```bash
helm dependency update . && helm template mylar . -f values.yaml -n mylar
helm template mylar . -f values.yaml --set externalSecrets.enabled=true -n mylar
```
