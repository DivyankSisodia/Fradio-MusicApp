import 'package:flutter_dotenv/flutter_dotenv.dart';

class ScrapperApi {
  static String apiKey = dotenv.env['scrapper_api_1'] ?? '';
  static String hostUrl = dotenv.env['url_host_scrapper'] ?? '';
}
