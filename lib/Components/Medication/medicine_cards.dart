import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../Screens/Medical/Details/add_edit_medicine.dart';
import '../../Screens/Medical/Details/medicine.dart';
import '../../Server/Authentication/api_client.dart';

class MedicineCards extends StatelessWidget {
  final int id;
  final String image;
  final String name;
  final String description;
  final int quantity;
  final VoidCallback? onDelete;

  const MedicineCards({
    super.key,
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.quantity,
    this.onDelete,
  });



  @override
  Widget build(BuildContext context) {
    final hasImage = image.isNotEmpty;
    final String fullImageUrl = image.startsWith('http')
        ? image
        : '${ApiClient.baseUrl}$image';
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Medicine(
              id: id,
              image: image,
              name: name,
              description: description,
              quantity: quantity,
            ),
          ),
        );
      },
      child: Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          dragDismissible: true,
          dismissible: DismissiblePane(
            onDismissed: () {
              onDelete?.call();
            },
          ),
          children: [
            SlidableAction(
              icon: Icons.edit,
              label: "Edit",
              backgroundColor: Color(0xFF308983),
              flex: 2,
              borderRadius: BorderRadius.only(
              ),
              onPressed: (context) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddEditMedicine(
                      id: id,
                      image: image,
                      name: name,
                      description: description,
                      quantity: quantity,
                    ),
                  ),
                );
              },
            ),
            SlidableAction(
              icon: Icons.delete,
              label: "Delete",
              flex: 1,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              onPressed: (context) {
                onDelete?.call();
              },
            )
          ],
        ),
        key: ValueKey(id),
        child: Card(
          margin: const EdgeInsets.only(bottom: 8),
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                child:hasImage
        ? Image.network(
        fullImageUrl, // 👈 استخدمي المسار الكامل هنا
        height: 100,
        width: 100,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Image.asset(
            "assets/Images/Placeholder Circle.png",
            height: 100, width: 100, fit: BoxFit.cover),
      )
            : Image.asset("assets/Images/Placeholder Circle.png",
        height: 100, width: 100, fit: BoxFit.cover),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(name, style: TextStyle(
                        color: Color(0xFF9B4747), fontSize: 16, fontWeight: FontWeight.normal)),
                    SizedBox(height: 8),
                    Text(description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: Color(0xFF6E5C52).withOpacity(0.5),
                            fontSize: 8,
                            fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}