import 'package:flutter_config/flutter_config.dart';

// Facebook
String facebookAppName =
    FlutterConfig.get('FACEBOOK_APP_NAME') ?? 'FlutterFire Auth';
String facebookAppId = FlutterConfig.get('FACEBOOK_APP_ID') ?? '';
String facebookClientToken = FlutterConfig.get('FACEBOOK_CLIENT_TOKEN') ?? '';

// Twitter
String twitterAppName =
    FlutterConfig.get('TWITTER_APP_NAME') ?? 'flutterfire-auth';
String twitterApiKey = FlutterConfig.get('TWITTER_API_KEY') ?? '';
String twitterApiSecretKey = FlutterConfig.get('TWITTER_API_SECRET_KEY') ?? '';
