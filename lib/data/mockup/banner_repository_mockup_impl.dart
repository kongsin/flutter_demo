import 'dart:convert';

import 'package:todolist/data/models/banner_model.dart';
import 'package:todolist/domain/repositories/banner_repository.dart';

class BannerRepositoryMockupImpl extends BannerRepository {
  BannerRepositoryMockupImpl();

  // Mock JSON string
  String _mockJson = '''
[
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "Super Sale",
    "scheme": "https://example.com/sale"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "New Arrivals",
    "scheme": "https://example.com/new-arrivals"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "Exclusive Deals",
    "scheme": "https://example.com/deals"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "Limited Time Offer",
    "scheme": "https://example.com/limited-offer"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "Best Sellers",
    "scheme": "https://example.com/best-sellers"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "Flash Sale",
    "scheme": "https://example.com/flash-sale"
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
    "title": "Mega Discount",
    "scheme": "https://example.com/discount"
  }
]
''';

  @override
  Future<List<BannerModel>> fetchBanners() async {
    List<dynamic> mockData = await json.decode(_mockJson);
    List<BannerModel> result =  mockData.map((data) => BannerModel.fromJson(data)).toList();
    return Future.value(result);
  }
}
