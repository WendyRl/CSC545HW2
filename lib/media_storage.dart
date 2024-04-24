import 'dart:io';
import 'package:path_provider/path_provider.dart';

class MediaStorage {
  Future<String> saveImageLocally() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path + '/test_image.png';
    final image = File(path);

    // Simulating an image save
    await image.writeAsBytes(List.generate(100, (index) => index));

    return path;
  }
}
