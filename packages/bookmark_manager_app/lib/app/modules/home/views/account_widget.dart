import 'package:bookmark_manager/app/utils/extensions.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({Key? key}) : super(key: key);

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
                  'Account',
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
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 2)),
                child: const ListTile(
                  leading: Icon(
                    Icons.person_2_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              8.h,
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 2)),
                child: const ListTile(
                  leading: Icon(
                    Icons.edit_note,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Terms of use',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              8.h,
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 2)),
                child: const ListTile(
                  leading: Icon(
                    Icons.security,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Privacy Policy',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
