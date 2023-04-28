MongoDB Package
============
This is a MongoDB [Kurtosis package](https://docs.kurtosis.com/concepts-reference/packages).

Run this package
----------------
Open [the Kurtosis playground](https://gitpod.io/#/https://github.com/kurtosis-tech/playground-gitpod) and run:

```bash
kurtosis run github.com/kurtosis-tech/mongodb-package
```

To run it locally, [install Kurtosis][install-kurtosis] and run the same.

To blow away the created [enclave][enclaves-reference], run `kurtosis clean -a`.

#### Configuration

<details>
    <summary>Click to see configuration</summary>

You can configure this package using a JSON structure as an argument to the `kurtosis run` function. The full structure that this package accepts are as follows, with default values shown (note that the `//` lines are not valid JSON and should be removed!):

```javascript
{
    // The name to give the new Mongo service
    "name": "mongoDB",

    // The image to run
    "image": "mongo:6.0.5",

    // The user that will be created
    "user": "root",

    // The password of the user that will be created
    "password": "password",

    // Additional environment variables that will be set on the Mongo container
    "env_vars": {}
}
```

These arguments can either be provided manually:

```bash
kurtosis run github.com/kurtosis-tech/mongodb-package '{"image":"mongo:latest"}'
```

or by loading via a file, for instance using the [args.json](args.json) file in this repo:

```bash
kurtosis run github.com/kurtosis-tech/mongodb-package --enclave mongo "$(cat args.json)"
```

</details>

Use this package in your package
--------------------------------
Kurtosis packages can be composed inside other Kurtosis packages. To use this package in your package:

First, import this package by adding the following to the top of your Starlark file:

```python
this_package = import_module("github.com/kurtosis-tech/mongodb-package/main.star")
```

Then, call this package's `run` function somewhere in your Starlark script:

```python
this_package_output = this_package.run(plan, args)
```

Develop on this package
-----------------------
1. [Install Kurtosis][install-kurtosis]
1. Clone this repo
1. For your dev loop, run `kurtosis clean -a && kurtosis run .` inside the repo directory


<!-------------------------------- LINKS ------------------------------->
[install-kurtosis]: https://docs.kurtosis.com/install
[enclaves-reference]: https://docs.kurtosis.com/concepts-reference/enclaves
