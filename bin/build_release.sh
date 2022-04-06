#!/usr/bin/env bash

cargo clean
cargo build --target=x86_64-apple-darwin --release
cargo bundle-tool -v macos-bundle target/x86_64-apple-darwin/release/folders_sync.app/ target/
