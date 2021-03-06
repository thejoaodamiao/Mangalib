import 'package:flutter/material.dart';

class NavigationItem {
  IconData iconData;

  NavigationItem(this.iconData);
}

List<NavigationItem> getNavegationItemList() {
  return <NavigationItem>[
    NavigationItem(Icons.home),
    NavigationItem(Icons.book),
    NavigationItem(Icons.local_library),
    NavigationItem(Icons.person)
  ];
}

class Book {
  String title;
  String description;
  Author author;
  String image;

  Book(this.title, this.description, this.author, this.image);
}

List<Book> getBookList() {
  return <Book>[
    Book(
        "One Piece",
        "One Piece conta a historia de luffy um jovem pirata que comeu a fruta do demonio gomu gomu e agora possui poderes elasticos",
        Author(
          "Eiichiro Oda",
          1,
          "assets/autores/oda.jpg",
        ),
        "assets/capas/one_piece.png"),
    Book(
        "Solo Levening",
        "Solo Levening conta a historia de um mundo onde dungeon apareceram no mundo real, agora existem o aventureiros que são pagos pra cuidar dos monstros da dungeon",
        Author(
          "Chu-Gong",
          1,
          "assets/autores/orange.jpg",
        ),
        "assets/capas/Solo_Leveling_Novel_cover.png"),
    Book(
        "jujutsu Kaisen",
        "Jujutsu Kaisen conta historia de itadori yuji um humano comum que acaba se tornando portador do demonio sukuna o rei das maldições",
        Author("Gege Akutami", 90, "assets/autores/orange.jpg"),
        "assets/capas/jujutsu_kaisen.png"),
    Book(
        "One Punch Man",
        "One Puch Man gira em torno de Saitama um homem tão forte que acaba as luta com só um soco, mas isso faz com que lutas sejam chatas pra ele",
        Author(
          "One, Yuusuke Murata",
          2,
          "assets/autores/orange.jpg",
        ),
        "assets/capas/OnePunchMan.png"),
    Book(
        "Naruto",
        "Naruto conta a historia de um ninja que busca ter o respeito de sua vila, se tornando hokage o mais alto rank ninja em sua vila",
        Author("Masashi Kishimoto", 77, "assets/autores/orange.jpg"),
        "assets/capas/naruto.jpg"),
    Book(
        "Shingeki no Kyojin",
        "Titãs existem nesse mundo, então a humanidade foi forçada a viver em muralhas",
        Author(
          "Hajime",
          108,
          "assets/autores/orange.jpg",
        ),
        "assets/capas/aot.png"),
    Book(
        "Re:Zero",
        "Subaru foi transportado para um mundo de fantasia, ele conhece Emilia e depois que tempo eles desobre que esse mundo pode não ser um conto de fadas",
        Author(
          "Tappey Naqatsuki",
          99,
          "assets/autores/orange.jpg",
        ),
        "assets/capas/rezero.jpg")
  ];
}

List<Author> getAuthorList() {
  return <Author>[
    Author(
      "Eiichiro Oda",
      1005,
      "assets/autores/orange.jpg",
    ),
    Author(
      "Chu-Gong",
      120,
      "assets/autores/orange.jpg",
    ),
    Author(
      "Yuusuke Murata",
      107,
      "assets/autores/orange.jpg",
    ),
    Author(
      "Hajime",
      138,
      "assets/autores/orange.jpg",
    ),
    Author(
      "Tappey Naqatsuki",
      99,
      "assets/autores/orange.jpg",
    ),
    Author(
      "Gege Akutami",
      112,
      "assets/autores/orange.jpg",
    ),
    Author(
      "Masashi Kishimoto",
      700,
      "assets/autores/orange.jpg",
    )
  ];
}

class Author {
  String fullname;
  int books;
  String image;

  Author(this.fullname, this.books, this.image);
}

class Filter {
  String name;

  Filter(this.name);
}

List<Filter> getFilter() {
  return <Filter>[
    Filter("CLASSÍCOS"),
    Filter("NOVOS"),
    Filter("EM BREVE"),
  ];
}
