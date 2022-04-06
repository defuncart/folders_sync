#!/usr/bin/env bash

# Due to NativeShell dependency, `flutter` needs to be run instead of `dart`

# enable arb_utils globally on machine
# if already enabled, this will download latest version, if one is available
flutter pub global activate arb_utils

# generate from csv
flutter pub get
flutter pub run arb_generator

# sort arbs
flutter pub global run arb_utils:sort assets_dev/l10n/intl_en.arb

# generate localization delegates
flutter pub run intl_utils:generate

# format loca delegates
flutter format lib/generated
