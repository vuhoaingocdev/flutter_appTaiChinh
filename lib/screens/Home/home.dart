import 'package:app_taichinh/screens/Home/CauhoiThuongGap/HelpSupportScreen/home.dart';
import 'package:app_taichinh/screens/Home/P2P/p2p.dart';
import 'package:app_taichinh/screens/Home/Earn/ern.dart';
import 'package:app_taichinh/screens/Home/Refer2Earn/refer2Earn.dart';
import 'package:app_taichinh/screens/login.dart';
import 'package:app_taichinh/utils/Widget/categoryButton.dart';
import 'package:app_taichinh/utils/Widget/cryptoItem.dart';
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
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: AppBar(
              elevation: 0,
              leading: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset(
                  'assets/images/binance.png',
                  height: 30,
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
          ),
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
                CategoryButtonImage(
                  imagePath: 'assets/images/p2p.png',
                  label: 'P2P',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const P2PTradingScreen()),
                    );
                  },
                ),
                CategoryButtonImage(
                  imagePath: 'assets/images/earnings.png',
                  label: 'Earn',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EarnScreen()),
                    );
                  },
                ),
                CategoryButtonImage(
                  imagePath: 'assets/images/exchange.png',
                  label: 'Refer2Earn',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Refer2EarnScreen()),
                    );
                  },
                ),
                CategoryButtonImage(
                  imagePath: 'assets/images/problem.png',
                  label: 'Câu hỏi thường gặp',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HelpSupportScreen()),
                    );
                  },
                ),
                CategoryButtonImage(
                  imagePath: 'assets/images/other.png',
                  label: 'Nhiều hơn',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HelpSupportScreen()),
                    );
                  },
                ),
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
            //Danh sách yêu thích
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CategoryButton(
                      label: 'Danh sách yêu thích',
                      index: 0,
                      isSelected: selectedIndex == 0,
                      onPressed: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                    ),
                    CategoryButton(
                      label: 'Tăng giá',
                      index: 1,
                      isSelected: selectedIndex == 1,
                      onPressed: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                    ),
                    CategoryButton(
                      label: 'Giá cả lợi nhuận',
                      index: 2,
                      isSelected: selectedIndex == 2,
                      onPressed: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                    ),
                    CategoryButton(
                      label: 'Giá cả thị trường',
                      index: 3,
                      isSelected: selectedIndex == 3,
                      onPressed: () {
                        setState(() {
                          selectedIndex = 3;
                        });
                      },
                    ),
                    CategoryButton(
                      label: 'Giá cả thị trường',
                      index: 4,
                      isSelected: selectedIndex == 4,
                      onPressed: () {
                        setState(() {
                          selectedIndex = 4;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            //Table biến động thị trường
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
                child: const Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Tên',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Expanded(
                      flex: 3,
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
            // Expanded(
            //   child: ListView(
            //     children: const [
            //       CryptoItem(
            //         name: 'BNB',
            //         price: '602.74',
            //         change: '+0.43%',
            //         value: 'đ15,409,662.89',
            //       ),
            //     ],
            //   ),
            // ),

            const CryptoList()
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
      ),
    );
  }
}
