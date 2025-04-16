import 'package:app_taichinh/screens/FooterScreens/ThiTruong/danhSachYeuThich.dart';
import 'package:app_taichinh/utils/Widget/BieudoDuLieu/ThongTinGiaoDich.dart';
import 'package:flutter/material.dart';

class BieuDoDuLieu extends StatefulWidget {
  const BieuDoDuLieu({super.key});

  @override
  State<BieuDoDuLieu> createState() => _BieuDoDuLieuState();
}

class _BieuDoDuLieuState extends State<BieuDoDuLieu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0.5,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DanhSachYeuThich()),
                  );
                },
              ),
              title: const Row(
                children: [
                  Text(
                    'AVAX/USDT',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down, color: Colors.black),
                ],
              ),
              actions: const [
                Icon(Icons.star_border, color: Colors.grey),
                SizedBox(width: 12),
                Icon(Icons.share, color: Colors.black),
                SizedBox(width: 12),
                Icon(Icons.grid_view, color: Colors.black),
                SizedBox(width: 8),
              ],
              bottom: const TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                indicatorColor: Colors.black,
                tabs: [
                  Tab(text: 'Giá'),
                  Tab(text: 'Thông tin'),
                  Tab(text: 'Dữ liệu Giao dịch'),
                  Tab(text: 'Square'),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                BinanceChartClone(),
                Center(child: Text('Thông tin content')),
                Center(child: Text('Dữ liệu Giao dịch content')),
                Center(child: Text('Square content')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
