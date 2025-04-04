import 'package:app_taichinh/screens/Home/CauhoiThuongGap/HelpSupportScreen/home.dart';
import 'package:app_taichinh/screens/Home/P2P/p2p.dart';
import 'package:app_taichinh/screens/Home/Earn/ern.dart';
import 'package:app_taichinh/screens/Home/Refer2Earn/refer2Earn.dart';
import 'package:app_taichinh/screens/login.dart';
import 'package:app_taichinh/utils/Widget/categoryButton.dart';
import 'package:app_taichinh/utils/Widget/cryptoItem.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final appLocalizations = AppLocalizations.of(context)!;
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
                  Text(appLocalizations.totalEstimatedValue,
                      style: const TextStyle(fontSize: 14)),
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
                        child: Text(
                          appLocalizations.depositMoney,
                          style: const TextStyle(color: Colors.black),
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
                  label: appLocalizations.frequentlyAskedQuestions,
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
                  label: appLocalizations.more,
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
                      label: appLocalizations.favoritesList,
                      index: 0,
                      isSelected: selectedIndex == 0,
                      onPressed: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                    ),
                    CategoryButton(
                      label: appLocalizations.priceIncrease,
                      index: 1,
                      isSelected: selectedIndex == 1,
                      onPressed: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                    ),
                    CategoryButton(
                      label: appLocalizations.profitPrice,
                      index: 2,
                      isSelected: selectedIndex == 2,
                      onPressed: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                    ),
                    CategoryButton(
                      label: appLocalizations.marketPrice,
                      index: 3,
                      isSelected: selectedIndex == 3,
                      onPressed: () {
                        setState(() {
                          selectedIndex = 3;
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
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        appLocalizations.name,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        appLocalizations.latestPrice,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        appLocalizations.volatility,
                        style: const TextStyle(fontSize: 14),
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
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home), label: appLocalizations.homePage),
            BottomNavigationBarItem(
                icon: const Icon(Icons.show_chart),
                label: appLocalizations.market),
            BottomNavigationBarItem(
                icon: const Icon(Icons.swap_horiz),
                label: appLocalizations.transaction),
            BottomNavigationBarItem(
                icon: const Icon(FontAwesomeIcons.chartLine),
                label: appLocalizations.futures),
            BottomNavigationBarItem(
                icon: const Icon(Icons.account_balance_wallet),
                label: appLocalizations.asset),
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
