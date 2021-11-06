import 'package:demo_mc/utils/app_constants.dart';
import 'package:flutter/material.dart';

class CustomAvtWithInfo extends StatefulWidget {
  const CustomAvtWithInfo({Key? key}) : super(key: key);

  @override
  _CustomAvtWithInfoState createState() => _CustomAvtWithInfoState();
}

class _CustomAvtWithInfoState extends State<CustomAvtWithInfo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                KeyDemo.avt,
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pawel Czerwinski",
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Text("Pawel Czerwinski"),
          ],
        ),
      ],
    );
  }
}
