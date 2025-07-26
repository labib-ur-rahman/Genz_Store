import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String banner;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    this.image = '',
    required this.banner,
    required this.isFeatured,
    this.parentId = '',
  });

  /// Empty Helper Function
  static CategoryModel empty() => CategoryModel(id: '', image: '', banner: '', name: '', isFeatured: false);

  /// Convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'banner': banner,
      'parentId': parentId,
      'isFeatured': isFeatured,
    };
  }

  /// Map Json oriented document snapshot from Firebase to UserModel
  factory CategoryModel.fromSnapshot (DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON Record to the Model
      return CategoryModel(
        id: document.id,
        name: data['name'] ?? '',
        image: data['image'] ?? '',
        banner: data['banner'] ?? '',
        parentId: data['parentId'] ?? '',
        isFeatured: data['isFeatured'] ?? false,
      );
    } else {
      return CategoryModel.empty();
    }
  }
}