package(default_visibility = ["//visibility:public"])

load("@npm_bazel_typescript//:index.bzl", "ts_library")

ts_library(
    name = "common",
    srcs = glob(["**/*.ts"]),
    module_name = "@app/common",
    deps = [
        "@npm//sillyname",
    ],
)

load("//tools/npm:package.bzl", "generate_npm_package")

generate_npm_package(
    name = "package",
    package_layers = [
        "//:common.package.json",
        "common.package.json",
    ],
    deps = [":common"],
)
