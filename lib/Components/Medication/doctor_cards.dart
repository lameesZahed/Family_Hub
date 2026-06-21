import 'package:flutter/material.dart';

class DoctorCards extends StatelessWidget {
  final String name;
  final String type;
  final String rate;
  final String location;

  const DoctorCards({
    super.key,
    required this.name,
    required this.type,
    required this.rate,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 104,
            color: const Color(0xFF9B4747).withOpacity(0.1),
            child: const Icon(Icons.person, size: 48, color: Color(0xFF9B4747)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Color(0xFF9B4747),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(type, style: TextStyle(color: const Color(0xFF6E5C52).withOpacity(0.5), fontSize: 12)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Color(0xFF308983), size: 14),
                      const SizedBox(width: 4),
                      Text(rate, style: const TextStyle(color: Color(0xFF308983), fontSize: 12)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on_rounded, color: Color(0xFF6E5C52), size: 14),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          location,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(color: const Color(0xFF6E5C52).withOpacity(0.5), fontSize: 12),
                        ),
                      ),
                    ],
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