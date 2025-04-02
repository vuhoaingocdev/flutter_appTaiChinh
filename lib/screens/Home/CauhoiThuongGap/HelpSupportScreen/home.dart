import 'package:app_taichinh/screens/Home/home.dart';
import 'package:flutter/material.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HelpSupportScreenState createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    )
                  }),
          title: const Center(
            child: Text(
              "Trợ giúp & Hỗ trợ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          centerTitle: false,
        ),
        body: ListView(
          children: [
            _buildListItem("Trung tâm Trợ giúp", context),
            _buildListItem("Phản hồi về hệ thống", context),
            _buildListItem("Phản hồi và đề xuất về sản phẩm", context),
            _buildListItem("Kiểm tra mạng", context),
          ],
        ),
      ),
    );
  }

  // Widget tạo danh sách mục
  Widget _buildListItem(String title, BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title,
              style: const TextStyle(fontSize: 16, color: Colors.black)),
          trailing: const Icon(Icons.chevron_right, color: Colors.black),
          onTap: () {},
        ),
        Divider(height: 1, color: Colors.grey[300]),
      ],
    );
  }
}
