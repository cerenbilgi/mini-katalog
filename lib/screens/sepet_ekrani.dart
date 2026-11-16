import 'package:flutter/material.dart';
import '../models/urun_model.dart';

class SepetEkrani extends StatelessWidget {
  final List<Urun> sepet;
  final Function(Urun) sepettenCikar;
  final VoidCallback sepetiTemizle;

  const SepetEkrani({
    super.key,
    required this.sepet,
    required this.sepettenCikar,
    required this.sepetiTemizle,
  });

  double get toplamTutar {
    return sepet.fold(0, (toplam, urun) => toplam + urun.fiyat);
  }

  @override
  Widget build(BuildContext context) {
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
          'Sepetim',
          style: TextStyle(
            color: Color(0xFF3E2723),
            fontSize: 20,
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
                child: sepet.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: 64,
                              color: Color(0xFFBCAAA4),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Sepetiniz şu an boş',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4E342E),
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Alışverişe başlamak için ürün ekleyin',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF8D6E63),
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.all(18),
                        itemCount: sepet.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final urun = sepet[index];
                          return Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFDFBF7),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: const Color(0xFFE6DDD0)),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    urun.resimUrl,
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) => Container(
                                      width: 60,
                                      height: 60,
                                      color: const Color(0xFFEDE4D7),
                                      child: const Icon(Icons.coffee, color: Color(0xFF6F4E37)),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        urun.ad,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF3E2723),
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        urun.altBaslik,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF8D6E63),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '₺${urun.fiyat.toStringAsFixed(0)}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF6F4E37),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => sepettenCikar(urun),
                                  icon: const Icon(
                                    Icons.remove_circle_outline,
                                    color: Color(0xFF8D6E63),
                                  ),
                                  tooltip: 'Sepetten Çıkar',
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: const BoxDecoration(
                  color: Color(0xFFFDFBF7),
                  border: Border(top: BorderSide(color: Color(0xFFE6DDD0))),
                ),
                child: Column(
                  children: [
                    if (sepet.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Toplam Tutar',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF5D4037),
                              ),
                            ),
                            Text(
                              '₺${toplamTutar.toStringAsFixed(0)}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3E2723),
                              ),
                            ),
                          ],
                        ),
                      ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3ECE1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.info_outline, size: 18, color: Color(0xFF795548)),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Tüm kahve çekirdekleri siparişiniz üzerine taze kavrulur.',
                              style: TextStyle(fontSize: 12, color: Color(0xFF5D4037)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3E2723),
                          foregroundColor: const Color(0xFFFDFBF7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: sepet.isEmpty
                            ? null
                            : () {
                                sepetiTemizle();
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    backgroundColor: const Color(0xFFFDFBF7),
                                    title: const Text(
                                      'Sipariş Alındı',
                                      style: TextStyle(color: Color(0xFF3E2723)),
                                    ),
                                    content: const Text(
                                      'Kahve siparişiniz başarıyla oluşturuldu. Afiyet olsun!',
                                      style: TextStyle(color: Color(0xFF5D4037)),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Tamam',
                                          style: TextStyle(
                                            color: Color(0xFF6F4E37),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                        child: const Text(
                          'Siparişi Tamamla',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}