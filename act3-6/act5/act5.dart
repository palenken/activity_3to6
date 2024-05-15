import 'dart:io';

void main() {
  print('Enter the file name:');
  String fileName = stdin.readLineSync() ?? '';

  try {
    File file = File(fileName);

    if (!file.existsSync()) {
      print('File not found.');
      return;
    }

    // Read the contents of the file
    List<String> lines = file.readAsLinesSync();

    print('File contents:');
    for (String line in lines) {
      print(line);
    }
  } catch (e) {
    print('Error: $e');
  }
}
