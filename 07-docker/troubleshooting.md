# Docker Troubleshooting

## Dockerfile Not Found

### Error

```text
unable to prepare context:
unable to evaluate symlinks in Dockerfile path:
lstat /home/ubuntu/Dockerfile: no such file or directory
```

### Cause

The `docker build` command was executed from a directory that did not contain a `Dockerfile`.

The `.` in:

```bash
docker build -t image-name .
```

means Docker should use the current directory as the build context.

### Troubleshooting

Check the current directory:

```bash
pwd
```

List its contents:

```bash
ls -la
```

Verify that a file named exactly `Dockerfile` exists.

Then change to the correct project directory:

```bash
cd ~/my-first-docker-app
```

Build again:

```bash
docker build -t ajaykumar9306/my-first-docker-image:latest .
```