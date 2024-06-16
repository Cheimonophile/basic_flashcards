import 'package:file_picker/file_picker.dart';

/// select a new location to store a collection
Future<String?> newCollection() async {
  return await FilePicker.platform.saveFile(
    dialogTitle: 'Please select a file to store the new collection in.',
    fileName: 'test.txt',
    type: FileType.custom,
    allowedExtensions: ['txt'],
    lockParentWindow: true,
  );
}

/// select a collection to load
Future<String?> openCollection() async {
  final result = await FilePicker.platform.pickFiles(
    dialogTitle: 'Please select a file to load the collection from.',
    type: FileType.custom,
    allowedExtensions: ['txt'],
    lockParentWindow: true,
  );
  return result?.files.first.path;
}
