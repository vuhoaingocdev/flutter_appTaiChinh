import 'package:app_taichinh/screens/Home/home.dart';
import 'package:flutter/material.dart';

class EarnScreen extends StatefulWidget {
  const EarnScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EarnScreenState createState() => _EarnScreenState();
}

class _EarnScreenState extends State<EarnScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Sample data
  final List<Map<String, dynamic>> lowRiskProducts = [
    {'name': 'USDC', 'apr': '10,98%'},
    {'name': 'USDT', 'apr': '6,67%'},
    {'name': 'ETH', 'apr': '1,71%'},
    {'name': 'STRK', 'apr': '0,27%-29,9%'},
    {'name': 'BNB', 'apr': '0,19%-0,5%'},
    {'name': 'BTC', 'apr': '0,27%'},
  ];

  final List<Map<String, dynamic>> highYieldProducts = [
    {'name': 'Product A', 'apr': '15%'},
    {'name': 'Product B', 'apr': '20%'},
    {'name': 'Product C', 'apr': '25%'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            },
          ),
          title: const Text(
            'Earn',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.qr_code),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Tìm kiếm
              TextField(
                decoration: InputDecoration(
                  hintText: 'Tìm',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 241, 235, 235),
                ),
              ),
              const SizedBox(height: 20),
              // Tự động đăng ký
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Tự động đăng ký',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Text('Nhấn để bắt đầu tìm kiếm tự động',
                                style: TextStyle(fontSize: 13)),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            foregroundColor: Colors.black,
                          ),
                          child: const Text('Kích hoạt'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //3 thẻ card
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                    width: 115,
                    height: 115,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Row(
                            children: [
                              const Text(
                                'USDT',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Image.asset('assets/images/ustd.png',
                                  width: 20, height: 20),
                            ],
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Padding(
                          padding: EdgeInsets.only(left: 2),
                          child: Text(
                            '30 ngày; 12 giờ',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Padding(
                          padding: EdgeInsets.only(left: 2),
                          child: Text(
                            '15%',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Padding(
                          padding: EdgeInsets.only(left: 2),
                          child: Text(
                            'APR',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    )),
                Container(
                    width: 115,
                    height: 115,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Row(
                            children: [
                              const Text(
                                'BNB',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Image.asset('assets/images/binance.png',
                                  width: 20, height: 20),
                            ],
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Padding(
                          padding: EdgeInsets.only(left: 2),
                          child: Text(
                            '30 ngày; 12 giờ',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Padding(
                          padding: EdgeInsets.only(left: 2),
                          child: Text(
                            '15%',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Padding(
                          padding: EdgeInsets.only(left: 2),
                          child: Text(
                            'APR',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    )),
                Container(
                    width: 115,
                    height: 115,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Row(
                            children: [
                              const Text(
                                'BTC',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Image.asset('assets/images/bitcoin.png',
                                  width: 20, height: 20),
                            ],
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Padding(
                          padding: EdgeInsets.only(left: 2),
                          child: Text(
                            '30 ngày; 12 giờ',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Padding(
                          padding: EdgeInsets.only(left: 2),
                          child: Text(
                            '15%',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Padding(
                          padding: EdgeInsets.only(left: 2),
                          child: Text(
                            'APR',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ))
              ]),

              // TabBar
              const SizedBox(height: 5),
              TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                unselectedLabelStyle: const TextStyle(fontSize: 15),
                tabs: const [
                  Tab(text: 'Rủi ro thấp'),
                  Tab(text: 'Lợi suất cao'),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Tab 1: Rủi ro thấp
                    _buildProductList(lowRiskProducts),
                    // Tab 2: Lợi suất cao
                    _buildProductList(highYieldProducts),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductList(List<Map<String, dynamic>> products) {
    return Column(
      children: [
        // Tiêu đề 3 cột: Tên sản phẩm, APR, Nút
        const Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                'Sản phẩm',
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                'APR ước tính',
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Danh sách sản phẩm
        Expanded(
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return _buildProductItem(
                products[index]['name'],
                products[index]['apr'],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductItem(String name, String apr) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Cột Tên sản phẩm
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  CircleAvatar(
                    child: Text(name[0]),
                  ),
                  const SizedBox(width: 10),
                  Text(name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            // Cột APR
            Expanded(
              flex: 2,
              child: Text(
                apr,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),

            // Cột Nút Đăng ký
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
              ),
              child: const Text('Đăng ký'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
