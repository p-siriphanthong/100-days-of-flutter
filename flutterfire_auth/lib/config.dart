import 'package:flutter_config/flutter_config.dart';

String twitterApiKey = FlutterConfig.get('TWITTER_API_KEY') ?? '';
String twitterApiSecretKey = FlutterConfig.get('TWITTER_API_SECRET_KEY') ?? '';
