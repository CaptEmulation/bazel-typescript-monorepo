load("@build_bazel_rules_nodejs//:defs.bzl", "npm_package")
load("//:version.bzl", "PACKAGE_VERSION")

def generate_npm_package(name, deps, srcs = [], package_layers = []):
    native.genrule(
        name = name + "_gen_package_json",
        srcs = package_layers,
        tools = ["//tools/json-merge:bin"],
        outs = ["package.json"],
        cmd = "$(location //tools/json-merge:bin) --output-path $(OUTS) --layer-paths $(SRCS) --substitutions '{{ \"$$PACKAGE_VERSION\": \"{PACKAGE_VERSION}\" }}'".format(PACKAGE_VERSION = PACKAGE_VERSION),
    )

    npm_package(
        name = name,
        srcs = srcs,
        deps = deps + [name + "_gen_package_json"],
    )

    native.genrule(
        name = name + "_tar",
        srcs = [":" + name],
        outs = [name + ".tgz"],
        cmd = "tar -cvzf $(location {name}.tgz) -C $(location :{name})/.. --dereference {name}"
            .format(name = name),
    )
