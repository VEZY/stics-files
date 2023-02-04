# STICS files

This package is used to release STICS-related files according to each version of the model.

## Files

- `csv`: CSV files containing the input parameters and output variables of the model
- `obs`: observation files used to calibrate the model. Different formats are available to perform tests: 
  - `empty`: an empty file 
  - `simple_example`: a simple example with a `usms.xml` file to get the usm name
  - `simple_example_no_usms`: the same one without the `usms.xml`, 
  - `mixed`: an example of an intercrop
  - `usms_outside`: an example with the `usms.xml` file outside the workspaces
- `sti`: example output files of the model.
  - `workspace_root`: an example of a folder that itself contains two workspaces
  - `workspace1` example workspace output files, with outputs for usms of a maize, a grass and a mix of pea and barley. The mod_sa* = associated plant (barley) and the mod_sp* = principal plant (pea).
  - `workspace2`: another example workspace output files, with outputs for usms of a rice, a soybean, a sunflower and a wheat.
  - `usms_example.xml`: an example of a usms.xml file that contains the usms of all workspaces
  - `usms.xml`: an example of a usms.xml file that contains only the usms of banana and rice
- `stylesheets`: XSLT files used to convert XML files to text files
- `txt`: text files used as input of the model. They are generated from the XML files using the XSLT files.
  - `intercrop_pea_barley`: an example of text files for an intercrop of pea and barley
  - `maize`: an example of text files for a maize
- `xl`: example excel files to generate usms from a spreadsheet
- `xml`: example XML files to generate text usms.
  - `examples`: example workspace with three scenarios, a simulation of a maize, a soybean and a wheat. A workspace is a folder containing the input files as XML files. It can be seen as a database. These files are used to generate text files that are used by the model.
  - `templates`: template files to generate XML files from a spreadsheet.

## Usage

### Release a new version

There are two cases where you may need to make a release of this repository: a new version of STICS is released, or you are developing a research branch of STICS and changed the inputs or outputs.

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