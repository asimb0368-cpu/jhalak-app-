import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(JhalakApp());

class JhalakApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JhalakHome(),
    );
  }
}

class JhalakHome extends StatefulWidget {
  @override
  _JhalakHomeState createState() => _JhalakHomeState();
}

class _JhalakHomeState extends State<JhalakHome> {
  final List<String> videos = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return VideoItem(url: videos[index], index: index);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Discover'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: 'Inbox'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
        ],
      ),
    );
  }
}

class VideoItem extends StatefulWidget {
  final String url;
  final int index;
  VideoItem({required this.url, required this.index});
  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late VideoPlayerController _controller;
  bool liked = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
     ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: _controller.value.isInitialized
             ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : CircularProgressIndicator(color: Colors.purple),
        ),
        Positioned(
          left: 15,
          bottom: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('@jhalak_official', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text('This is Jhalak App 🔥 #viral #jhalak', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        Positioned(
          right: 10,
          bottom: 100,
          child: Column(
            children: [
              IconButton(
                icon: Icon(Icons.favorite, color: liked? Colors.red : Colors.white, size: 35),
                onPressed: () => setState(() => liked =!liked),
              ),
              Text('1.2M', style: TextStyle(color: Colors.white)),
              SizedBox(height: 20),
              Icon(Icons.comment, color: Colors.white, size: 35),
              Text('5K', style: TextStyle(color: Colors.white)),
              SizedBox(height: 20),
              Icon(Icons.share, color: Colors.white, size: 35),
              Text('Share', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        Center(
          child: Text('Jhalak Video #${widget.index + 1}', style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 20)),
        ),
      ],
    );
  }
}
