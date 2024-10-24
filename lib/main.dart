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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
          backgroundColor: Colors.transparent,
          leading: ButtonBar(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.chevron_left))
            ],
          ),
          centerTitle: true,
          title: Text(
            'Petualangan Rasa',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.54),  
              itemCount: ListMakanan.length,
              itemBuilder: (context, index) {
                final menu = ListMakanan[index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(blurRadius: 4, color: Colors.grey,
                            )
                          ]),
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
                              Text('Kopi Kenangan'),
                              SizedBox(width: 5,),
                              CircleAvatar(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.blue,
                                radius: 9,
                                child: Icon(Icons.check, size: 9,),
                              )
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
                                        fontSize: 18),
                                  ),
                                ),
                                Row(
                                  children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 2,
                                          // spreadRadius: 2,
                                          color: Colors.grey
                                        )
                                      ]
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 4,
                                        left: 4,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(menu['rating']),
                                          SizedBox(width: 5,),
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
                                              onRatingUpdate: (double value) {}
                                            ),
                                        ],
                                      ),
                                    ),
                                  )
                                  ]
                                ),
                                SizedBox(height: 7,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.shopping_cart,
                                        color: Colors.grey,),
                                        Text(menu['view'])
                                      ],
                                    ),
                                    SizedBox(width: 20,),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 1,
                                                color: Colors.grey
                                              )
                                            ]
                                          ),
                                          child: IconButton(onPressed: (){},
                                          icon: Icon(Icons.bookmark_border)),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        )
    );
  }
}
