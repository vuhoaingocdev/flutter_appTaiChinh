import 'package:app_taichinh/screens/Home/home.dart';
import 'package:flutter/material.dart';

class Refer2EarnScreen extends StatefulWidget {
  const Refer2EarnScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Refer2EarnScreenState createState() => _Refer2EarnScreenState();
}

class _Refer2EarnScreenState extends State<Refer2EarnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Cùng Kiếm Tiền",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Dòng giới thiệu
            const Text(
              "Mời bạn bè để mở khóa 2.000 USDC/người!",
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Thanh cấp bậc
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildLevel("R1", "\$50", Colors.green),
                  _buildLevel("R2", "\$80", Colors.grey),
                  _buildLevel("R3", "\$120", Colors.grey),
                  _buildLevel("R4", "\$250", Colors.grey),
                  _buildLevel("R5", "\$500", Colors.grey),
                  _buildLevel("R6", "\$1,000", Colors.blue),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Vòng tròn phần trăm
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 180,
                  height: 180,
                  child: CircularProgressIndicator(
                    value: 0.9333, // 93.33%
                    strokeWidth: 10,
                    backgroundColor: Colors.grey[800],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.yellow),
                  ),
                ),
                const Column(
                  children: [
                    Text(
                      "93.33%",
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Bạn đã tích lũy",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    Text(
                      "\$46.6665",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // Nút Rút Tiền
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child: const Text("Rút",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),

            // Thông báo số dư
            const Text(
              "Người dùng đã nhận được 50 USDC dưới dạng token.",
              style: TextStyle(color: Colors.white70, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),

            // Thời gian còn lại
            const Text(
              "Thời gian còn lại của vòng này: 9 ngày 10 giờ 41 phút",
              style: TextStyle(color: Colors.white70, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Widget tạo từng cấp bậc
  Widget _buildLevel(String level, String amount, Color color) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 12,
          child: Text(level,
              style: const TextStyle(color: Colors.white, fontSize: 12)),
        ),
        const SizedBox(height: 4),
        Text(amount, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}
