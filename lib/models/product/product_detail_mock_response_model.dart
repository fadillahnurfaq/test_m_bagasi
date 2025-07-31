import 'package:test_m_bagasi/utils/utils.dart';

class ProductDetailMockResponseModel {
  final ProductDetail? productDetail;
  final List<ProductVariant> productVariant;
  final List<ProductAsset> productAssets;

  ProductDetailMockResponseModel({
    required this.productDetail,
    required this.productVariant,
    required this.productAssets,
  });

  factory ProductDetailMockResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailMockResponseModel(
      productDetail: json["product_detail"] == null
          ? null
          : ProductDetail.fromJson(json["product_detail"]),
      productVariant: json["product_variant"] == null
          ? []
          : List<ProductVariant>.from(
              json["product_variant"]!.map((x) => ProductVariant.fromJson(x)),
            ),
      productAssets: json["product_assets"] == null
          ? []
          : List<ProductAsset>.from(
              json["product_assets"]!.map((x) => ProductAsset.fromJson(x)),
            ),
    );
  }

  static Map<String, List<String>> groupVariants(
    List<ProductVariant> variants,
  ) {
    final Map<String, List<String>> groupedVariants = {};

    // Mengumpulkan semua varian unik ke dalam Map
    for (final productVariant in variants) {
      for (final variant in productVariant.variants) {
        if (!groupedVariants.containsKey(variant.name)) {
          groupedVariants[variant.name] = [];
        }
        // Pastikan nilai varian tidak duplikat
        if (!groupedVariants[variant.name]!.contains(variant.value)) {
          groupedVariants[variant.name]!.add(variant.value);
        }
      }
    }
    return groupedVariants;
  }
}

class ProductAsset {
  final String id;
  final String productId;
  final String type;
  final bool isMainImage;
  final String url;

  ProductAsset({
    required this.id,
    required this.productId,
    required this.type,
    required this.isMainImage,
    required this.url,
  });

  factory ProductAsset.fromJson(Map<String, dynamic> json) {
    return ProductAsset(
      id: json["id"] ?? "",
      productId: json["product_id"] ?? "",
      type: json["type"] ?? "",
      isMainImage:
          ModelParser.boolFromJson(json["is_main_image"] ?? "") ?? false,
      url: json["url"] ?? "",
    );
  }
}

class ProductDetail {
  final String id;
  final String sku;
  final String productType;
  final String brandName;
  final String name;
  final String categoryName;
  final String categoryDetailName;
  final String desc;
  final String provinceName;
  final int sold;
  final String ingredients;
  final String sellingPrice;
  final double productWeight;
  final String productCertification;
  final double discount;

  ProductDetail({
    required this.id,
    required this.sku,
    required this.productType,
    required this.brandName,
    required this.name,
    required this.categoryName,
    required this.categoryDetailName,
    required this.desc,
    required this.provinceName,
    required this.sold,
    required this.ingredients,
    required this.sellingPrice,
    required this.productWeight,
    required this.productCertification,
    required this.discount,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    return ProductDetail(
      id: json["id"] ?? "",
      sku: json["sku"] ?? "",
      productType: json["product_type"] ?? "",
      brandName: json["brand_name"] ?? "",
      name: json["name"] ?? "",
      categoryName: json["category_name"] ?? "",
      categoryDetailName: json["category_detail_name"] ?? "",
      desc: json["desc"] ?? "",
      provinceName: json["province_name"] ?? "",
      sold: ModelParser.intFromJson(json["sold"] ?? "") ?? 0,
      ingredients: json["ingredients"] ?? "",
      sellingPrice: json["selling_price"] ?? "",
      productWeight:
          ModelParser.doubleFromJson(json["product_weight"] ?? "") ?? 0.0,
      productCertification: json["product_certification"] ?? "",
      discount: ModelParser.doubleFromJson(json["discount"] ?? "") ?? 0,
    );
  }
}

class ProductVariant {
  final String id;
  final String productId;
  final double sellingPrice;
  final String url;
  final double weight;
  final String sku;
  final String variantName;
  final double discount;
  final List<Variant> variants;

  ProductVariant({
    required this.id,
    required this.productId,
    required this.sellingPrice,
    required this.url,
    required this.weight,
    required this.sku,
    required this.variantName,
    required this.discount,
    required this.variants,
  });

  factory ProductVariant.fromJson(Map<String, dynamic> json) {
    return ProductVariant(
      id: json["id"] ?? "",
      productId: json["product_id"] ?? "",
      sellingPrice:
          ModelParser.doubleFromJson(json["selling_price"] ?? "") ?? 0.0,
      url: json["url"] ?? "",
      weight: ModelParser.doubleFromJson(json["weight"] ?? "") ?? 0.0,
      sku: json["sku"] ?? "",
      variantName: json["variant_name"] ?? "",
      discount: ModelParser.doubleFromJson(json["discount"] ?? "") ?? 0.0,
      variants: json["variants"] == null
          ? []
          : List<Variant>.from(
              json["variants"]!.map((x) => Variant.fromJson(x)),
            ),
    );
  }
}

class Variant {
  Variant({required this.name, required this.value});

  final String name;
  final String value;

  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(name: json["name"] ?? "", value: json["value"] ?? "");
  }
}
