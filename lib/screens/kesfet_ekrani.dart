import 'package:flutter/material.dart';
import '../data/urun_verileri.dart';
import '../models/urun_model.dart';
import '../widgets/urun_karti.dart';

class KesfetEkrani extends StatefulWidget {
  final List<Urun> sepet;
  final Function(Urun) sepeteEkle;
  final Function(Urun) sepettenCikar;

  const KesfetEkrani({
    super.key,
    required this.sepet,
    required this.sepeteEkle,
    required this.sepettenCikar,
  });

  @override
  State<KesfetEkrani> createState() => _KesfetEkraniState();
}

class _KesfetEkraniState extends State<KesfetEkrani> {
  String aramaMetni = '';

  @override
  Widget build(BuildContext context) {
    final List<Urun> filtrelenenUrunler = katalogUrunleri.where((urun) {
      return urun.ad.toLowerCase().contains(aramaMetni.toLowerCase()) ||
          urun.altBaslik.toLowerCase().contains(aramaMetni.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F2EA),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Keşfet',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3E2723),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Kendine en uygun kahve deneyimini yaşat.',
                              style: TextStyle(
                                fontSize: 13.5,
                                color: Color(0xFF795548),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFEDE4D7),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.shopping_bag_outlined,
                                color: Color(0xFF3E2723),
                                size: 24,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/sepet');
                              },
                            ),
                          ),
                          if (widget.sepet.isNotEmpty)
                            Positioned(
                              right: -4,
                              top: -4,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF6F4E37),
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  '${widget.sepet.length}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Arama Çubuğu
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDE4D7),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextField(
                      onChanged: (deger) {
                        setState(() {
                          aramaMetni = deger;
                        });
                      },
                      style: const TextStyle(color: Color(0xFF3E2723)),
                      decoration: const InputDecoration(
                        hintText: 'Ürün veya ekipman ara...',
                        hintStyle: TextStyle(color: Color(0xFF8D6E63), fontSize: 14),
                        prefixIcon: Icon(Icons.search, color: Color(0xFF6F4E37)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 13),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Kahve Temalı Özel Kampanya Banner'ı
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF4E342E), // Koyu kavrulmuş kahve
                          Color(0xFF6F4E37), // Sıcak orta kahve
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF3E2723).withOpacity(0.15),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEDE4D7).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Text(
                                  'HAFTANIN SEÇKİSİ',
                                  style: TextStyle(
                                    color: Color(0xFFF7F2EA),
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.8,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                'Nitelikli Kahve & Ekipmanlar',
                                style: TextStyle(
                                  color: Color(0xFFFDFBF7),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 2),
                              const Text(
                                'Taze kavrulmuş çekirdeklerle demleme keyfi',
                                style: TextStyle(
                                  color: Color(0xFFE6D9C6),
                                  fontSize: 11.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF7F2EA).withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.coffee_maker_outlined,
                            color: Color(0xFFFDFBF7),
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // 2 Sütunlu Ürün Grid Listesi
                  Expanded(
                    child: filtrelenenUrunler.isEmpty
                        ? const Center(
                            child: Text(
                              'Aradığınız kriterde ürün bulunamadı.',
                              style: TextStyle(color: Color(0xFF795548), fontSize: 15),
                            ),
                          )
                        : GridView.builder(
                            padding: const EdgeInsets.only(bottom: 16),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 0.76,
                            ),
                            itemCount: filtrelenenUrunler.length,
                            itemBuilder: (context, index) {
                              final urun = filtrelenenUrunler[index];
                              return UrunKarti(
                                urun: urun,
                                onTiklandi: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/detay',
                                    arguments: urun,
                                  );
                                },
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}