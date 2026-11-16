import 'package:flutter/material.dart';
import '../models/urun_model.dart';

class UrunDetayEkrani extends StatelessWidget {
  final Function(Urun) sepeteEkle;

  const UrunDetayEkrani({
    super.key,
    required this.sepeteEkle,
  });

  @override
  Widget build(BuildContext context) {
    final Urun urun = ModalRoute.of(context)!.settings.arguments as Urun;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F2EA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F2EA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: Color(0xFF3E2723)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Ürün Detayı',
          style: TextStyle(
            color: Color(0xFF3E2723),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Center(
                        child: Container(
                          width: 220,
                          height: 220,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFDFBF7),
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(color: const Color(0xFFE6DDD0)),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF4A2C2A).withOpacity(0.08),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              urun.resimUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => const Center(
                                child: Icon(Icons.coffee, size: 64, color: Color(0xFF6F4E37)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  urun.ad,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF3E2723),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  urun.altBaslik,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF8D6E63),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '₺${urun.fiyat.toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6F4E37),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Açıklama',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3E2723),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        urun.aciklama,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          color: Color(0xFF5D4037),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Özellikler',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3E2723),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: urun.ozellikler.entries.map((ozellik) {
                          return Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFDFBF7),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: const Color(0xFFE0D5C5)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ozellik.key,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF8D6E63),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    ozellik.value,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF3E2723),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: const BoxDecoration(
                  color: Color(0xFFFDFBF7),
                  border: Border(top: BorderSide(color: Color(0xFFE6DDD0))),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4E342E),
                      foregroundColor: const Color(0xFFFDFBF7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      sepeteEkle(urun);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${urun.ad} sepete eklendi!'),
                          backgroundColor: const Color(0xFF6F4E37),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    icon: const Icon(Icons.add_shopping_cart),
                    label: const Text(
                      'Sepete Ekle',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}