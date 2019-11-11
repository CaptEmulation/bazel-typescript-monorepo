# Example / Learning Project

I created this to experiment with skaffold + bazel for being able to build and deploy a typescript monorepo

## References

Used the following repos for inspiration:

- https://github.com/dataform-co/dataform
- https://github.com/Toxicable/bazel-monorepo-example

## Usage

1. Install skaffold
1. Install bazel
1. Install `kubectl`
1. Create a k8s cluster and point `kubectl` at it
1. `skaffold dev` to deploy to cluster

Make a change to a source file and what it rebuild and re-deploy
