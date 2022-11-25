import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String mainInfo;
  final String linkInfo;
  final String type;
  final IconData? socialmediaIcon;
  const InfoRow(
      {Key? key,
      required this.mainInfo,
      required this.linkInfo,
      required this.type,
      this.socialmediaIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          type == "social"
              ? Row(
                  children: [
                    Icon(socialmediaIcon),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(mainInfo,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 17, color: Colors.black))
                  ],
                )
              : Text(mainInfo,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 17, color: Colors.black)),
          const SizedBox(
            width: 13,
          ),
          Text(linkInfo,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 17, color: Colors.grey))
        ],
      ),
    );
  }
}
