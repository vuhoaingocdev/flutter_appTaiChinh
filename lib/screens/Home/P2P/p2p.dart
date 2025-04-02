import 'package:app_taichinh/screens/Home/home.dart';
import 'package:flutter/material.dart';

class P2PTradingScreen extends StatefulWidget {
  const P2PTradingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _P2PTradingScreenState createState() => _P2PTradingScreenState();
}

class _P2PTradingScreenState extends State<P2PTradingScreen> {
  String selectedCurrencyVND = 'VND';
  bool isBuying = true;
  String selectedCurrencyUSDT = 'USDT';
  String selectedAmount = 'Số lượng';
  String selectedPayment = 'Thanh toán';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
            ),
            title: const Text(
              'GIAO DỊCH NHANH P2P',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _buildDropdown(selectedCurrencyVND, ['VND', 'USD'],
                    (value) {
                  setState(() {
                    selectedCurrencyVND = value!;
                  });
                }),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(120.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(children: [
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      // Tabs Mua/Bán căn trái
                      const SizedBox(
                        width: 150,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TabBar(
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.black,
                            indicator: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorPadding: EdgeInsets.zero,
                            tabs: [
                              Tab(
                                child:
                                    Text('Mua', style: TextStyle(fontSize: 14)),
                              ),
                              Tab(
                                child:
                                    Text('Bán', style: TextStyle(fontSize: 14)),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // 3 icon
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.notifications,
                                  color: Colors.black),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.message,
                                  color: Colors.black),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.more_vert,
                                  color: Colors.black),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //Số lượng _ Thanh toán
                  const SizedBox(height: 12),
                  Row(
                    mainAxisSize: MainAxisSize.min, // Giữ các phần tử sát nhau
                    children: [
                      _buildDropdown(
                          selectedCurrencyUSDT, ['USDT', 'BTC', 'ETH'],
                          (value) {
                        setState(() {
                          selectedCurrencyUSDT = value!;
                        });
                      }),
                      const SizedBox(
                          width: 12), // Khoảng cách nhỏ giữa các dropdown
                      _buildDropdown(
                          selectedAmount, ['Số lượng', '1-10', '10-100'],
                          (value) {
                        setState(() {
                          selectedAmount = value!;
                        });
                      }),
                      const SizedBox(width: 12),
                      _buildDropdown(
                          selectedPayment, ['Thanh toán', 'Bank', 'Momo'],
                          (value) {
                        setState(() {
                          selectedPayment = value!;
                        });
                      }),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          // Xử lý khi bấm vào icon filter
                        },
                      ),
                    ],
                  )
                ]),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              // Tab Mua
              ListView(
                padding: const EdgeInsets.all(16.0),
                children: const [
                  TradingItem(
                    sellerName: 'BigNose_Team',
                    orders: '15127 Lệnh (100.00%)',
                    rating: '98.84%',
                    price: '26,044',
                    available: '150,000 - 200,000 VND',
                    limit: '743.32 USDT',
                    transferTime: 'Agribank',
                  ),
                  TradingItem(
                    sellerName: 'VnExpress_247',
                    orders: '1561 Lệnh (100.00%)',
                    rating: '94.95%',
                    price: '26,050',
                    available: '20,000 - 450,000 VND',
                    limit: '35,281.00 USDT',
                    transferTime: 'Ngân hàng quân đội',
                  ),
                ],
              ),
              // Tab Bán
              const Center(child: Text('Tab Bán - Chưa có dữ liệu')),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(
      String value, List<String> items, ValueChanged<String?> onChanged) {
    return DropdownButton<String>(
      value: value,
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}

class TradingItem extends StatelessWidget {
  final String sellerName;
  final String orders;
  final String rating;
  final String price;
  final String available;
  final String limit;
  final String transferTime;

  const TradingItem({
    super.key,
    required this.sellerName,
    required this.orders,
    required this.rating,
    required this.price,
    required this.available,
    required this.limit,
    required this.transferTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.blue.shade100,
                        child: Text(
                          sellerName[0],
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        sellerName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Giao dịch: $orders',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '👍 $rating',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'đ $price',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'USDT',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Giới hạn $available',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Có sẵn $limit',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 120,
              child: Column(
                children: [
                  Text(
                    'Chuyển khoản ngân hàng $transferTime',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 16,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '15 phút',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis, // Ngăn tràn văn bản
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                      ),
                      child: const Text(
                        'Mua',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
}
