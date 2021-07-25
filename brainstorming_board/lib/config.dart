import 'dart:io' show Platform;

String apiUrl =
    Platform.isAndroid ? 'http://10.0.2.2:3000' : 'http://127.0.0.1:3000';
