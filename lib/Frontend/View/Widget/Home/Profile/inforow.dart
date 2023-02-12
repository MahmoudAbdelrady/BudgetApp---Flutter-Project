import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String mainInfo;
  final String linkInfo;
  final String type;
  const InfoRow({
    Key? key,
    required this.mainInfo,
    required this.linkInfo,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(mainInfo,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 17, color: Colors.black)),
          const SizedBox(
            width: 13,
          ),
          Text(linkInfo,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 17, color: Colors.grey))
        ],
      ),
    );
  }
}
