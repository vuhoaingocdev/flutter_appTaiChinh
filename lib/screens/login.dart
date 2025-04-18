import 'package:app_taichinh/screens/EntityNameScreen.dart';
import 'package:app_taichinh/screens/Home/home.dart';
import 'package:app_taichinh/screens/changeLanguage.dart';
import 'package:app_taichinh/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() {
    return HandleDangNhap();
  }
}

class HandleDangNhap extends State<Login> {
  late TextEditingController emailController;
  late TextEditingController passController;

  @override
  void initState() {
    super.initState();
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    emailController = TextEditingController(text: loginProvider.email);
    passController = TextEditingController(text: loginProvider.password);

    emailController.addListener(() {
      loginProvider.updateEmail(emailController.text);
    });

    passController.addListener(() {
      loginProvider.updatePassword(passController.text);
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //nút chuyển ngôn ngữ
            const SizedBox(height: 50),
            const ChangeLanguage(),
            const SizedBox(height: 20),
            Text(
              appLocalizations.chaoMungDenVoiBinance,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(appLocalizations.email_sdt,
                style: TextStyle(fontSize: 16, color: Colors.grey[700])),
            //email
            const SizedBox(height: 5),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: appLocalizations.validateEmail,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                suffixIcon: emailController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear_outlined),
                        onPressed: () {
                          loginProvider.clearEmail();
                          emailController.clear();
                        },
                      )
                    : null,
              ),
            ),
            //password
            const SizedBox(height: 10),
            TextField(
              controller: passController,
              obscureText: !loginProvider.isPasswordVisible,
              decoration: InputDecoration(
                hintText: appLocalizations.password,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                suffixIcon: IconButton(
                  icon: Icon(
                    loginProvider.isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: loginProvider.togglePasswordVisibility,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: loginProvider.isChecked,
                  activeColor: Colors.black,
                  onChanged: (value) =>
                      loginProvider.toggleCheckbox(value ?? false),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                      children: [
                        TextSpan(text: appLocalizations.note1),
                        TextSpan(
                          text: appLocalizations.note2,
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(text: appLocalizations.noteAnd),
                        TextSpan(
                          text: appLocalizations.note3,
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(text: appLocalizations.note4),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
              child: Text(appLocalizations.next,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Divider(color: Colors.grey[400], thickness: 1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(appLocalizations.or,
                      style: const TextStyle(fontSize: 16)),
                ),
                Expanded(
                  child: Divider(color: Colors.grey[400], thickness: 1),
                ),
              ],
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                side: const BorderSide(color: Colors.grey),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Image.asset('assets/images/google.png', height: 20),
                  Expanded(
                    child: Text(
                      appLocalizations.continueWithGoogle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                side: const BorderSide(color: Colors.grey),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Image.asset('assets/images/telegram.png', height: 20),
                  Expanded(
                    child: Text(
                      appLocalizations.continueWithTelegram,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  children: [
                    TextSpan(
                      text: appLocalizations.registerAsALegalEntity,
                      style: const TextStyle(color: Colors.orange),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const entitynamescreen()),
                          );
                        },
                    ),
                    TextSpan(text: appLocalizations.or),
                    TextSpan(
                      text: appLocalizations.logIn,
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Đăng nhập được nhấn');
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
