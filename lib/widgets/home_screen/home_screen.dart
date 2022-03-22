import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:folders_sync/generated/l10n.dart';
import 'package:folders_sync/services/files_service.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _fromPath;
  String? _toPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FolderSelector(
              path: _fromPath,
              onPathSelected: (path) => setState(() => _fromPath = path),
              label: AppLocalizations.of(context).generalFrom,
            ),
            const SizedBox(height: 8),
            FolderSelector(
              path: _toPath,
              onPathSelected: (path) => setState(() => _toPath = path),
              label: AppLocalizations.of(context).generalTo,
            ),
            ElevatedButton(
              onPressed: _fromPath == null || _toPath == null ? null : () => FilesService().sync(_fromPath!, _toPath!),
              child: Text(AppLocalizations.of(context).generalSync),
            ),
          ],
        ),
      ),
    );
  }
}

class FolderSelector extends StatelessWidget {
  const FolderSelector({
    required this.path,
    required this.onPathSelected,
    required this.label,
    Key? key,
  }) : super(key: key);

  final String? path;
  final void Function(String?) onPathSelected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (path != null) Text(path!),
        if (path != null)
          TextButton(
            onPressed: () => launch('file:${path!}'),
            child: Text(AppLocalizations.of(context).generalShowInFinder),
          ),
        ElevatedButton(
          onPressed: () async {
            final newPath = await getDirectoryPath();
            if (newPath != path) {
              onPathSelected(newPath);
            }
          },
          child: Text(label),
        )
      ],
    );
  }
}
