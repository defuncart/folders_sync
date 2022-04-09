import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folders_sync/generated/l10n.dart';
import 'package:folders_sync/state/state.dart';
import 'package:folders_sync/widgets/home_screen/home_screen.dart';
import 'package:nativeshell/nativeshell.dart';

const size = Size(400, 200);

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  var _isInitialized = false;

  @override
  void initState() {
    super.initState();

    _init();
  }

  Future<void> _init() async {
    await ref.read(syncDatabaseProvider).initialize();

    setState(() => _isInitialized = true);
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const SizedBox.shrink();
    }

    return WindowWidget(
      onCreateState: (initData) {
        WindowState? state;
        state ??= MyAppWindowState();
        return state;
      },
    );
  }
}

class MyAppWindowState extends WindowState {
  late StatusItem _statusItem;

  @override
  WindowSizingMode get windowSizingMode => WindowSizingMode.atLeastIntrinsicSize;

  @override
  Future<void> initializeWindow(Size contentSize) async {
    window.windowStateFlagsEvent.addListener((flags) {
      if (!flags.active) {
        window.deactivate(deactivateApplication: true);
        window.hide();
      }
    });

    _statusItem = await StatusItem.create(
      onLeftMouseDown: (_) async {
        final menu = [
          MenuItem(
            title: AppLocalizations.current.menuBarSyncLabel,
            action: () {},
          ),
          MenuItem.separator(),
          MenuItem(
            title: AppLocalizations.current.menuBarSettingsLabel,
            action: () async {
              await window.activate();
              await window.show();
            },
          ),
          MenuItem.separator(),
          MenuItem(
            title: AppLocalizations.current.menuBarQuitLabel,
            action: () => window.close(),
          ),
        ];
        await _statusItem.showMenu(Menu(() => menu));
      },
    );
    const assetPath = 'assets/icons/menu_bar_icon.png';
    const image = AssetImage(assetPath);
    await _statusItem.setImage(image);

    await window.setGeometry(Geometry(
      contentSize: size,
    ));
    await window.setStyle(WindowStyle(
      frame: WindowFrame.noTitle,
      canResize: false,
    ));
  }

  @override
  Future<void> windowCloseRequested() => window.hide();

  @override
  Widget build(BuildContext context) {
    return WindowLayoutProbe(
      child: GestureDetector(
        onPanStart: (_) => Window.of(context).performDrag(),
        child: const MyAppContent(),
      ),
    );
  }
}

class MyAppContent extends StatelessWidget {
  const MyAppContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.delegate.supportedLocales,
      home: SizedBox.fromSize(
        size: size,
        child: const HomeScreen(),
      ),
    );
  }
}
