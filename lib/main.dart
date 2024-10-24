import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal), // Change to teal
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> ListMakanan = [
    {
      'gambar': 'CaptainAppleCream.png',
      'judul': 'Captain Apple Cream',
      'rating': '4.4',
      'view': '12,7 rb'
    },
    {
      'gambar': 'MasterPeach.png',
      'judul': 'Master Chef Peach Aren Latte',
      'rating': '4.7',
      'view': '10,2 rb'
    },
    {
      'gambar': 'SunnyPeach.png',
      'judul': 'Sunny Peach Americano',
      'rating': '4.5',
      'view': '13,6 rb'
    },
    {
      'gambar': 'RedAppleBun.png',
      'judul': 'Red Apple Bun',
      'rating': '4.1',
      'view': '11,1 rb'
    },
    {
      'gambar': 'MatchaBun.png',
      'judul': 'Matcha Bun',
      'rating': '4.9',
      'view': '16,7 rb'
    },
    {
      'gambar': 'SmokedChicken.png',
      'judul': 'Smoked Chicken Cheese Bread',
      'rating': '4.5',
      'view': '12 rb'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal, 
        centerTitle: true,
        title: Text(
          'Petualangan Rasa',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white), 
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: 500,
              color: Colors.teal,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.teal, 
                  
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/logokopi.webp'), // Replace with your image
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Welcome, User!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Your Favorite Drinks',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact Us'),
              onTap: () {
                // Handle navigation
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.54,
          ),
          itemCount: ListMakanan.length,
          itemBuilder: (context, index) {
            final menu = ListMakanan[index];
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, 
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              'assets/logokopi.webp',
                              height: 50,
                              width: 50,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text('Kopi Kenangan', style: TextStyle(color: Colors.teal)), 
                          SizedBox(width: 5),
                          CircleAvatar(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.green, 
                            radius: 9,
                            child: Icon(Icons.check, size: 9),
                          ),
                        ],
                      ),
                      Center(
                        child: ClipRRect(
                          child: Image.asset(
                            menu['gambar'],
                            height: 150,
                            width: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 60,
                              child: Text(
                                menu['judul'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.teal, 
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade200, 
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      right: 4,
                                      left: 4,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(menu['rating'], style: TextStyle(color: Colors.black)), // Change rating text color
                                        SizedBox(width: 5),
                                        RatingBar.builder(
                                          initialRating: double.parse(menu['rating']),
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          ignoreGestures: true,
                                          itemCount: 5,
                                          itemSize: 16,
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.yellow.shade600,
                                          ),
                                          onRatingUpdate: (double value) {},
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 7),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.shopping_cart, color: Colors.grey),
                                    Text(menu['view'], style: TextStyle(color: Colors.black)), // Change view text color
                                  ],
                                ),
                                SizedBox(width: 20),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 1,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.bookmark_border, color: Colors.teal), // Change bookmark icon color to teal
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
