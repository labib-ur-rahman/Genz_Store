import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:genz_store/features/shop/models/product_model.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

/// Repository for managing product-related data and operations.
class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  /// Firestore instance for database interactions.
  final _db = FirebaseFirestore.instance;

  /// Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).limit(4).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw SLFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SLFormatException();
    } on PlatformException catch (e) {
      throw SLPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching Banners.';
    }
  }

  /// Get all the featured products
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw SLFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SLFormatException();
    } on PlatformException catch (e) {
      throw SLPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching Banners.';
    }
  }

  /// Get  products based on the query
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;
    } on FirebaseException catch (e) {
      throw SLFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SLFormatException();
    } on PlatformException catch (e) {
      throw SLPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching Banners.';
    }
  }

  /// Get all favourite products
  Future<List<ProductModel>> getFavouriteProducts(List<String> productIds) async {
    try {
      final snapshot = await _db.collection('Products').where (FieldPath.documentId, whereIn: productIds).get();
      return snapshot.docs.map((querySnapshot) => ProductModel.fromSnapshot (querySnapshot)).toList();
    } on FirebaseException catch (e) {
      throw SLFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SLFormatException();
    } on PlatformException catch (e) {
      throw SLPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching Banners.';
    }
  }

  Future<List<ProductModel>> getProductsForBrand({ required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).get()
          : await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).limit(limit).get();
      final products = querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;
    } on FirebaseException catch (e) {
      throw SLFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SLPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> getProductsForCategory({ required String categoryId, int limit = -1}) async {
    try {
      // Query to get all documents where productId matches the provided categoryId & Fetch limited or unlimited based on limit
      QuerySnapshot productCategoryQuery = limit == -1
          ? await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).get()
          : await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).limit(limit).get();

      // Extract productIds from the documents
      List<String> productIds = productCategoryQuery.docs.map((doc) => doc['productId'] as String).toList();

      // Query to get all documents where the brandId is in the list of brandIds, FieldPath.documentId to query documents in Collection
      final productsQuery = await _db.collection('Products').where (FieldPath.documentId, whereIn: productIds).get();

      // Extract brand names or other relevant data from the documents
      List<ProductModel> products = productsQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();

      return products;
    } on FirebaseException catch (e) {
      throw SLFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SLPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}