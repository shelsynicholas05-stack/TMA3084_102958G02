import 'package:flutter/material.dart';

void main() {
  runApp(const CafeMenuApp());
}

class CafeMenuApp extends StatelessWidget {
  const CafeMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cafe Menu App',
      theme: ThemeData(primarySwatch: Colors.brown, useMaterial3: true),
      home: const MenuHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MenuHomePage extends StatelessWidget {
  const MenuHomePage({super.key});

  // List of drinks mapped to your exact asset file names
  final List<Map<String, String>> drinks = const [
    {
      'name': 'Mocha Latte',
      'price': 'RM 12.00',
      'image': 'assets/images/mocha_latte.jpg',
      'desc': 'Rich espresso blended with chocolate and velvety milk.',
    },
    {
      'name': 'Strawberry Matcha',
      'price': 'RM 14.00',
      'image': 'assets/images/strawberry_matcha.jpg',
      'desc': 'Layered sweet strawberry puree, fresh milk, and premium matcha.',
    },
    {
      'name': 'Cappuccino',
      'price': 'RM 10.00',
      'image': 'assets/images/cappuccino.jpg',
      'desc': 'Classic espresso with equal parts foamed milk and artisan art.',
    },
    {
      'name': 'Espresso',
      'price': 'RM 8.00',
      'image': 'assets/images/espresso.jpg',
      'desc': 'Bold, concentrated shot of pure coffee perfection.',
    },
    {
      'name': 'Iced Latte',
      'price': 'RM 11.00',
      'image': 'assets/images/latte.jpg',
      'desc': 'Smooth espresso poured over chilled fresh milk and ice cubes.',
    },
    {
      'name': 'Iced Matcha',
      'price': 'RM 13.00',
      'image': 'assets/images/matcha.jpg',
      'desc': 'Refreshing earthy Japanese green tea served over ice.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('☕ Artisanal Drinks Menu'),
        backgroundColor: Colors.brown[700],
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: drinks.length,
        itemBuilder: (context, index) {
          final drink = drinks[index];
          return Card(
            elevation: 4.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  // Image container widget
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(drink['image']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Details column widget
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          drink['name']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          drink['desc']!,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.local_cafe,
                              size: 16,
                              color: Colors.brown,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              drink['price']!,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.brown,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
