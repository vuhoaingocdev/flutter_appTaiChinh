import 'package:app_taichinh/screens/FooterScreens/ThiTruong/thiTruong.dart.dart';
import 'package:app_taichinh/utils/Widget/footer/footer.dart';
import 'package:flutter/material.dart';

class DanhSachYeuThich extends StatefulWidget {
  const DanhSachYeuThich({super.key});

  @override
  State<DanhSachYeuThich> createState() => _DanhSachYeuThichState();
}

class _DanhSachYeuThichState extends State<DanhSachYeuThich> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, String>> favoriteCoins = [
    {'name': 'BNB/USDT', 'change': '-1,50%'},
    {'name': 'BTC/USDT', 'change': '-3,96%'},
    {'name': 'ETH/USDT', 'change': '-7,57%'},
    {'name': 'SOL/USDT', 'change': '-5,72%'},
    {'name': 'XRP/USDT', 'change': '-8,52%'},
    {'name': 'RED/USDT', 'change': '+0,74%'},
    {'name': 'PEPE/USDT', 'change': '-0,32%'},
    {'name': 'ADA/USDT', 'change': '-8,37%'},
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    //mặc định cho checkbox item được chọn
    selectedCoins = favoriteCoins.map((coin) => coin['name']!).toSet();
  }

  Set<String> selectedCoins = {};
  Widget buildCoinItem(Map<String, String> coin) {
    bool isPositive = coin['change']!.contains('+');
    String coinName = coin['name']!;

    bool isChecked = selectedCoins.contains(coinName);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                coinName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                coin['change']!,
                style: TextStyle(
                  color: isPositive ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Checkbox(
            value: isChecked,
            activeColor: Colors.black,
            onChanged: (bool? value) {
              setState(() {
                if (value == true) {
                  selectedCoins.add(coinName);
                } else {
                  selectedCoins.remove(coinName);
                }
              });
            },
          ),
        ],
      ),
    );
  }

  //Thêm vào danh sách yêu thích
  Widget buildFavoriteTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        children: [
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: favoriteCoins.length,
            itemBuilder: (context, index) {
              return buildCoinItem(favoriteCoins[index]);
            },
          ),

          const SizedBox(height: 20),

          // Nút thêm vào yêu thích
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 237, 197, 66),
              minimumSize: const Size(400, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Thêm vào yêu thích',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),

          TextButton(
            onPressed: () {},
            child: const Text(
              'Thêm các cặp khác',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 153, 0), fontSize: 16),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  //Demo tên tab
  Widget buildDummyTab(String title) {
    return Center(
        child: Text('Nội dung tab "$title"',
            style: const TextStyle(fontSize: 16)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildSearchBar(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: TabBar(
                isScrollable: true,
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                unselectedLabelStyle: const TextStyle(fontSize: 16),
                indicatorColor: Colors.yellow.shade700,
                indicatorWeight: 3,
                indicator: UnderlineTabIndicator(
                  borderSide:
                      BorderSide(color: Colors.yellow.shade700, width: 3),
                  insets: const EdgeInsets.symmetric(horizontal: 30),
                ),
                tabs: const [
                  Tab(text: 'Danh sách yêu thích'),
                  Tab(text: 'Thị trường'),
                  Tab(text: 'Alpha'),
                  Tab(text: 'Khám phá'),
                  Tab(text: 'Khám phá'),
                  Tab(text: 'Khám phá'),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                buildFavoriteTab(),
                const ThiTruongScreen(),
                buildDummyTab("Alpha"),
                buildDummyTab("Khám phá"),
                buildDummyTab("Khám phá"),
                buildDummyTab("Khám phá"),
              ],
            ),
          ),
        ],
      ),
      //footer
      bottomNavigationBar: const CustomFooter(currentIndex: 1),
    );
  }

  Widget buildSearchBar() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 8),
          Text("Tìm kiếm Coin/Cặp giao dịch/Phái sinh",
              style: TextStyle(color: Colors.grey, fontSize: 16)),
        ],
      ),
    );
  }
}
