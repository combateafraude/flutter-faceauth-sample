import 'package:caf_face_authenticator/caf_face_authenticator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  bool isLiveness = false;
  bool isMatch = false;
  TextEditingController personIdController = TextEditingController();

  void start() async {
    final faceAuthenticator = FaceAuthenticator('clientId', 'clientSecret',
        'cafMobileToken', personIdController.value.text);
    try {
      final result = await faceAuthenticator.initialize();
      setState(() {
        isLiveness = result.isAlive;
        isMatch = result.isMatch;
      });
    } on FaceAuthenticatorLivenessSdkException catch (e) {
      debugPrint('FaceAuthenticatorLivenessSdkException: $e');
      setState(() {
        isLiveness = false;
        isMatch = false;
      });
    } on FaceAuthenticatorApiException catch (e) {
      debugPrint('FaceAuthenticatorApiException: $e');
      setState(() {
        isLiveness = false;
        isMatch = false;
      });
    } on FaceAuthenticatorUnknownException catch (e) {
      debugPrint('FaceAuthenticatorUnknownException: $e');
      setState(() {
        isLiveness = false;
        isMatch = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Face Liveness: $isLiveness'),
            Text('Face Match: $isMatch'),
            TextField(
              controller: personIdController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'CPF',
              ),
            ),
            const Text(
                'Press the button to start face liveness and match detection'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => start(),
              child: const Text('Start'),
            ),
          ],
        ),
      ),
    );
  }
}
