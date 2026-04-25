// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class OTPScreen extends StatefulWidget {
//   final String verificationId;
//
//   const OTPScreen({super.key, required this.verificationId});
//
//   @override
//   State<OTPScreen> createState() => _OTPScreenState();
// }
//
// class _OTPScreenState extends State<OTPScreen> {
//   final TextEditingController otpController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   bool isLoading = false;
//
//   Future<void> verifyOTP() async {
//     setState(() => isLoading = true);
//
//     try {
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: widget.verificationId,
//         smsCode: otpController.text.trim(),
//       );
//
//       await _auth.signInWithCredential(credential);
//
//       setState(() => isLoading = false);
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Login Successful")),
//       );
//
//       // Navigate to Home Screen
//       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
//
//     } catch (e) {
//       setState(() => isLoading = false);
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Invalid OTP")),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Verify OTP")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             const SizedBox(height: 40),
//             TextField(
//               controller: otpController,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 labelText: "Enter OTP",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: isLoading ? null : verifyOTP,
//               child: isLoading
//                   ? const CircularProgressIndicator(color: Colors.white)
//                   : const Text("Verify OTP"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
