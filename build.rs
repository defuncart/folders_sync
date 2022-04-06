use nativeshell_build::{AppBundleOptions, BuildResult, Flutter, FlutterOptions, MacOSBundle};

fn build_flutter() -> BuildResult<()> {
    Flutter::build(FlutterOptions {
        ..Default::default()
    })?;

    if cfg!(target_os = "macos") {
        let options = AppBundleOptions {
            info_plist_template: Some("resources/Info.plist".into()),
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
