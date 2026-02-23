import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test1/features/home/presentation/widgets/appbar_card.dart';
import 'package:test1/features/landing/presentation/controllers/landing_controller_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    Future.microtask(() {
      final token = ref.read(landingControllerProvider).token;
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(token.isEmpty ? "dfdskfj" : token, style: TextStyle(color: Colors.white)),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leading: Icon(Icons.menu, color: Colors.white),
        title: Text("Let's Ride", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [ Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(radius: 18, backgroundColor: Colors.grey),
        )],
        bottom: AppbarCard(),
      ),
      body: Column(
        children: [
          // Container(
          //   color: Colors.black,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Column(
          //       children: [
          //         Row(
          //           mainAxisAlignment: .spaceBetween,
          //           children: [
          //             IconButton(
          //               onPressed: () {},
          //               icon: Icon(Icons.menu, color: Colors.white),
          //             ),
          //             Text(
          //               "Let's Ride",
          //               style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          //             ),
          //             CircleAvatar(radius: 12, backgroundColor: Colors.grey),
          //           ],
          //         ),
          //         CardWidget(),
          //         Container(width: double.infinity, color: Colors.grey),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
