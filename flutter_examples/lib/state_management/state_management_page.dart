import 'package:flutter/material.dart';

class StateManagementPage extends StatefulWidget {
  const StateManagementPage({super.key});

  @override
  State<StateManagementPage> createState() => _StateManagementPageState();
}

class _StateManagementPageState extends State<StateManagementPage> {
  int pageIndex = 0;
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
            itemCount: colors.length,
            onPageChanged: (value) {
              setState(() {
                pageIndex = value;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                color: colors[index],
              );
            },
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                colors.length,
                (index) => Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: pageIndex == index ? Colors.grey : Colors.white,
                        border: Border.all(),
                        shape: BoxShape.circle,
                      ),
                    )),
          ),
        ),
      ],
    );
  }
}
