import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yummy App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: MyHomePage(title: 'Menu Buttersweet Cake '),
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
        title: Text(widget.title),
        centerTitle: true,
      ),
    drawer: Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Text("Menu Buttersweet Cake")),
          ListTile(
            leading: Icon(Icons.alarm),
            title: Text("Menu Buttersweet Cake"),
          )
        ], 
      ),
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
                      title: 'Cromboloni',
                      rating: 4.6,
                      time: '2 mnt',
                      price: '25 rb',
                      sellerName: 'Buttersweet Cake',
                      sellerImage: 'asset/image/logo.jpeg',
                      isVerified: true,
                      imageUrl: 'asset/image/cromboloni.jpeg',
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: _buildRecipeCard(
                      title: 'Banana Puff Pastry',
                      rating: 4.9,
                      time: '5 mnt',
                      price: '17 rb',
                      sellerName: 'Buttersweet Cake',
                      sellerImage: 'asset/image/logo.jpeg',
                      isVerified: true,
                      imageUrl: 'asset/image/passtry.jpeg',
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
                      title: 'Croissant',
                      rating: 4.9,
                      time: '4 mnt',
                      price: '25 rb',
                      sellerName: 'Buttersweet Cake',
                      sellerImage: 'asset/image/logo.jpeg',
                      isVerified: true,
                      imageUrl: 'asset/image/croissant.jpeg',
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: _buildRecipeCard(
                      title: 'Dessert Box',
                      rating: 4.8,
                      time: '3 mnt',
                      price: '25 rb',
                      sellerName: 'Buttersweet Cake',
                      sellerImage: 'asset/image/logo.jpeg',
                      isVerified: true,
                      imageUrl: 'asset/image/dessert.jpg',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),

            // Third Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: _buildRecipeCard(
                      title: 'Chocolate Donut',
                      rating: 5,
                      time: '7 mnt',
                      price: '15 rb',
                      sellerName: 'Buttersweet Cake',
                      sellerImage: 'asset/image/logo.jpeg',
                      isVerified: true,
                      imageUrl: 'asset/image/Doughnt.jpg',
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: _buildRecipeCard(
                      title: 'Milk Crepe',
                      rating: 4.8,
                      time: '5 mnt',
                      price: '18 rb',
                      sellerName: 'Buttersweet Cake',
                      sellerImage: 'asset/image/logo.jpeg',
                      isVerified: true,
                      imageUrl: 'asset/image/crepe.jpeg',
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
      color: Color.fromARGB(255, 224, 190, 201),
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
                      backgroundImage: NetworkImage(sellerImage),
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
                  imageUrl, // Menggunakan gambar untuk gambar produk
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
                            Icon(Icons.remove_red_eye, color: Colors.grey, size: 16.0), // Updated icon
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
