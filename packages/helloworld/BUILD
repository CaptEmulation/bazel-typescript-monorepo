package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//nodejs:image.bzl", "nodejs_image")
load("@npm_bazel_typescript//:index.bzl", "ts_library")
load("//tools/npm:package.bzl", "generate_npm_package")

ts_library(
    name = "helloworld",
    srcs = glob(["**/*.ts"]),
    module_name = "@app/helloworld",
    deps = [
        "//packages/common",
    ],
)

generate_npm_package(
    name = "package",
    package_layers = [
        "//:common.package.json",
        "helloworld.package.json",
    ],
    deps = [":helloworld"],
)

nodejs_image(
    name = "image",
    data = [":helloworld"],
    entry_point = ":src/index.ts",
)
