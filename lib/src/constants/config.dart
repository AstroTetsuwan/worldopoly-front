import 'package:flutter_dotenv/flutter_dotenv.dart';

Map<String, dynamic> getConfig () {
  return {
    "ENV_DEV": const String.fromEnvironment("FLAVOR") == "dev",
    "API_URL": const String.fromEnvironment("FLAVOR") == "dev" 
      ? dotenv.env["API_URL_LOCAL"] 
      : dotenv.env["API_URL_REMOTE"] ,
  };
}