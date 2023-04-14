import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mygpt/services/secret_Api.dart';

class ApiServices {
  List<Map<String, String>> messages = [];
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
        String content =
            jsonDecode(res.body)['choices'][0]["message"]["content"];
        content = content.trim();
        if (kDebugMode) {
          print(res.body);
        }
        switch (content) {
          case "Yes":
          case "yes":
          case "Yes.":
          case "yes.":
            final res = await dalleAPI(prompt);
            return res;

          default:
            final res = await chatGPTAPI(prompt);
            return res;
        }
      }
    } catch (e) {
      return e.toString();
    }
    return 'An internal error occurred';
  }

  Future<String> chatGPTAPI(String prompt) async {
    messages.add({'role': 'user', 'content': prompt});
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $myapiKey',
        },
        body: jsonEncode({"model": "gpt-3.5-turbo", "messages": messages}),
      );

      if (res.statusCode == 200) {
        String content =
            jsonDecode(res.body)['choices'][0]["message"]["content"];
        content = content.trim();
        if (kDebugMode) {
          print(res.body);
        }
        messages.add({'role': 'assistant', 'content': content});
        return content;
      }
    } catch (e) {
      return e.toString();
    }
    return 'An internal error occurred';
  }

  Future<String> dalleAPI(String prompt) async {
    messages.add({'role': 'user', 'content': prompt});

    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/images/generations'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $myapiKey',
        },
        body: jsonEncode({"prompt": prompt, "n": 1}),
      );

      if (res.statusCode == 200) {
        String imageUrl = jsonDecode(res.body)['data'][0]["url"];
        imageUrl = imageUrl.trim();
        if (kDebugMode) {
          print(res.body);
        }
        messages.add({'role': 'assistant', 'content': imageUrl});
        return imageUrl;
      }
    } catch (e) {
      return e.toString();
    }
    return 'An internal error occurred';
  }
}
