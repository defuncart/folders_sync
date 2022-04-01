import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:folders_sync/generated/l10n.dart';
import 'package:folders_sync/widgets/home_screen/home_screen.dart';
import 'package:nativeshell/nativeshell.dart';

const size = Size(400, 200);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  @override
  WindowSizingMode get windowSizingMode => WindowSizingMode.atLeastIntrinsicSize;

  @override
  Future<void> initializeWindow(Size contentSize) async {
    await window.setGeometry(Geometry(
      contentSize: size,
    ));
    await window.setStyle(WindowStyle(
      frame: WindowFrame.noTitle,
      canResize: false,
    ));
    await window.show();
  }

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
