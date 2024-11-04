import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu Cake Hari Ini',
      theme: ThemeData(
        primarySwatch: Colors.pink, 
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink[100], 
          foregroundColor: Colors.white, 
        ),
        cardColor: Colors.pink[100], 
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
          ),
        ),
      ),
      home: MyHomePage(title: 'Menu Cake Hari Ini'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // First Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: _buildRecipeCard(
                      title: 'Lychee Cake',
                      rating: 4.6,
                      time: '2 mnt',
                      price: '25 rb',
                      sellerName: 'Cake Yummy',
                      sellerImage: 'assets/images/logoo.jpg',
                      isVerified: true,
                      imageUrl: 'assets/images/lychee cake.jpg',
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: _buildRecipeCard(
                      title: 'Oreo Cake',
                      rating: 4.9,
                      time: '5 mnt',
                      price: '17 rb',
                      sellerName: 'Cake Yummy',
                      sellerImage: 'assets/images/logoo.jpg',
                      isVerified: true,
                      imageUrl: 'assets/images/oreo cake.jpg',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),

            // Second Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: _buildRecipeCard(
                      title: 'Red Velvet Cheesecake',
                      rating: 4.9,
                      time: '4 mnt',
                      price: '25 rb',
                      sellerName: 'Cake Yummy',
                      sellerImage: 'assets/images/logoo.jpg',
                      isVerified: true,
                      imageUrl: 'assets/images/red velvet cheesecake.jpg',
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: _buildRecipeCard(
                      title: 'Strawberry Cake',
                      rating: 4.8,
                      time: '3 mnt',
                      price: '25 rb',
                      sellerName: 'Cake Yummy',
                      sellerImage: 'assets/images/logoo.jpg',
                      isVerified: true,
                      imageUrl: 'assets/images/strawberry cake.jpg',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeCard({
    required String title,
    required double rating,
    required String time,
    required String price,
    required String sellerName,
    required String sellerImage,
    required bool isVerified,
    required String imageUrl,
  }) {
    return Card(
      color: Colors.pink[50], 
      elevation: 2,
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(sellerImage),
                      radius: 20.0,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      sellerName,
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    if (isVerified)
                      Icon(Icons.check_circle, color: Colors.blue, size: 16.0),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  imageUrl,
                  width: 200,
                  height: 260,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange),
                        Text('$rating'),
                        SizedBox(width: 16.0),
                        Icon(Icons.timer, color: Colors.grey),
                        Text(time),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.monetization_on, color: Colors.grey, size: 16.0),
                            SizedBox(width: 4.0),
                            Text(price),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 8.0,
            right: 8.0,
            child: IconButton(
              icon: Icon(Icons.bookmark_border, color: Colors.black, size: 24.0),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$title bookmarked!'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}