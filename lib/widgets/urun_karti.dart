import 'package:flutter/material.dart';
import '../models/urun_model.dart';

class UrunKarti extends StatelessWidget {
  final Urun urun;
  final VoidCallback onTiklandi;

  const UrunKarti({
    super.key,
    required this.urun,
    required this.onTiklandi,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTiklandi,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFDFBF7),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE6DDD0), width: 1),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF4A2C2A).withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: Container(
                  width: double.infinity,
                  color: const Color(0xFFF3ECE1),
                  child: Image.asset(
                    urun.resimUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.coffee_rounded,
                          size: 48,
                          color: Color(0xFF6F4E37),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    urun.ad,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3E2723),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    urun.altBaslik,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF8D6E63),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '₺${urun.fiyat.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF6F4E37),
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