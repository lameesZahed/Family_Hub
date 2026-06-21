import 'package:flutter/material.dart';
import '../../Models/Location/location_model.dart';

class FamilyCards extends StatelessWidget {
  final FamilyLocationModel member;
  const FamilyCards({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    // final bool hasValidAvatar = (member.avatarUrl ?? '').isNotEmpty &&
    //     member.avatarUrl!.startsWith('http') &&
    //     !member.avatarUrl!.contains('data/user/');

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFAF3EC),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE8D8C8), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     border: Border.all(color: const Color(0xFF6BBFB5), width: 3),
          //   ),
          //   child: CircleAvatar(
          //     radius: 32,
          //     backgroundImage: hasValidAvatar
          //         ? NetworkImage(member.avatarUrl!)
          //         : const AssetImage("assets/Images/Placeholder Circle.png") as ImageProvider,
          //   ),
          // ),
          // const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member.name,
                  style: const TextStyle(
                    color: Color(0xFF9B4747),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  member.timeLabel,
                  style: const TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}