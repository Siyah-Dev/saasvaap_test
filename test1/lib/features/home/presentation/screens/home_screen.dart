import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test1/features/home/presentation/widgets/pickup_widget.dart';
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
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(token)));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.menu, color: Colors.white),
                      ),
                      Text(
                        "Let's Ride",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      CircleAvatar(radius: 12, backgroundColor: Colors.grey),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.all(Radius.circular(6))),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Column(spacing: 10,crossAxisAlignment: .start, children: [PickUpWidget(leading: 'A', subTitle: "Pickup",title: "150 Street New York, USA",), PickUpWidget(leading: 'B', subTitle: "Drop Off",title: "30 Street Boston, USA",)]),
                        Icon(Icons.swap_vert, color: Colors.grey),
                      ],
                    ),
                  ),
                  Container(width: double.infinity,color: Colors.grey,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



