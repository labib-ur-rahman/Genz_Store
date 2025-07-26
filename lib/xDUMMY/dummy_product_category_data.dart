import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addDummyProductCategory() async {
  final firestore = FirebaseFirestore.instance;
  final productsCollection = firestore.collection('Products');
  final categoryCollection = firestore.collection('ProductCategory');

  // Map of subcategories to their parent categories
  final subcategoryParentMap = {
    '8': '1',   // Sport Shoes → Sports
    '9': '1',   // Track suits → Sports
    '10': '1',  // Sports Equipments → Sports
    '11': '5',  // Bedroom furniture → Furniture
    '12': '5',  // Kitchen furniture → Furniture
    '13': '5',  // Office furniture → Furniture
    '15': '2',  // Mobile → Electronics
    '16': '3',  // Shirts → Clothes
    '17': '2',  // Laptop → Electronics
  };

  // Get all products
  final productsSnapshot = await productsCollection.get();

  // Process each product
  for (final productDoc in productsSnapshot.docs) {
    final productId = productDoc.id;
    final categoryId = productDoc['CategoryId'] as String;

    // Categories to create entries for
    final categoriesToProcess = <String>{categoryId};

    // Add parent category if this is a subcategory
    if (subcategoryParentMap.containsKey(categoryId)) {
      categoriesToProcess.add(subcategoryParentMap[categoryId]!);
    }

    // Create entries for each relevant category
    for (final category in categoriesToProcess) {
      final docId = 'S${productId}C${category}L';

      await categoryCollection.doc(docId).set({
        'categoryId': category,
        'productId': productId,
      });
    }
  }

  print('ProductCategory collection created successfully!');
}