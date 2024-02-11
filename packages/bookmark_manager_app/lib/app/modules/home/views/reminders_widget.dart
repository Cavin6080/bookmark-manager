import 'package:bookmark_manager/app/utils/extensions.dart';
import 'package:flutter/material.dart';

class RemindersWidget extends StatelessWidget {
  const RemindersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Reminders',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const Spacer(),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.notifications_active_outlined),
                  color: Colors.black,
                  onPressed: () {},
                ),
              ),
              12.w,
            ],
          ),
          20.h,
        ],
      ),
    );
  }
}
