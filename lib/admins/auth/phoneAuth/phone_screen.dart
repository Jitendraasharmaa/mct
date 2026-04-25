// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:mct_prayer_book/admins/auth/phoneAuth/otp_screen.dart';
//
// class PhoneScreen extends StatefulWidget {
//   const PhoneScreen({super.key});
//
//   @override
//   State<PhoneScreen> createState() => _PhoneScreenState();
// }
//
// class _PhoneScreenState extends State<PhoneScreen> {
//   final TextEditingController phoneController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   bool isLoading = false;
//
//   Future<void> sendOTP() async {
//     setState(() => isLoading = true);
//
//     await _auth.verifyPhoneNumber(
//       phoneNumber: phoneController.text.trim(),
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await _auth.signInWithCredential(credential);
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         setState(() => isLoading = false);
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text(e.message ?? "Error")));
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         setState(() => isLoading = false);
//
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) => OTPScreen(verificationId: verificationId),
//           ),
//         );
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {},
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Phone Login")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             const SizedBox(height: 40),
//             TextField(
//               controller: phoneController,
//               keyboardType: TextInputType.phone,
//               decoration: const InputDecoration(
//                 labelText: "Enter Phone Number",
//                 hintText: "+91XXXXXXXXXX",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: isLoading ? null : sendOTP,
//               child: isLoading
//                   ? const CircularProgressIndicator(color: Colors.white)
//                   : const Text("Send OTP"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
