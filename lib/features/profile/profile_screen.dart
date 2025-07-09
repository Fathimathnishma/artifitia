import 'package:artifitia/general/core/widget/ctextform.dart';
import 'package:flutter/material.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({Key? key}) : super(key: key);
  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final pinCtrl = TextEditingController();
  final addrCtrl = TextEditingController();
  final cityCtrl = TextEditingController();
  final stateCtrl = TextEditingController();
  final countryCtrl = TextEditingController();
  final acctCtrl = TextEditingController();
  final holderCtrl = TextEditingController();
  final ifscCtrl = TextEditingController();

  OutlineInputBorder outlineBorder() => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
  );

  InputDecoration fieldDecoration({String? hint}) => InputDecoration(
    hintText: hint,
    hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
    filled: true,
    fillColor: Colors.white,
    border: outlineBorder(),
    enabledBorder: outlineBorder(),
    focusedBorder: outlineBorder().copyWith(
      borderSide: const BorderSide(color: Colors.grey),
    ),
  );

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(fontSize: 14, color: Colors.grey);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
        leading: BackButton(onPressed: () => Navigator.pop(context)),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 58,
                    backgroundColor: Color(0xFFCCCCCC),
                    child: Icon(Icons.person, size: 58, color: Colors.white),
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.blue,
                        child: const Icon(
                          Icons.edit,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            sectionHeader('Personal Details'),
            const SizedBox(height: 12),

            Text('Email Address', style: titleStyle),
            const SizedBox(height: 6),
            CTextField(
              filled: false,
              controller: emailCtrl,
              label: 'Enter your email',
            ),
            const SizedBox(height: 12),

            Text('Password', style: titleStyle),
            const SizedBox(height: 6),
            TextField(
              cursorColor: Colors.black,
              controller: passCtrl,
              obscureText: true,
              decoration: fieldDecoration(hint: 'Enter your password'),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Change Password',
                  style: TextStyle(
                    color: Colors.red,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red,
                  ),
                ),
              ),
            ),

            const Divider(height: 32),

            sectionHeader('Business Address Details'),
            const SizedBox(height: 12),

            Text('Pincode', style: titleStyle),
            const SizedBox(height: 6),
            TextField(
              cursorColor: Colors.black,
              controller: pinCtrl,
              decoration: fieldDecoration(hint: 'Enter your pincode'),
            ),
            const SizedBox(height: 12),

            Text('Address', style: titleStyle),
            const SizedBox(height: 6),
            TextField(
              cursorColor: Colors.black,
              controller: addrCtrl,
              decoration: fieldDecoration(hint: 'Enter your address'),
            ),
            const SizedBox(height: 12),

            Text('City', style: titleStyle),
            const SizedBox(height: 6),
            TextField(
              cursorColor: Colors.black,
              controller: cityCtrl,
              decoration: fieldDecoration(hint: 'Enter your city'),
            ),
            const SizedBox(height: 12),

            Text('State', style: titleStyle),
            const SizedBox(height: 6),
            TextField(
              cursorColor: Colors.black,
              controller: stateCtrl,
              decoration: fieldDecoration(hint: 'Enter your state'),
            ),
            const SizedBox(height: 12),

            Text('Country', style: titleStyle),
            const SizedBox(height: 6),
            TextField(
              cursorColor: Colors.black,
              controller: countryCtrl,
              decoration: fieldDecoration(hint: 'Enter your country'),
            ),
            const SizedBox(height: 32),

            sectionHeader('Bank Account Details'),
            const SizedBox(height: 12),

            Text('Bank Account Number', style: titleStyle),
            const SizedBox(height: 6),
            TextField(
              cursorColor: Colors.black,
              controller: acctCtrl,
              decoration: fieldDecoration(hint: 'Enter your account Number'),
            ),
            const SizedBox(height: 12),

            Text("Account Holder's Name", style: titleStyle),
            const SizedBox(height: 6),
            TextField(
              cursorColor: Colors.black,
              controller: holderCtrl,
              decoration: fieldDecoration(
                hint: "Enter your Account holder's name",
              ),
            ),
            const SizedBox(height: 12),

            Text('IFSC Code', style: titleStyle),
            const SizedBox(height: 6),
            TextField(
              cursorColor: Colors.black,
              controller: ifscCtrl,
              decoration: fieldDecoration(hint: 'Enter your IFSC Code'),
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionHeader(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}
