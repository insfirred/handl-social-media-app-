import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomBarHandl extends ConsumerStatefulWidget {
  const BottomBarHandl({
    Key? key,
  }) : super(key: key);

  static final height = Platform.isIOS ? 80.0 : 60.0;

  @override
  ConsumerState<BottomBarHandl> createState() => _BottomBarHandlState();
}

class _BottomBarHandlState extends ConsumerState<BottomBarHandl> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 2),
              spreadRadius: 1,
              blurRadius: 8,
              color: Colors.black.withOpacity(0.08)),
        ],
      ),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: 7,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _NavigationBarItem(
                label: 'Home',
                isActive: context.tabsRouter.activeIndex == 0,
                onTap: () => context.tabsRouter.setActiveIndex(0),
              ),
              _NavigationBarItem(
                label: 'Chats',
                isActive: context.tabsRouter.activeIndex == 1,
                onTap: () => context.tabsRouter.setActiveIndex(1),
              ),
              _NavigationBarItem(
                label: 'Profile',
                isActive: context.tabsRouter.activeIndex == 2,
                onTap: () {
                  context.tabsRouter.setActiveIndex(2);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavigationBarItem({
    required this.label,
    required this.isActive,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = isActive
        ? const Color(0xFF113946)
        : const Color.fromARGB(255, 179, 179, 179);
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/${label.toLowerCase()}.png',
                color: color,
                height: 20,
                width: 20,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: GoogleFonts.dosis(
                  color: color,
                  fontSize: 12.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
