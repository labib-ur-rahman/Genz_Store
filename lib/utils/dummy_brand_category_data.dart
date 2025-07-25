import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addDummyBrandCategory() async {
  final firestore = FirebaseFirestore.instance;
  final productsCollection = firestore.collection('Products');
  final brandCategoryCollection = firestore.collection('BrandCategory');

  // Get all products
  final productsSnapshot = await productsCollection.get();

  // Track unique brand-category combinations to prevent duplicates
  final Set<String> processedCombinations = {};

  // Process each product
  for (final productDoc in productsSnapshot.docs) {
    final productData = productDoc.data() as Map<String, dynamic>;
    final brandId = (productData['Brand'] as Map<String, dynamic>)['Id'] as String;
    final categoryId = productData['CategoryId'] as String;

    // Create unique key for this brand-category combination
    final combinationKey = '$brandId-$categoryId';

    // Skip if we've already processed this combination
    if (processedCombinations.contains(combinationKey)) continue;

    processedCombinations.add(combinationKey);

    // Generate document ID in the format: {brandId}{categoryId}SL
    final docId = '${brandId}${categoryId}SL';

    await brandCategoryCollection.doc(docId).set({
      'categoryId': categoryId,
      'brandId': brandId,
    });
  }

  print('BrandCategory collection created successfully!');
}