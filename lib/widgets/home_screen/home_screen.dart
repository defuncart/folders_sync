import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:folders_sync/services/files_service.dart';

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
              label: 'From',
            ),
            FolderSelector(
              path: _toPath,
              onPathSelected: (path) => setState(() => _toPath = path),
              label: 'To',
            ),
            ElevatedButton(
              onPressed: _fromPath == null || _toPath == null ? null : () => FilesService().sync(_fromPath!, _toPath!),
              child: Text('Sync'),
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
