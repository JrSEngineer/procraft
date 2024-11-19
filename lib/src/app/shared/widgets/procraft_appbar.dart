import 'package:flutter/material.dart';
import 'package:procraft/src/app/modules/home/entities/procraft_user.dart';

class ProcraftAppBar extends PreferredSize {
  ProcraftAppBar({super.key, required this.user, required this.width, required this.height}) : super(preferredSize: Size(width, height), child: const Placeholder());

  final ProcraftUser user;

  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    final profileImageSize = MediaQuery.sizeOf(context).height * 0.042;
    final verticalAppBarPadding = MediaQuery.sizeOf(context).height * 0.036;
    final horizontalAppBarPadding = MediaQuery.sizeOf(context).height * 0.028;
    final notificationsContainerSize = MediaQuery.sizeOf(context).height * 0.054;
    final notificationsIconSize = MediaQuery.sizeOf(context).height * 0.032;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalAppBarPadding,
        horizontal: horizontalAppBarPadding,
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: profileImageSize,
              width: profileImageSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: NetworkImage(
                    user.profileImage,
                  ),
                ),
              ),
            ),
            Text(
              user.fullName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Container(
              height: notificationsContainerSize,
              width: notificationsContainerSize,
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Positioned(
                    top: 4,
                    left: 12,
                    child: Icon(
                      Icons.notifications_none,
                      size: notificationsIconSize,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                      ),
                      child: const Center(
                        child: Text(
                          "6",
                          style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
