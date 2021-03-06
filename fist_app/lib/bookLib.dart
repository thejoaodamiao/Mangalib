import 'package:fist_app/book_details.dart';
import 'package:fist_app/constants.dart';
import 'package:fist_app/data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//cria o ambiente de widget na interface
class BookLib extends StatefulWidget {
  @override
  _BookLibState createState() => _BookLibState();
}

//Classe dos widgets
class _BookLibState extends State<BookLib> {
  //listas usadas nos blocos de scroll
  List<Filter> filters = getFilter();
  Filter selectedFilter;

  List<Author> authors = getAuthorList();

  List<NavigationItem> navigationItems = getNavegationItemList();
  NavigationItem selectedItem;

  List<Book> books = getBookList();

  //inicializa as variaveis
  @override
  void initState() {
    super.initState();
    setState(() {
      selectedFilter = filters[0];
      selectedItem = navigationItems[0];
    });
  }

  //classes dos widgets (o conteudo da tela)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
        leading: Icon(
          Icons.sort,
          color: kPrimaryColor,
          size: 28,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.search,
              color: Colors.grey[400],
              size: 28,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 8,
                    blurRadius: 12,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "MangasLib",
                  style: GoogleFonts.catamaran(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      height: 1,
                      color: Colors.grey[700]),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 75),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: buildFilters(),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: buildBooks(),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40))),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Autores para seguir",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Row(
                        children: [
                          Text(
                            "Mostrar todos",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 18,
                            color: kPrimaryColor,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  margin: EdgeInsets.only(bottom: 16),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: buildAuthors(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 8,
                blurRadius: 12,
                offset: Offset(0, 3),
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buildNavigationItems(),
        ),
      ),
    );
  }

//cria de widget e adiciona a lista de filtro
  List<Widget> buildFilters() {
    List<Widget> list = [];
    for (var i = 0; i < filters.length; i++) {
      list.add(buildFilter(filters[i]));
    }
    return list;
  }

//classe que a atualiza do widget de filtro
  Widget buildFilter(Filter item) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = item;
        });
      },
      child: Container(
        height: 50,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 30,
                height: 3,
                color:
                    selectedFilter == item ? kPrimaryColor : Colors.transparent,
              ),
            ),
            Center(
              child: Text(
                item.name,
                style: GoogleFonts.catamaran(
                    color: selectedFilter == item
                        ? kPrimaryColor
                        : Colors.grey[400],
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3),
              ),
            )
          ],
        ),
      ),
    );
  }

//cria de widget e adiciona a lista de autores
  List<Widget> buildAuthors() {
    List<Widget> list = [];
    for (var i = 0; i < authors.length; i++) {
      list.add(buildAuthor(authors[i], i));
    }
    return list;
  }

//classe que a atualiza do widget de autores
  Widget buildAuthor(Author author, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
      width: 255,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            elevation: 4,
            margin: EdgeInsets.all(0),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(15),
            )),
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(author.image), fit: BoxFit.cover)),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(author.fullname,
                  style: GoogleFonts.catamaran(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Icon(
                    Icons.library_books,
                    color: Colors.grey,
                    size: 14,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    author.books.toString() + " mangá(s)",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

//cria de widget e adiciona a lista de
  List<Widget> buildNavigationItems() {
    List<Widget> list = [];
    for (var i = 0; i < navigationItems.length; i++) {
      list.add(buildNavigationItem(navigationItems[i]));
    }
    return list;
  }

//classe que a atualiza do widget da barra de navegação
  Widget buildNavigationItem(NavigationItem item) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItem = item;
        });
      },
      child: Container(
        width: 50,
        child: Center(
          child: Icon(
            item.iconData,
            color: selectedItem == item ? kPrimaryColor : Colors.grey[400],
            size: 26,
          ),
        ),
      ),
    );
  }

//cria de widget e adiciona a lista de livros
  List<Widget> buildBooks() {
    List<Widget> list = [];
    for (var i = 0; i < books.length; i++) {
      list.add(buildBook(books[i], i));
    }
    return list;
  }

//classe que a atualiza do widget de livros
  Widget buildBook(Book book, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BookDetail(
                    book: book,
                  )),
        );
      },
      child: Container(
          margin:
              EdgeInsets.only(right: 32, left: index == 0 ? 16 : 0, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 8,
                          blurRadius: 12,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    margin: EdgeInsets.only(bottom: 16, top: 24),
                    child: Hero(
                      tag: book.title,
                      child: Image.asset(
                        book.image,
                        fit: BoxFit.fitWidth,
                      ),
                    )),
              ),
              Text(
                book.title,
                style: GoogleFonts.catamaran(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                book.author.fullname,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400]),
              )
            ],
          )),
    );
  }
}
