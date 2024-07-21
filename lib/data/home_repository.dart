import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:hype_kicks/models/shoe.dart';

const baseUrl = 'https://api.timbu.cloud';

class HomeRepository {
  const HomeRepository();

  Future<List<Shoe>> fetchShoes() async {
    final orgId = dotenv.env['ORGANIZATION_ID'];
    final appID = dotenv.env['APPID'];
    final apiKey = dotenv.env['APIKEY'];
    final url =
        '$baseUrl/products?organization_id=$orgId&Appid=$appID&Apikey=$apiKey&page=1&size=20';

    try {
      final parsedUrl = Uri.parse(url);
      final response = await http.get(parsedUrl);
      final data = json.decode(response.body);

      final shoes = (data['items'] as List).cast<Map<String, dynamic>>();
      return shoes.map(Shoe.fromMap).toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

const homeRepo = HomeRepository();
