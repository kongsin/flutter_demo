
import 'dart:convert';
import 'package:todolist/domain/repositories/recommend_repository.dart';
import '../models/recommend_model.dart';

class RecommendRepositoriesMockupImpl extends RecommendRepository {

  var jsonString = '''
  [
  {
    "image": "https://example.com/images/pizza_hut.jpg",
    "title": "Pizza Hut",
    "scheme": "https://example.com/merchants/pizza_hut"
  },
  {
    "image": "https://example.com/images/mcdonalds.jpg",
    "title": "McDonald's",
    "scheme": "https://example.com/merchants/mcdonalds"
  },
  {
    "image": "https://example.com/images/kfc.jpg",
    "title": "KFC",
    "scheme": "https://example.com/merchants/kfc"
  },
  {
    "image": "https://example.com/images/burger_king.jpg",
    "title": "Burger King",
    "scheme": "https://example.com/merchants/burger_king"
  },
  {
    "image": "https://example.com/images/subway.jpg",
    "title": "Subway",
    "scheme": "https://example.com/merchants/subway"
  },
  {
    "image": "https://example.com/images/dominos.jpg",
    "title": "Domino's Pizza",
    "scheme": "https://example.com/merchants/dominos"
  },
  {
    "image": "https://example.com/images/taco_bell.jpg",
    "title": "Taco Bell",
    "scheme": "https://example.com/merchants/taco_bell"
  },
  {
    "image": "https://example.com/images/starbucks.jpg",
    "title": "Starbucks",
    "scheme": "https://example.com/merchants/starbucks"
  },
  {
    "image": "https://example.com/images/dunkin.jpg",
    "title": "Dunkin' Donuts",
    "scheme": "https://example.com/merchants/dunkin"
  },
  {
    "image": "https://example.com/images/chipotle.jpg",
    "title": "Chipotle",
    "scheme": "https://example.com/merchants/chipotle"
  },
  {
    "image": "https://example.com/images/wendys.jpg",
    "title": "Wendy's",
    "scheme": "https://example.com/merchants/wendys"
  },
  {
    "image": "https://example.com/images/panda_express.jpg",
    "title": "Panda Express",
    "scheme": "https://example.com/merchants/panda_express"
  },
  {
    "image": "https://example.com/images/chickfila.jpg",
    "title": "Chick-fil-A",
    "scheme": "https://example.com/merchants/chickfila"
  },
  {
    "image": "https://example.com/images/five_guys.jpg",
    "title": "Five Guys",
    "scheme": "https://example.com/merchants/five_guys"
  },
  {
    "image": "https://example.com/images/shake_shack.jpg",
    "title": "Shake Shack",
    "scheme": "https://example.com/merchants/shake_shack"
  },
  {
    "image": "https://example.com/images/popeyes.jpg",
    "title": "Popeyes",
    "scheme": "https://example.com/merchants/popeyes"
  },
  {
    "image": "https://example.com/images/arbys.jpg",
    "title": "Arby's",
    "scheme": "https://example.com/merchants/arbys"
  },
  {
    "image": "https://example.com/images/jollibee.jpg",
    "title": "Jollibee",
    "scheme": "https://example.com/merchants/jollibee"
  },
  {
    "image": "https://example.com/images/krispy_kreme.jpg",
    "title": "Krispy Kreme",
    "scheme": "https://example.com/merchants/krispy_kreme"
  },
  {
    "image": "https://example.com/images/baskin_robbins.jpg",
    "title": "Baskin-Robbins",
    "scheme": "https://example.com/merchants/baskin_robbins"
  }
]
''';

  @override
  Future<List<RecommendModel>> fetchRecommends() async {
    List<dynamic> jsonData = await json.decode(jsonString);
    List<RecommendModel> jsonObject = jsonData.map((data) => RecommendModel.fromJson(data)).toList();
    return Future.value(jsonObject);
  }

}