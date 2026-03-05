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

When `configIni.enabled=true`, an ExternalSecret renders a full `config.ini` from a raw template and mounts it as a Secret (`mylar-config-ini`) into the init container. In that mode:

- the init container prefers the templated `config.ini` and copies it into `/config/config.ini` on first run,
- on subsequent runs it compares the template against the live config and logs `CONFIG_DIVERGENCE` with checksums,
- if `MYLAR_BOOTSTRAP_SYNC_ON_DIVERGENCE=true` (or `MYLAR_BOOTSTRAP_FORCE_REWRITE=true`), the live file is overwritten from the template; otherwise the live file is preserved and only drift is reported.

## Secrets required

No secrets are required for baseline startup.

Optional secret-driven values:

- `MYLAR_HTTP_USERNAME`
- `MYLAR_HTTP_PASSWORD`
- `MYLAR_API_KEY`
- `comicvine_api` (via `configIni.secretRefs.comicvineApi`)

When `externalSecrets.enabled=true`, an ExternalSecret creates/refreshes `mylar-config-bootstrap` with those keys.

## Key values

| Area | Where | Default |
|------|-------|---------|
| Config generation | `mylar.controllers.main.initContainers.bootstrap-config.env.MYLAR_CONFIG_GENERATION_ENABLED` | `false` |
| Config template path | `MYLAR_CONFIG_TEMPLATE_PATH` | `/mnt/mylar-config/config.ini` |
| Templated config Secret | `configIni.*` | disabled (`false`) |
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
