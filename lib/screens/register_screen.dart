import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              ),
            ),
            SizedBox(height: 30),
            Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage('assets/images/picture.jpg'),
                  radius: 100,
                ),
                RawMaterialButton(
                  onPressed: () {},
                  shape: const CircleBorder(),
                  elevation: 0,
                  child: const SizedBox(
                    width: 200,
                    height: 200,
                  ),
                ),
              ],
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
                SizedBox(height: 20),
                _locationInputPart(),
                SizedBox(height: 20),
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
      child: TextField(
        decoration: InputDecoration(
          hintText: 'ハト',
        ),
        keyboardType: TextInputType.text,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _locationInputPart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        decoration: InputDecoration(
          hintText: '家の近くの公園',
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _sizeInputPart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        decoration: InputDecoration(
          hintText: '15センチ',
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _featureInputPart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: 6,
        decoration: InputDecoration(
          hintText: '家族になりたそうにこちらを見ていて可愛かった',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }

}
