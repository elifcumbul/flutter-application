//haber model sınıfı
class Events {
  late String title;
  late String description;
  late String date;
  late String imageURL;
  late String newsURL;
  late String source;

  Events(this.title, this.description, this.date, this.imageURL, this.newsURL, this.source);

  factory Events.fromJson(Map<String, dynamic> jsonData) {
    return Events(
      jsonData['title'],
      jsonData['description'],
      jsonData['date'],
      jsonData['imageURL'],
      jsonData['newsURL'],
      jsonData['source'],
    );
  }

  static Map<String, dynamic> toMap(Events events) => {
        'title': events.title,
        'description': events.description,
        'date': events.date,
        'imageURL': events.imageURL,
        'newsURL': events.newsURL,
        'source': events.source,
      };
/*
//encode - decode işlemlerini elimizdeki favoriteNews listesini dönüştürerek shared preferences ile lokale kaydetmek için kullanıyoruz.

  static String encode(List<News> news) => json.encode(
        news.map<Map<String, dynamic>>((news2) => News.toMap(news2)).toList(),
      );
//Favorileri kaydetmek için farklı yollar da izlenebilir.

  static List<News> decode(String news) =>
      (json.decode(news) as List<dynamic>).map<News>((item) => News.fromJson(item)).toList();
*/
}