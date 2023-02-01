# STICS files

This package is used to release STICS-related files according to each version of the model.

## Usage

### Release a new version

To release a new version, you need to:

- Fork the repository
- Update the files according to the new version
- Make a pull request to the main repository

Then I'll review the pull request, merge it and make a release with the version name.

### Add the new version to Stics.jl

To add the new version to Stics.jl, we need to add the release tarball to the `Artifacts.toml` file. We can do this automatically using the `add_artifact!` function from the `ArtifactsUtils.jl` package. For example, here's the code we used to add the `v10.0` version:

```julia
add_artifact!("Artifacts.toml", "v10.0", "https://github.com/VEZY/stics-files/archive/refs/tags/v10.tar.gz")
```

If your version is a development version, not a STICS release, you have to use the argument `lazy = true` in `add_artifact!()`, because we don't want it to be downloaded by default by the users.

If your version is a release of STICS, you'll have to update the `lazy` field to `false` for the previous version of STICS in the `Artifacts.toml` file, as we only download the latest version by default.