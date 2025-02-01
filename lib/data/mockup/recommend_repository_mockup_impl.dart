
import 'dart:convert';
import 'package:todolist/domain/repositories/recommend_repository.dart';
import '../models/recommend_model.dart';

class RecommendRepositoriesMockupImpl extends RecommendRepository {

  var jsonString = '''
  [
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "Pizza Hut",
    "scheme": "https://example.com/merchants/pizza_hut"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "McDonald's",
    "scheme": "https://example.com/merchants/mcdonalds"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "KFC",
    "scheme": "https://example.com/merchants/kfc"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "Burger King",
    "scheme": "https://example.com/merchants/burger_king"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "Subway",
    "scheme": "https://example.com/merchants/subway"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "Domino's Pizza",
    "scheme": "https://example.com/merchants/dominos"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "Taco Bell",
    "scheme": "https://example.com/merchants/taco_bell"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "Starbucks",
    "scheme": "https://example.com/merchants/starbucks"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "Dunkin' Donuts",
    "scheme": "https://example.com/merchants/dunkin"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "Chipotle",
    "scheme": "https://example.com/merchants/chipotle"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "Wendy's",
    "scheme": "https://example.com/merchants/wendys"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "Panda Express",
    "scheme": "https://example.com/merchants/panda_express"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "Chick-fil-A",
    "scheme": "https://example.com/merchants/chickfila"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "Five Guys",
    "scheme": "https://example.com/merchants/five_guys"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "Shake Shack",
    "scheme": "https://example.com/merchants/shake_shack"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "Popeyes",
    "scheme": "https://example.com/merchants/popeyes"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "Arby's",
    "scheme": "https://example.com/merchants/arbys"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "Jollibee",
    "scheme": "https://example.com/merchants/jollibee"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "Krispy Kreme",
    "scheme": "https://example.com/merchants/krispy_kreme"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
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