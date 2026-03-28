import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SocialHomePage(),
    );
  }
}

class SocialHomePage extends StatefulWidget {
  const SocialHomePage({super.key});

  @override
  State<SocialHomePage> createState() => _SocialHomePageState();
}

class _SocialHomePageState extends State<SocialHomePage> {
  int selectedNav = 0;

  static const Color bg = Color(0xFFF6F7FB);
  static const Color white = Colors.white;
  static const Color dark = Color(0xFF1A1A2E);
  static const Color purple = Color(0xFF7C6FE0);
  static const Color lightPurple = Color(0xFFEEECFD);
  static const Color grey = Color(0xFF9898A8);

  final List<Map<String, dynamic>> stories = [
    {'name': 'Your Story', 'color1': Color(0xFF667EEA), 'color2': Color(0xFF764BA2), 'letter': '+'},
    {'name': 'Harshit', 'color1': Color(0xFFf7971e), 'color2': Color(0xFFffd200), 'letter': 'H'},
    {'name': 'Anjishnu', 'color1': Color(0xFFe96c6c), 'color2': Color(0xFFf5a05a), 'letter': 'A'},
    {'name': 'Aniket', 'color1': Color(0xFF43e97b), 'color2': Color(0xFF38f9d7), 'letter': 'A'},
    {'name': 'Nikhil', 'color1': Color(0xFFa18cd1), 'color2': Color(0xFFfbc2eb), 'letter': 'N'},
    {'name': 'Rohan', 'color1': Color(0xFF4facfe), 'color2': Color(0xFF00f2fe), 'letter': 'R'},
  ];

  final List<Map<String, dynamic>> posts = [
    {
      'user': 'Harshit Tiwari',
      'handle': '@crown003',
      'time': '2m ago',
      'text': 'posting just for fun! have a beautiful day. keep smiling',
      'likes': 128,
      'comments': 24,
      'color1': Color(0xFFf7971e),
      'color2': Color(0xFFffd200),
      'letter': 'H',
      'liked': false,
      'hasImage': true,
      'imgColor1': Color(0xFF667EEA),
      'imgColor2': Color(0xFF764BA2),
      'imgLabel': 'KEEP SMILING :)',
    },
    {
      'user': 'Anjishnu',
      'handle': '@anjishnu_r',
      'time': '15m ago',
      'text': 'made rangoli today for the first time and it actually looks good lol',
      'likes': 84,
      'comments': 12,
      'color1': Color(0xFFe96c6c),
      'color2': Color(0xFFf5a05a),
      'letter': 'A',
      'liked': true,
      'hasImage': true,
      'imgColor1': Color(0xFFe96c6c),
      'imgColor2': Color(0xFFf5a05a),
      'imgLabel': 'Rangoli',
    },
    {
      'user': 'Aniket Verma',
      'handle': '@aniket_v',
      'time': '1h ago',
      'text': 'match was insane today. india won by 6 wickets!!',
      'likes': 310,
      'comments': 57,
      'color1': Color(0xFF43e97b),
      'color2': Color(0xFF38f9d7),
      'letter': 'A',
      'liked': false,
      'hasImage': false,
    },
    {
      'user': 'Nikhil Maurya',
      'handle': '@nikhil_217',
      'time': '3h ago',
      'text': 'finished my painting after 3 weeks. never giving up on art no matter what',
      'likes': 220,
      'comments': 33,
      'color1': Color(0xFFa18cd1),
      'color2': Color(0xFFfbc2eb),
      'letter': 'N',
      'liked': true,
      'hasImage': true,
      'imgColor1': Color(0xFFa18cd1),
      'imgColor2': Color(0xFFfbc2eb),
      'imgLabel': 'My Art',
    },
    {
      'user': 'Rohan Mehta',
      'handle': '@rohan_m',
      'time': '5h ago',
      'text': 'finally hit diamond rank in the game. took me 2 months but worth it',
      'likes': 175,
      'comments': 41,
      'color1': Color(0xFF4facfe),
      'color2': Color(0xFF00f2fe),
      'letter': 'R',
      'liked': false,
      'hasImage': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            buildTopBar(),
            buildStories(),
            const SizedBox(height: 8),
            ...posts.asMap().entries.map((e) => buildPost(e.value, e.key)),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNav(),
    );
  }

  Widget buildTopBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Social',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: dark),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
                ),
                child: const Icon(Icons.search_rounded, color: dark, size: 22),
              ),
              const SizedBox(width: 10),
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
                    ),
                    child: const Icon(Icons.notifications_none_rounded, color: dark, size: 22),
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildStories() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: stories.length,
        itemBuilder: (context, i) {
          var s = stories[i];
          return Container(
            width: 70,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [s['color1'], s['color2']]),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: (s['color1'] as Color).withOpacity(0.4), blurRadius: 8, offset: const Offset(0, 3))
                    ],
                  ),
                  child: Center(
                    child: Text(
                      s['letter'],
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  s['name'],
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: dark),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildPost(Map<String, dynamic> post, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [post['color1'], post['color2']]),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      post['letter'],
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(post['user'], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: dark)),
                      Text(post['handle'] + '  •  ' + post['time'], style: const TextStyle(fontSize: 11, color: grey)),
                    ],
                  ),
                ),
                const Icon(Icons.more_horiz_rounded, color: grey),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(post['text'], style: const TextStyle(fontSize: 14, color: dark, height: 1.5)),
          ),

          if (post['hasImage'] == true)
            Container(
              height: 160,
              margin: const EdgeInsets.fromLTRB(14, 12, 14, 0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [post['imgColor1'], post['imgColor2']],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  post['imgLabel'],
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Colors.white),
                ),
              ),
            ),

          Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 8, 8),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      posts[index]['liked'] = !post['liked'];
                      posts[index]['likes'] += post['liked'] ? 1 : -1;
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        post['liked'] ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                        color: post['liked'] ? Colors.redAccent : grey,
                        size: 22,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${post['likes']}',
                        style: TextStyle(
                          fontSize: 13,
                          color: post['liked'] ? Colors.redAccent : grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 18),
                Row(
                  children: [
                    const Icon(Icons.chat_bubble_outline_rounded, color: grey, size: 20),
                    const SizedBox(width: 4),
                    Text('${post['comments']}', style: const TextStyle(fontSize: 13, color: grey, fontWeight: FontWeight.w600)),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.share_outlined, color: grey, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomNav() {
    final icons = [
      Icons.home_rounded,
      Icons.explore_outlined,
      Icons.add_box_outlined,
      Icons.favorite_border_rounded,
      Icons.person_outline_rounded,
    ];
    final labels = ['Home', 'Explore', 'Post', 'Activity', 'Profile'];

    return Container(
      height: 68,
      decoration: BoxDecoration(
        color: white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 16, offset: const Offset(0, -3))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (i) {
          bool isActive = selectedNav == i;
          return GestureDetector(
            onTap: () => setState(() => selectedNav = i),
            behavior: HitTestBehavior.opaque,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: isActive ? lightPurple : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icons[i], color: isActive ? purple : grey, size: 24),
                  const SizedBox(height: 3),
                  Text(
                    labels[i],
                    style: TextStyle(
                      fontSize: 10,
                      color: isActive ? purple : grey,
                      fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}