import 'package:flutter/material.dart';
import 'package:shopping/widgets/hot_offer_item.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String content;
  final String imagePath;

  const ProductCard({
    super.key,
    required this.title,
    required this.content,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  // Changed from fill to contain
                ),
              ),
            ),

            const SizedBox(height: 4),

            // Title with overflow handling
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontFamily: 'Suwannaphum',
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 2),

            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      content,
                      style: const TextStyle(fontSize: 10),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: IconButton(
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: const Text('Item added to the cart'),
                          duration: Duration(seconds: 3),
                          action: SnackBarAction(
                            label: 'Ok',
                            onPressed: () {
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      icon: const Icon(Icons.add_shopping_cart_outlined, size: 16),
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

class HotOfferData extends HotOfferItem{

  const HotOfferData({super.key, required super.desc, required super.imagePath});
}