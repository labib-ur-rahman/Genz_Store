import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> singleDummyProductUpdate() async {
  final firestore = FirebaseFirestore.instance;
  final productsCollection = firestore.collection('Products');

  // Dummy Product 001 - Variable Product
  await productsCollection.doc('001').set({
    'Brand': {
      'Id': 'nike',
      'Name': 'Nike',
      'Image': 'https://i.ibb.co/zh8QBj8j/sl-nike-100.png',
      'ProductsCount': 110,
      'IsFeatured': true,
    },
    'CategoryId': '1',
    'Description': "Men's Nike Air Zoom Pegasus 33 Running Shoe delivers a smooth, snappy ride with a finely tuned outsole that features impact absorbing cuts within the crash rail, Waffle pistons and a radiused heel.",
    'Images': [
      'https://i.ibb.co/Q7T9ycsZ/sl-img1.png',
      'https://i.ibb.co/zwX28yw/sl-img2.png',
      'https://i.ibb.co/Nd92d9ck/sl-img3.png',
      'https://i.ibb.co/4G1X1Kj/sl-img4.png',
      'https://i.ibb.co/MxBxX7Nk/sl-img5.png',
    ],
    'IsFeatured': true,
    'Price': 199.99,
    'ProductAttributes': [
      {
        'Name': 'Color',
        'Values': ['Black', 'Red', 'Blue', 'Green'],
      },
      {
        'Name': 'Size',
        'Values': ['EU 40', 'EU 42', 'EU 44'],
      },
    ],
    'ProductType': 'ProductType.variable',
    'ProductVariations': [
      // 🔴 RED
      {
        'Id': 'var1',
        'Image': 'https://i.ibb.co/9HGnczDJ/sl-img7.png',
        'Description': 'Red Nike sports shoe - EU 40',
        'Price': 199.99,
        'SalePrice': 189.99,
        'SKU': 'NIK-RED-40',
        'Stock': 50,
        'AttributeValues': {'Color': 'Red', 'Size': 'EU 40'},
      },
      {
        'Id': 'var2',
        'Image': 'https://i.ibb.co/9HGnczDJ/sl-img7.png',
        'Description': 'Red Nike sports shoe - EU 42',
        'Price': 204.99,
        'SalePrice': 194.99,
        'SKU': 'NIK-RED-42',
        'Stock': 50,
        'AttributeValues': {'Color': 'Red', 'Size': 'EU 42'},
      },
      {
        'Id': 'var3',
        'Image': 'https://i.ibb.co/9HGnczDJ/sl-img7.png',
        'Description': 'Red Nike sports shoe - EU 44',
        'Price': 209.99,
        'SalePrice': 199.99,
        'SKU': 'NIK-RED-44',
        'Stock': 50,
        'AttributeValues': {'Color': 'Red', 'Size': 'EU 44'},
      },

      // ⚫ BLACK
      {
        'Id': 'var4',
        'Image': 'https://i.ibb.co/CpFVkXMj/sl-img6.png',
        'Description': 'Black Nike sports shoe - EU 40',
        'Price': 189.99,
        'SalePrice': 179.99,
        'SKU': 'NIK-BLK-40',
        'Stock': 50,
        'AttributeValues': {'Color': 'Black', 'Size': 'EU 40'},
      },
      {
        'Id': 'var5',
        'Image': 'https://i.ibb.co/CpFVkXMj/sl-img6.png',
        'Description': 'Black Nike sports shoe - EU 42',
        'Price': 194.99,
        'SalePrice': 184.99,
        'SKU': 'NIK-BLK-42',
        'Stock': 50,
        'AttributeValues': {'Color': 'Black', 'Size': 'EU 42'},
      },
      {
        'Id': 'var6',
        'Image': 'https://i.ibb.co/CpFVkXMj/sl-img6.png',
        'Description': 'Black Nike sports shoe - EU 44',
        'Price': 199.99,
        'SalePrice': 189.99,
        'SKU': 'NIK-BLK-44',
        'Stock': 50,
        'AttributeValues': {'Color': 'Black', 'Size': 'EU 44'},
      },

      // 🟢 GREEN
      {
        'Id': 'var7',
        'Image': 'https://i.ibb.co/Q7T9ycsZ/sl-img1.png',
        'Description': 'Green Nike sports shoe - EU 40',
        'Price': 184.99,
        'SalePrice': 174.99,
        'SKU': 'NIK-GRN-40',
        'Stock': 50,
        'AttributeValues': {'Color': 'Green', 'Size': 'EU 40'},
      },
      {
        'Id': 'var8',
        'Image': 'https://i.ibb.co/Q7T9ycsZ/sl-img1.png',
        'Description': 'Green Nike sports shoe - EU 42',
        'Price': 189.99,
        'SalePrice': 179.99,
        'SKU': 'NIK-GRN-42',
        'Stock': 50,
        'AttributeValues': {'Color': 'Green', 'Size': 'EU 42'},
      },
      {
        'Id': 'var9',
        'Image': 'https://i.ibb.co/Q7T9ycsZ/sl-img1.png',
        'Description': 'Green Nike sports shoe - EU 44',
        'Price': 194.99,
        'SalePrice': 184.99,
        'SKU': 'NIK-GRN-44',
        'Stock': 50,
        'AttributeValues': {'Color': 'Green', 'Size': 'EU 44'},
      },

      // 🔵 BLUE
      {
        'Id': 'var10',
        'Image': 'https://i.ibb.co/HLt3Yv4p/sl-img8.png',
        'Description': 'Blue Nike sports shoe - EU 40',
        'Price': 179.99,
        'SalePrice': 169.99,
        'SKU': 'NIK-BLU-40',
        'Stock': 50,
        'AttributeValues': {'Color': 'Blue', 'Size': 'EU 40'},
      },
      {
        'Id': 'var11',
        'Image': 'https://i.ibb.co/HLt3Yv4p/sl-img8.png',
        'Description': 'Blue Nike sports shoe - EU 42',
        'Price': 184.99,
        'SalePrice': 174.99,
        'SKU': 'NIK-BLU-42',
        'Stock': 50,
        'AttributeValues': {'Color': 'Blue', 'Size': 'EU 42'},
      },
      {
        'Id': 'var12',
        'Image': 'https://i.ibb.co/HLt3Yv4p/sl-img8.png',
        'Description': 'Blue Nike sports shoe - EU 44',
        'Price': 189.99,
        'SalePrice': 179.99,
        'SKU': 'NIK-BLU-44',
        'Stock': 50,
        'AttributeValues': {'Color': 'Blue', 'Size': 'EU 44'},
      },
    ],
    'SKU': 'NIK-MULTI',
    'SalePrice': 179.99,
    'Stock': 100,
    'Thumbnail': 'https://i.ibb.co/Q7T9ycsZ/sl-img1.png',
    'Title': 'Running shoes Nike AIR ZOOM PEGASUS 33',
  });

  // Dummy Product 002 - Single Product
  /*await productsCollection.doc('002').set({
    'Brand': {
      'Id': 'adidas',
      'Name': 'Adidas',
      'Image': 'https://example.com/adidas_logo.jpg',
      'ProductsCount': 30,
      'IsFeatured': true,
    },
    'CategoryId': 'shirts',
    'Description': 'Classic Adidas t-shirt',
    'Images': [
      'https://example.com/tshirt_front.jpg',
      'https://example.com/tshirt_back.jpg',
    ],
    'IsFeatured': true,
    'Price': 49.99,
    'ProductAttributes': [],
    'ProductType': 'ProductType.single',
    'ProductVariations': [],
    'SKU': 'ADI-TS001',
    'SalePrice': 39.99,
    'Stock': 50,
    'Thumbnail': 'https://example.com/tshirt_thumbnail.jpg',
    'Title': 'Adidas Originals T-Shirt',
  });*/

  print('Dummy 001 products added successfully!');
}
