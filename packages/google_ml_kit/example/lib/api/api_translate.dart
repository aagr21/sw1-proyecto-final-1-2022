import 'package:dio/dio.dart';

class APITranslate {
  static const urlBase =
      'https://google-translate1.p.rapidapi.com/language/translate/v2';
  static const String target = 'es';
  static const String source = 'en';
  static const String apiKey =
      '0dc9374ea3msh8acb8c1ebdc0d30p11f7ffjsn24ed578b8475';
  static const String apiHost = 'google-translate1.p.rapidapi.com';
  static final Dio dio = Dio();

  static Future<String?> translate(String q) async {
    final Map<String, dynamic> queryParams = {
      'q': q,
      'target': target,
      'source': source,
    };

    final response = await Dio().post(
      urlBase,
      options: Options(
        contentType: 'application/x-www-form-urlencoded',
        headers: {
          'Accept-Encoding': 'application/gzip',
          'X-RapidAPI-Key': apiKey,
          'X-RapidAPI-Host': apiHost,
        },
        validateStatus: (status) => true,
      ),
      data: queryParams,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      // String jsonString = response.data;
      final String? text = response.data['data']?['translations']?[0]?['translatedText'];
      return text;
    }
    return null;
  }
}
