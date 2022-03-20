import 'package:flutter/material.dart';
import 'package:folders_sync/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(AppLocalizations.of(context).test),
      ),
    );
  }
}
