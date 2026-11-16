class Urun {
  final int id;
  final String ad;
  final String altBaslik;
  final double fiyat;
  final String resimUrl;
  final String aciklama;
  final Map<String, String> ozellikler;

  Urun({
    required this.id,
    required this.ad,
    required this.altBaslik,
    required this.fiyat,
    required this.resimUrl,
    required this.aciklama,
    required this.ozellikler,
  });

  factory Urun.fromJson(Map<String, dynamic> json) {
    return Urun(
      id: json['id'],
      ad: json['name'],
      altBaslik: json['subtitle'] ?? '',
      fiyat: (json['price'] as num).toDouble(),
      resimUrl: json['image'],
      aciklama: json['description'] ?? '',
      ozellikler: Map<String, String>.from(json['specs'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': ad,
      'subtitle': altBaslik,
      'price': fiyat,
      'image': resimUrl,
      'description': aciklama,
      'specs': ozellikler,
    };
  }
}