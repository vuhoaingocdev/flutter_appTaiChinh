import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return HandleHome();
  }
}

class HandleHome extends State<Home> {
  int _selectedIndex = 0;
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/telegram.png',
            height: 20,
            fit: BoxFit.contain,
          ),
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'REZ',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
        actions: const [
          Icon(Icons.notifications, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.headset_mic, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      //body
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Tổng giá trị dự kiến (VNĐ) ',
                    style: TextStyle(fontSize: 14)),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('0.00đ',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow[700],
                      ),
                      child: const Text(
                        'Nạp tiền',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCategoryButton('assets/images/google.png', 'P2P'),
              _buildCategoryButton('assets/images/google.png', 'Earn'),
              _buildCategoryButton('assets/images/google.png', 'Refer2Earn'),
              _buildCategoryButton(
                  'assets/images/google.png', 'Câu hỏi thường gặp'),
              _buildCategoryButton('assets/images/google.png', 'Nhiều hơn'),
            ],
          ),
          //Divider
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              color: Colors.grey[400],
              thickness: 0.5,
            ),
          ),
          //Table
          const SizedBox(height: 10),
          //Danh sách yêu thích
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(15, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            'Nút bấm này là nút tính năng',
                            style: TextStyle(
                              fontSize: 16,
                              color: selectedIndex == index
                                  ? Colors.blue
                                  : Colors.black,
                              fontWeight: selectedIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: selectedIndex == index
                              ? 40
                              : 0, // Thanh màu xanh chỉ hiện khi nút được chọn
                          height: 3,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),

          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
              child: const Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Tên',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Giá gần nhất',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Biến động (%)',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: ListView(
              children: const [
                CryptoItem(
                  name: 'BNB',
                  price: '602.74',
                  change: '+0.43%',
                  value: 'đ15,409,662.89',
                ),
                CryptoItem(
                  name: 'BTC',
                  price: '81,841.99',
                  change: '-0.52%',
                  value: 'đ2,092,373,953.17',
                ),
                CryptoItem(
                  name: 'ETH',
                  price: '1,812.34',
                  change: '+0.96%',
                  value: 'đ46,334,320.68',
                ),
                CryptoItem(
                  name: 'SOL',
                  price: '126.03',
                  change: '+1.92%',
                  value: 'đ3,222,085.5',
                ),
                CryptoItem(
                  name: 'XRP',
                  price: '2.0985',
                  change: '-1.16%',
                  value: 'đ53,650.29',
                ),
                CryptoItem(
                  name: 'PEPE',
                  price: '0.00000702',
                  change: '+1.89%',
                  value: 'đ0.17947346',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(
              icon: Icon(Icons.show_chart), label: 'Thị trường'),
          BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz), label: 'Giao dịch'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.chartLine), label: 'Futures'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet), label: 'Tài sản'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow[700],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildCategoryButton(String imagePath, String label) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                height: 27,
                width: 27,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class CryptoItem extends StatelessWidget {
  final String name;
  final String price;
  final String change;
  final String value;

  const CryptoItem({
    super.key,
    required this.name,
    required this.price,
    required this.change,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = change.startsWith('+');
    final bgColor = isPositive ? Colors.green : Colors.red;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          price,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          value,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 90,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        change,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
