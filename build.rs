use nativeshell_build::{AppBundleOptions, BuildResult, Flutter, FlutterOptions, MacOSBundle};
use velcro::hash_map;

fn build_flutter() -> BuildResult<()> {
    Flutter::build(FlutterOptions {
        ..Default::default()
    })?;

    if cfg!(target_os = "macos") {
        let options = AppBundleOptions {
            bundle_name: "folders_sync.app".into(),
            bundle_identifier: "com.defuncart.folderssync".into(),
            bundle_display_name: "folders_sync".into(),
            icon_file: "icons/AppIcon.icns".into(),
            info_plist_additional_args: hash_map! {
                "PRODUCT_COPYRIGHT".into() : "Copyright © 2022 defuncart. All rights reserved".into(),
            },
            ..Default::default()
        };
        let resources = MacOSBundle::build(options)?;
        resources.mkdir("icons")?;
        resources.link("resources/mac_icon.icns", "icons/AppIcon.icns")?;
    }

    Ok(())
}

fn main() {
    if let Err(error) = build_flutter() {
        println!("\n** Build failed with error **\n\n{}", error);
        panic!();
    }
}
