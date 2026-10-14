import 'package:flutter/material.dart';

void main() {
  runApp(const JhalakApp());
}

class JhalakApp extends StatelessWidget {
  const JhalakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jhalak',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const JhalakHome(),
    );
  }
}

class JhalakHome extends StatefulWidget {
  const JhalakHome({super.key});

  @override
  State<JhalakHome> createState() => _JhalakHomeState();
}

class _JhalakHomeState extends State<JhalakHome> {
  int currentIndex = 0;

  final List<String> videos = [
    "Jhalak Video #1",
    "Jhalak Video #2",
    "Jhalak Video #3",
    "Jhalak Video #4",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                color: Colors.primaries[index % Colors.primaries.length],
                child: Center(
                  child: Text(
                    videos[index],
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 100,
                child: Column(
                  children: [
                    IconButton(icon: const Icon(Icons.favorite, size: 35, color: Colors.white), onPressed: () {}),
                    const Text("1.2M"),
                    const SizedBox(height: 20),
                    IconButton(icon: const Icon(Icons.comment, size: 35, color: Colors.white), onPressed: () {}),
                    const Text("5K"),
                    const SizedBox(height: 20),
                    IconButton(icon: const Icon(Icons.share, size: 35, color: Colors.white), onPressed: () {}),
                    const Text("Share"),
                  ],
                ),
              ),
              const Positioned(
                left: 15,
                bottom: 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("@jhalak_official", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 5),
                    Text("This is Jhalak App 🔥 #viral #jhalak"),
                  ],
                ),
              )
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: (i) => setState(() => currentIndex = i),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Discover"),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Inbox"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Me"),
        ],
      ),
    );
  }
}
