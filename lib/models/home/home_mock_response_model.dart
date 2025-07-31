import 'package:test_m_bagasi/utils/utils.dart';

class HomeMockResponseModel {
  final List<Banner> banner;
  final List<BrandAsliIndonesia> brandAsliIndonesia;
  final List<LagiViral> lagiViral;

  HomeMockResponseModel({
    required this.banner,
    required this.brandAsliIndonesia,
    required this.lagiViral,
  });

  factory HomeMockResponseModel.fromJson(Map<String, dynamic> json) {
    return HomeMockResponseModel(
      banner: json["banner"] == null
          ? []
          : List<Banner>.from(json["banner"]!.map((x) => Banner.fromJson(x))),
      brandAsliIndonesia: json["brand_asli_indonesia"] == null
          ? []
          : List<BrandAsliIndonesia>.from(
              json["brand_asli_indonesia"]!.map(
                (x) => BrandAsliIndonesia.fromJson(x),
              ),
            ),
      lagiViral: json["lagi_viral"] == null
          ? []
          : List<LagiViral>.from(
              json["lagi_viral"]!.map((x) => LagiViral.fromJson(x)),
            ),
    );
  }
}

class Banner {
  final String id;
  final String title;
  final String url;
  final DateTime? createdAt;

  Banner({
    required this.id,
    required this.title,
    required this.url,
    required this.createdAt,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      id: json["id"] ?? "",
      title: json["title"] ?? "",
      url: json["url"] ?? "",
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
    );
  }
}

class BrandAsliIndonesia {
  final String containerName;
  final String containerBackground;
  final String brandId;
  final String name;
  final String desc;
  final String category;
  final String imageUrl;

  BrandAsliIndonesia({
    required this.containerName,
    required this.containerBackground,
    required this.brandId,
    required this.name,
    required this.desc,
    required this.category,
    required this.imageUrl,
  });

  factory BrandAsliIndonesia.fromJson(Map<String, dynamic> json) {
    return BrandAsliIndonesia(
      containerName: json["container_name"] ?? "",
      containerBackground: json["container_background"] ?? "",
      brandId: json["brand_id"] ?? "",
      name: json["name"] ?? "",
      desc: json["desc"] ?? "",
      category: json["category"] ?? "",
      imageUrl: json["image_url"] ?? "",
    );
  }
}

class LagiViral {
  final String containerName;
  final String containerBackground;
  final String productId;
  final String name;
  final String desc;
  final String type;
  final String category;
  final String sellingPrice;
  final String brandName;
  final double? weight;
  final String imageUrl;

  LagiViral({
    required this.containerName,
    required this.containerBackground,
    required this.productId,
    required this.name,
    required this.desc,
    required this.type,
    required this.category,
    required this.sellingPrice,
    required this.brandName,
    required this.weight,
    required this.imageUrl,
  });

  factory LagiViral.fromJson(Map<String, dynamic> json) {
    return LagiViral(
      containerName: json["container_name"] ?? "",
      containerBackground: json["container_background"] ?? "",
      productId: json["product_id"] ?? "",
      name: json["name"] ?? "",
      desc: json["desc"] ?? "",
      type: json["type"] ?? "",
      category: json["category"] ?? "",
      sellingPrice: json["selling_price"] ?? "",
      brandName: json["brand_name"] ?? "",
      weight: ModelParser.doubleFromJson(json["weight"] ?? ""),
      imageUrl: json["image_url"] ?? "",
    );
  }
}
