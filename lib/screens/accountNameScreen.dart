import 'package:app_taichinh/provider/accountNameScreen_provider.dart';
import 'package:app_taichinh/screens/EntityNameScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class accountNamescreen extends StatefulWidget {
  const accountNamescreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return HandleAccountNamescreen();
  }
}

class HandleAccountNamescreen extends State<accountNamescreen> {
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    final accountNamescreenProvider =
        Provider.of<AccountNameScreenProvider>(context, listen: false);

    emailController =
        TextEditingController(text: accountNamescreenProvider.email);

    emailController.addListener(() {
      accountNamescreenProvider.updateEmail(emailController.text);
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accountNamescreenProvider =
        Provider.of<AccountNameScreenProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const entitynamescreen()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Tạo tài khoản pháp nhân',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text('Email', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  suffixIcon: emailController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear_outlined),
                          onPressed: () {
                            accountNamescreenProvider.clearEmail();
                            emailController.clear();
                          },
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                      value: accountNamescreenProvider.isChecked,
                      activeColor: Colors.black,
                      onChanged: (value) => accountNamescreenProvider
                          .toggleCheckbox(value ?? false)),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 14, color: Colors.black),
                        children: [
                          TextSpan(
                              text:
                                  'Thông qua việc tạo một tài khoản, tôi đồng ý với '),
                          TextSpan(
                            text: 'Điều khoản dịch vụ',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                            ),
                          ),
                          TextSpan(text: ' và '),
                          TextSpan(
                            text: 'Chính sách quyền riêng tư',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                            ),
                          ),
                          TextSpan(text: ' của Binance.'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const entitynamescreen()),
                    );
                  },
                  child: const Text(
                    'Tiếp theo',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
