# NGINX Package Registry

This project provides a lightweight NGINX-based package registry for serving files. It supports:

- Serving files at `/packages/` for public download.
- Authenticated uploads through a `/upload` endpoint.

## Usage

To use this package registry, define the following docker environment variables:

- **`UPLOAD_USER`**: Username for upload authentication.
- **`UPLOAD_PASSWORD`**: Password for the authenticated user.

## Recommended file structure

It is recommended to follow this pattern: `<package group>/<package name>/<file name>`. For example:

```
packages/moodle/local_adlersetup/1.0.0.zip
```

## Example upload

You can upload files using `curl`:

```bash
curl -u uploader:securepassword -T 0.1.0.zip http://localhost:8680/upload/moodle/local_adlersetup/1.0.0.zip
```