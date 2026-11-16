import '../models/urun_model.dart';

final List hamUrunJsonListesi = [
  {
    'id': 1,
    'name': 'Seramik V60 Dripper',
    'subtitle': 'Nitelikli filtre demleme.',
    'price': 680.0,
    'image': 'assets/images/v60.jpg',
    'description':
        'Isıyı uzun süre muhafaza eden özel seramik gövdesi ve spiral iç kanalları sayesinde kahvenin tüm aromatik notalarını fincana dengeli şekilde aktarır.',
    'specs': {
      'MALZEME': 'Seramik',
      'KAPASİTE': '1-4 Fincan',
      'FİLTRE': '02 Tipi',
    },
  },
  {
    'id': 2,
    'name': 'Kuğu Boyunlu Kettle',
    'subtitle': 'Hassas su akış kontrolü.',
    'price': 1450.0,
    'image': 'assets/images/kettle.jpg',
    'description':
        'İnce ve kavisli döküş ucu sayesinde demleme sırasında su akış hızını ve yönünü milimetrik olarak kontrol etmenizi sağlayan paslanmaz çelik ibrik.',
    'specs': {
      'HACİM': '800 ml',
      'GÖVDE': '304 Çelik',
      'KULP': 'Isı Yalıtımlı',
    },
  },
  {
    'id': 3,
    'name': 'El Kahve Değirmeni',
    'subtitle': 'Konik çelik dişli.',
    'price': 1890.0,
    'image': 'assets/images/degirmen.jpg',
    'description':
        'Kademeli öğütüm ayarı ile Türk kahvesinden French Press kalınlığına kadar her demleme yöntemine uygun homojen öğütüm sunar.',
    'specs': {
      'DİŞLİ': 'Paslanmaz Çelik',
      'HAZNE': '30 gr',
      'AYAR': '24 Kademe',
    },
  },
  {
    'id': 4,
    'name': 'Etiyopya Yirgacheffe',
    'subtitle': 'Çiçeksi ve narenciye notalı.',
    'price': 420.0,
    'image': 'assets/images/cekirdek.jpg',
    'description':
        '2000 metre rakımda yetişen yıkanmış Arabica çekirdekleri. Orta-hafif kavrum profili ile yasemin, bergamot ve limon çiçeği tatları sunar.',
    'specs': {
      'KAVRUM': 'Orta-Hafif',
      'İŞLEM': 'Yıkanmış',
      'GRAMAJ': '250 gr',
    },
  },
  {
    'id': 5,
    'name': 'Moka Pot Espresso',
    'subtitle': 'Klasik İtalyan demleme.',
    'price': 920.0,
    'image': 'assets/images/mokapot.jpg',
    'description':
        'Ocak üstünde kısa sürede yoğun gövdeli ve kremamsı espresso bazlı kahveler hazırlamanızı sağlayan sekizgen alüminyum gövdeli klasik tasarım.',
    'specs': {
      'KAPASİTE': '6 Fincan',
      'GÖVDE': 'Alüminyum',
      'OCAK': 'Gaz & Elektrik',
    },
  },
  {
    'id': 6,
    'name': 'Cam Chemex Sürahi',
    'subtitle': 'Berrak ve yumuşak içim.',
    'price': 1340.0,
    'image': 'assets/images/chemex.jpg',
    'description':
        'Isıya dayanıklı borosilikat cam gövdesi ve doğal ahşap tutacağı ile tortusuz, berrak ve aromatik filtre kahve demleme deneyimi.',
    'specs': {
      'HACİM': '600 ml',
      'CAM': 'Borosilikat',
      'TUTACAK': 'Doğal Ahşap',
    },
  },
];

final List<Urun> katalogUrunleri =
    hamUrunJsonListesi.map((json) => Urun.fromJson(json)).toList();