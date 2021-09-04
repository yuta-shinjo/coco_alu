import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My図鑑に登録'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.check),
            tooltip: '登録',
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '名称：セキセイインコ',
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    foregroundImage: _displaySelectionImageOrDefaultImage(),
                    backgroundImage: AssetImage('assets/images/picture.jpg'),
                    radius: 100,
                  ),
                  RawMaterialButton(
                    onPressed: () => _getImageFromGallery(),
                    shape: const CircleBorder(),
                    elevation: 0,
                    child: const SizedBox(
                      width: 200,
                      height: 200,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 80,
              indent: 10,
              endIndent: 10,
              color: Colors.white,
            ),
            Column(
              children: [
                _raceInputPart(),
                SizedBox(height: 15),
                _locationInputPart(),
                SizedBox(height: 15),
                _sizeInputPart(),
                SizedBox(height: 20),
                _featureInputPart(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _raceInputPart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: SingleChildScrollView(
        child: TextField(
          decoration: InputDecoration(
            hintText: '種類：鳥類',
          ),
          keyboardType: TextInputType.text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _locationInputPart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: SingleChildScrollView(
        child: TextField(
          decoration: InputDecoration(
            hintText: '発見場所：家の近くの公園',
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _sizeInputPart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: SingleChildScrollView(
        child: TextField(
          decoration: InputDecoration(
            hintText: 'サイズ：10センチ',
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _featureInputPart() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: TextField(
          keyboardType: TextInputType.multiline,
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'メモ：家族になりたそうにこちらを見ていて可愛かった',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }

  ImageProvider? _displaySelectionImageOrDefaultImage() {
    if (_image == null) {
      return null;
    } else {
      return Image.file(_image!, fit: BoxFit.cover).image;
    }
  }

  Future _getImageFromGallery() async {
    final _pickedFile = await _picker.getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (_pickedFile != null) {
        _image = File(_pickedFile.path);
      }
    });
  }
}
