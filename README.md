# folders_sync

A macOS application which syncs the contents of one folder to another.

## Getting Started

To build the app locally, the following tools are required:

- Flutter stable >= 2.10
- Dart >= 2.16
- macOS:
    - Xcode >= 13.0
    - CocoaPods >= 1.11.0

## Code Generation

### Localizations

To add new localizations, update `assets_dev/loca/loca.csv` and run

```sh
sh bin/loca_generate.sh
```
