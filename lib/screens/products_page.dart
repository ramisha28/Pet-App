import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
  });
}

class CartItem {
  final String productName;
  final double price;
  int quantity;
  final String imageUrl;

  CartItem({
    required this.productName,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productName: json['productName'],
      price: json['price'],
      quantity: json['quantity'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'price': price,
      'quantity': quantity,
      'imageUrl': imageUrl,
    };
  }
}

class ProductsPage extends StatefulWidget {
  ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  String _selectedCategory = 'All';

  final List<String> _categories = [
    'All',
    'Dog Food',
    'Cat Food',
    'Bird Food',
    'Pet Toys',
    'Accessories',
    'Health & Grooming'
  ];

  final List<Product> _products = [
    // Dog Food Products
    Product(
      name: 'Royal Canin Adult Dog Food',
      description: 'Premium dry food for adult dogs (15kg)',
      price: 89.99,
      imageUrl: 'assets/images/royal_canin_dog.jpg',
      category: 'Dog Food',
    ),
    Product(
      name: 'Pedigree Puppy Food',
      description: 'Complete nutrition for puppies (10kg)',
      price: 45.99,
      imageUrl: 'assets/images/pedigree_puppy.jpg',
      category: 'Dog Food',
    ),
    Product(
      name: 'Hill\'s Science Diet',
      description: 'Adult dog food for sensitive stomach (12kg)',
      price: 79.99,
      imageUrl: 'assets/images/hills_dog.jpg',
      category: 'Dog Food',
    ),

    // Cat Food Products
    Product(
      name: 'Whiskas Adult Cat Food',
      description: 'Complete nutrition for adult cats (7kg)',
      price: 34.99,
      imageUrl: 'assets/images/whiskas_cat.jpg',
      category: 'Cat Food',
    ),
    Product(
      name: 'Me-O Persian Cat Food',
      description: 'Specially formulated for Persian cats (3kg)',
      price: 29.99,
      imageUrl: 'assets/images/meo_persian.jpg',
      category: 'Cat Food',
    ),

    // Bird Food Products
    Product(
      name: 'Vitakraft Parrot Food',
      description: 'Premium seed mix for parrots (2kg)',
      price: 19.99,
      imageUrl: 'assets/images/vitakraft_parrot.jpg',
      category: 'Bird Food',
    ),

    // Pet Toys
    Product(
      name: 'Kong Classic Dog Toy',
      description: 'Durable rubber chew toy',
      price: 12.99,
      imageUrl: 'assets/images/kong_toy.jpg',
      category: 'Pet Toys',
    ),
    Product(
      name: 'Cat Laser Pointer Toy',
      description: 'Interactive LED toy for cats',
      price: 9.99,
      imageUrl: 'assets/images/cat_laser.jpg',
      category: 'Pet Toys',
    ),

    // Accessories
    Product(
      name: 'Adjustable Dog Collar',
      description: 'Comfortable nylon collar with buckle',
      price: 14.99,
      imageUrl: 'assets/images/dog_collar.jpg',
      category: 'Accessories',
    ),
    Product(
      name: 'Cat Litter Box',
      description: 'Covered litter box with filter',
      price: 24.99,
      imageUrl: 'assets/images/litter_box.jpg',
      category: 'Accessories',
    ),

    // Health & Grooming
    Product(
      name: 'Pet Grooming Brush',
      description: 'Professional deshedding tool',
      price: 19.99,
      imageUrl: 'assets/images/grooming_brush.jpg',
      category: 'Health & Grooming',
    ),
    // Add more products...
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _categories.length, vsync: this);
  }

  void _addToCart(Product product) async {
    final prefs = await SharedPreferences.getInstance();
    List<CartItem> cartItems = [];

    String? cartJson = prefs.getString('cart');
    if (cartJson != null) {
      List<dynamic> decodedList = jsonDecode(cartJson);
      cartItems = decodedList.map((item) => CartItem.fromJson(item)).toList();
    }

    int existingIndex =
        cartItems.indexWhere((item) => item.productName == product.name);
    if (existingIndex != -1) {
      cartItems[existingIndex].quantity++;
    } else {
      cartItems.add(CartItem(
        productName: product.name,
        price: product.price,
        quantity: 1,
        imageUrl: product.imageUrl,
      ));
    }

    await prefs.setString(
        'cart', jsonEncode(cartItems.map((e) => e.toJson()).toList()));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product.name} added to cart')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Food & Accessories'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: _categories.map((category) => Tab(text: category)).toList(),
          onTap: (index) {
            setState(() {
              _selectedCategory = _categories[index];
            });
          },
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: _products
            .where((product) =>
                _selectedCategory == 'All' ||
                product.category == _selectedCategory)
            .length,
        itemBuilder: (context, index) {
          final filteredProducts = _products
              .where((product) =>
                  _selectedCategory == 'All' ||
                  product.category == _selectedCategory)
              .toList();
          final product = filteredProducts[index];

          return Card(
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(product.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        product.description,
                        style: const TextStyle(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () => _addToCart(product),
                        icon: const Icon(Icons.add_shopping_cart),
                        label: const Text('Add to Cart'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
