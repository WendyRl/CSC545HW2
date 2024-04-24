import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image and Settings Storage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StoragePage(),
    );
  }
}

class StoragePage extends StatefulWidget {
  @override
  _StoragePageState createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  String _settingValue = '';
  String _feedbackMessage = '';

  void _showFeedback(String message) {
    setState(() {
      _feedbackMessage = message;
    });
  }

  Future<void> _pickAndSaveImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final directory = await getApplicationDocumentsDirectory();
      final path = '${directory.path}/saved_image.png';
      final File newImage = await File(pickedFile.path).copy(path);
      setState(() {
        _image = newImage;
        _showFeedback('Image saved successfully at $path');
      });
    }
  }

  Future<void> _loadImage() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/saved_image.png';
    final imageFile = File(path);
    if (await imageFile.exists()) {
      setState(() {
        _image = imageFile;
        _showFeedback('Load image success');
      });
    } else {
      _showFeedback('No image found to load.');
    }
  }

  Future<void> _saveSetting(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    _showFeedback('Setting saved: $key = $value');
  }

  Future<void> _loadSetting(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String value = prefs.getString(key) ?? 'Default Value';
    setState(() {
      _settingValue = value;
      _showFeedback('Loaded setting: $key = $value');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image and Settings Storage Demo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_image != null) Image.file(_image!),
            Text(_feedbackMessage),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickAndSaveImage,
              child: Text('Pick and Save Image'),
            ),
            ElevatedButton(
              onPressed: _loadImage,
              child: Text('Load Image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _saveSetting('exampleSetting', 'Hello Flutter!'),
              child: Text('Save Setting'),
            ),
            ElevatedButton(
              onPressed: () => _loadSetting('exampleSetting'),
              child: Text('Load Setting'),
            ),
            Text('Setting Value: $_settingValue'),
          ],
        ),
      ),
    );
  }
}
