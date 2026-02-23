import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                    
                    width: double.infinity,
                    child: Row(
                      children: [
                        Column(children: [PickUpWidget(leading: 'A', subTitle: "Pickup",title: "150 Street New York, USA",), PickUpWidget(leading: 'B', subTitle: "Drop Off",title: "30 Street Boston, USA",)]),
                        Icon(Icons.swap_vert, color: Colors.grey),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PickUpWidget extends StatelessWidget {
  const PickUpWidget({
    super.key,
    required this.leading,
    required this.subTitle,
    required this.title,
  });
  final String leading;
  final String subTitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.grey,
            child: Text(leading, style: TextStyle(color: Colors.white)),
          ),
          Column(
            children: [
              Text(subTitle, style: TextStyle(color: Colors.grey)),
              Text(
                title,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
