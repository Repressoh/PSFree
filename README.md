# PSFree version 1.5.0b

Lapse Kex ported to 9.00

Very fast and reliable! Around 80% stability rate.

Update: I've added an payload having some process_dtor_handler patches related to aio bugs.. Now all games should work properly.. patches were made by abc for 8.0x and I ported to 9.00. Thx a lot to Sistro and CTN for some explanation on low level coding!!! :)

PSFree is a collection of exploits for the PS4 console. The main focus of the 
repo is for the PS4 but we try to make things portable to PS5.

* Exploits
  * PSFree: src/psfree.mjs
  * Lapse (kernel): src/scripts/lapse.mjs

## Docker hosting

Build and run the website locally:

```sh
docker build -t psfree .
docker run -d --name psfree --restart unless-stopped -p 8080:80 psfree
```

Open `http://localhost:8080`, or `http://<host-lan-ip>:8080` from your console
on the same network. The image serves the included website and payloads using
nginx, with MIME types for JavaScript modules and the offline-cache manifest.

### GitHub Container Registry

The `Docker image` GitHub Actions workflow checks that the container serves the
website and every offline-cache asset before publishing images for Linux AMD64
and ARM64 to `ghcr.io/<owner>/<repository>` (lowercase).

- Pull requests build and test the image without publishing.
- Pushes to `main` publish `edge` and `sha-<short-commit>` tags.
- Publishing a GitHub release publishes its exact tag (for example `v1.5.0`)
  and a commit tag. Non-prerelease releases also update `latest`.
- Manual workflow runs publish a commit tag and update `edge` when run on the
  default branch.

After the first successful main-branch workflow run, use the published image:

```sh
docker run -d --name psfree --restart unless-stopped -p 8080:80 ghcr.io/repressoh/psfree:edge
```

Use `:latest` after publishing a stable GitHub release, or an exact release tag
to select a specific version. Forks should replace `repressoh/psfree` with their
own lowercase owner/repository name.

Publishing uses the automatic `GITHUB_TOKEN` with `packages: write`; no additional
registry secret is needed. To allow unauthenticated pulls, set the package's
visibility to public in its GitHub package settings after its first publication.
Private packages require authentication with `docker login ghcr.io`.
See [GitHub's image publishing documentation](https://docs.github.com/en/actions/tutorials/publish-packages/publish-docker-images).

# COPYRIGHT AND AUTHORS:
AGPL-3.0-or-later (see src/COPYING). This repo belongs to the group
`anonymous`. We refer to anonymous contributors as "anonymous" as well.
# CREDITS:
* anonymous for PS4 firmware kernel dumps
* Check the appropriate files for any **extra** contributors. Unless otherwise
  stated, everything here can also be credited to us.
