import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mygpt/services/secret_Api.dart';

class ApiServices {
  Future<String> isArtPrompt(String prompt) async {
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $myapiKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              'role': 'user',
              'content':
                  'Does this message want to generate an AI picture, image, art or anything similar? $prompt . Simply answer with a yes or no.',
            }
          ],
        }),
      );

      if (res.statusCode == 200) {
        if (kDebugMode) {
          print(res.body);
        }
      }
    } catch (e) {
      return e.toString();
    }
    return 'An internal error occurred';
  }

  Future<String> chatGPTAPI() async {
    return "chatGpt";
  }

  Future<String> dalleAPI() async {
    return "dalle";
  }
}
