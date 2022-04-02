# folders_sync

A macOS menu bar application which syncs the contents of one folder to another.

## Getting Started

To build the app locally, the following tools are required:

- Flutter stable >= 2.10
- Dart >= 2.16
- macOS:
    - Xcode >= 13.0
    - CocoaPods >= 1.11.0
- Rust

then use `cargo run` (or `cargo run --target=x86_64-apple-darwin` on Silicon Macs) to run the app.

## Why NativeShell?

Menu bar applications can be natively setup by defining `LSUIElement` to true in `Info.plist`, adding a `NSStatusItem` in `MainFlutterWindow.swift` and creating a native context menu in Interface Builder. However, from what I've tried, there is no way to open a flutter window from a native context menu.

NativeShell simplifies this process while bring other benefits such as native drag & drop.

## Code Generation

### Localizations

To add new localizations, update `assets_dev/loca/loca.csv` and run

```sh
sh bin/loca_generate.sh
```
