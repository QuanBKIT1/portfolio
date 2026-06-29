# portfolio

Static portfolio site for **Duc Quan** — deployed via AWS CI/CD (CodePipeline + CodeBuild).

## Structure

| Path | Purpose |
|---|---|
| `index.html`, `assets/` | The static site |
| `buildspec.yml` | CodeBuild spec for the **S3** pipeline (output `dist/`) |
| `buildspec-ec2.yml` | CodeBuild spec for the **EC2** pipeline (output `web/` + `appspec.yml` + `scripts/`) |
| `appspec.yml`, `scripts/` | CodeDeploy config for EC2 (nginx on port 80) |

`__BUILD_INFO__` in `index.html` is replaced at build time with the commit hash + UTC timestamp.

## Pipelines

- **S3:** GitHub → CodePipeline → CodeBuild → S3 static website (ap-southeast-1).
- **EC2:** GitHub → CodePipeline → CodeBuild → CodeDeploy → EC2 nginx.

Local preview: `python3 -m http.server` then open http://localhost:8000.
