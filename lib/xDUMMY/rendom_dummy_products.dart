import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

Future<void> addRandomDummyProducts() async {
  final firestore = FirebaseFirestore.instance;
  final productsCollection = firestore.collection('Products');
  final random = Random();

  // List of all categories and subcategories
  final categories = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '14',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '15',
    '16',
    '17',
  ];

  // Brands data with explicit type casting
  final List<Map<String, dynamic>> brands = [
    {
      'Id': 'adidas',
      'Name': 'Adidas',
      'Image': 'https://i.ibb.co/99W6Qs24/sl-adidas-100.png',
      'ProductsCount': 30,
      'IsFeatured': true,
    },
    {
      'Id': 'nike',
      'Name': 'Nike',
      //'Image': 'https://firebasestorage.googleapis.com/v0/b/softylasa-genz-store.firebasestorage.app/o/Products%2FBrands%2Fsl-nike-100.png?alt=media&token=ffe972b9-0922-47c4-b8dd-2b9a7955edc8',
      'Image': 'https://i.ibb.co/zh8QBj8j/sl-nike-100.png',
      'ProductsCount': 110,
      'IsFeatured': true,
    },
    {
      'Id': 'puma',
      'Name': 'Puma',
      'Image':
          'https://firebasestorage.googleapis.com/v0/b/softylasa-genz-store.firebasestorage.app/o/Products%2FBrands%2Fsl-puma-100.png?alt=media&token=d95e7a13-de9a-4cd9-ae85-a877aad9df7e',
      'ProductsCount': 43,
      'IsFeatured': false,
    },
    {
      'Id': 'apple',
      'Name': 'Apple',
      'Image': 'https://i.ibb.co/3mzYQs22/sl-apple-100.png',
      'ProductsCount': 15,
      'IsFeatured': true,
    },
    {
      'Id': 'acer',
      'Name': 'Acer',
      'Image':
          'https://firebasestorage.googleapis.com/v0/b/softylasa-genz-store.firebasestorage.app/o/Products%2FBrands%2Fsl-acer-100.png?alt=media&token=c1b452ad-6f81-411c-b575-06059ac41dad',
      'ProductsCount': 51,
      'IsFeatured': false,
    },
    {
      'Id': 'ikea',
      'Name': 'IKEA',
      'Image': 'https://firebasestorage.googleapis.com/v0/b/softylasa-genz-store.firebasestorage.app/o/Products%2FBrands%2Fsl-ikea-100.png?alt=media&token=a8f6b5a7-6c8d-42b7-bb8d-583ee0c477e1',
      'ProductsCount': 62,
      'IsFeatured': false,
    },
    {
      'Id': 'jordan',
      'Name': 'Jordan',
      'Image': 'https://i.ibb.co/pBRxKcZy/sl-air-jordan-100.png',
      'ProductsCount': 65,
      'IsFeatured': true,
    },
    {
      'Id': 'kenwood',
      'Name': 'Kenwood',
      'Image': 'https://firebasestorage.googleapis.com/v0/b/softylasa-genz-store.firebasestorage.app/o/Products%2FBrands%2Fsl-kenwood-100.png?alt=media&token=c5fd81cf-5284-43a9-bc44-90162276eb73',
      'ProductsCount': 91,
      'IsFeatured': false,
    },
    {
      'Id': 'samsung',
      'Name': 'Samsung',
      'Image': 'https://firebasestorage.googleapis.com/v0/b/softylasa-genz-store.firebasestorage.app/o/Products%2FBrands%2Fsl-samsung-100.png?alt=media&token=62788271-52e2-432c-8746-9fd0f5075de2',
      'ProductsCount': 89,
      'IsFeatured': false,
    },
  ];

  // Attribute options
  final colors = ['Black', 'White', 'Red', 'Blue', 'Green'];
  final sizes = ['S', 'M', 'L', 'XL'];
  const shoeSizes = ['EU 40', 'EU 41', 'EU 42', 'EU 43'];

  for (int i = 3; i <= 60; i++) {
    final productId = i.toString().padLeft(3, '0');
    final brand = brands[random.nextInt(brands.length)];
    final category = categories[random.nextInt(categories.length)];
    final isVariable = random.nextDouble() > 0.4; // 60% variable products
    final isFeatured = random.nextDouble() > 0.7; // 30% featured
    //final price = 10 + random.nextDouble() * 190; // $10-$200
    final price = double.parse((10 + random.nextDouble() * 190).toStringAsFixed(2));
    //final salePrice = price * (0.7 + random.nextDouble() * 0.2); // 70-90% of price
    final salePrice = double.parse((price * (0.7 + random.nextDouble() * 0.2)).toStringAsFixed(2));
    final stock = random.nextInt(100);

    // Generate 3 images
    final images = List.generate(
      3,
      (index) => 'https://picsum.photos/seed/${productId}_$index/600/600',
    );

    // Generate product attributes
    List<Map<String, dynamic>> attributes = [];
    if (isVariable) {
      // Add color attribute to 80% of variable products
      if (random.nextDouble() > 0.2) {
        final colorOptions = colors.sublist(0, random.nextInt(3) + 2);
        attributes.add({'Name': 'Color', 'Values': colorOptions});
      }

      // Add size attribute
      final sizeOptions = (category == '8' || category == '6')
          ? shoeSizes.sublist(0, random.nextInt(2) + 2)
          : sizes.sublist(0, random.nextInt(2) + 2);
      attributes.add({'Name': 'Size', 'Values': sizeOptions});
    }

    // Generate variations
    List<Map<String, dynamic>> variations = [];
    if (isVariable && attributes.isNotEmpty) {
      final variationCount = random.nextInt(3) + 2; // 2-4 variations
      for (int v = 0; v < variationCount; v++) {
        // final variationPrice = price * (0.9 + random.nextDouble() * 0.2);
        final variationPrice = double.parse((price * (0.9 + random.nextDouble() * 0.2)).toStringAsFixed(2));
        final variationValues = {
          for (var attr in attributes)
            attr['Name']: attr['Values'][v % attr['Values'].length],
        };

        variations.add({
          'AttributeValues': variationValues,
          'Description': '${brand['Name']} variation ${v + 1}',
          'Id': 'var${v + 1}',
          'Image': images[v % images.length],
          'Price': variationPrice,
          'SKU': '${brand['Id']}-$productId-V${v + 1}',
        });
      }
    }

    // Fixed: Explicitly cast brand name to String
    final brandName = brand['Name'] as String;
    final title = _generateTitle(category, brandName);

    await productsCollection.doc(productId).set({
      'Brand': brand,
      'CategoryId': category,
      'Description': 'Premium $brandName product for daily use',
      'Images': images,
      'IsFeatured': isFeatured,
      'Price': price,
      'ProductAttributes': attributes,
      'ProductType': isVariable ? 'ProductType.variable' : 'ProductType.single',
      'ProductVariations': variations,
      'SKU': '${brand['Id']}-$productId',
      'SalePrice': salePrice,
      'Stock': stock,
      'Thumbnail': images.first,
      'Title': title,
    });
  }
  print('58 dummy products added successfully!');
}

String _generateTitle(String categoryId, String brandName) {
  final titles = {
    '1': ['Pro Sports Gear', 'Training Equipment', 'Performance Kit'],
    '2': ['Smart Device', 'Pro Series', 'Digital Master'],
    '3': ['Fashion Essential', 'Designer Collection', 'Premium Wear'],
    '4': ['Pet Paradise', 'Animal Care', 'Companion Series'],
    '5': ['Home Essential', 'Design Collection', 'Comfort Series'],
    '6': ['Urban Walker', 'Comfort Stride', 'Performance Runner'],
    '7': ['Beauty Essential', 'Luxury Care', 'Skin Therapy'],
    '8': ['Turbo Runner', 'Court Master', 'Field Dominator'],
    '9': ['Training Suit', 'Athleisure Set', 'Performance Wear'],
    '10': ['Pro Gear', 'Training Kit', 'Sports Master'],
    '11': ['Dream Sleeper', 'Comfort Bed', 'Luxury Rest'],
    '12': ['Chef Series', 'Kitchen Pro', 'Culinary Master'],
    '13': ['Executive Series', 'Office Pro', 'Workstation Master'],
    '14': ['Elegance Collection', 'Luxury Piece', 'Premium Jewel'],
    '15': ['Smartphone Pro', 'Mobile Master', 'Connect Series'],
    '16': ['Designer Shirt', 'Premium Top', 'Fashion Essential'],
    '17': ['Powerbook Pro', 'Ultrabook', 'Performance Laptop'],
  };

  final random = Random();
  final options = titles[categoryId] ?? ['Premium Product', 'Deluxe Edition'];
  return '$brandName ${options[random.nextInt(options.length)]}';
}
