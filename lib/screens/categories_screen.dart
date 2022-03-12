import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/category.dart';
import 'slides_screen.dart';

class CategoriesScreen extends ConsumerStatefulWidget {
  final List<Category> categories;
  final String title;
  final String lesson;
  const CategoriesScreen(
      {Key? key,
      required this.categories,
      required this.title,
      required this.lesson})
      : super(key: key);

  @override
  ConsumerState<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends ConsumerState<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Theme.of(context).backgroundColor.withOpacity(0.9),
                  BlendMode.darken),
              image: AssetImage(isPortrait
                  ? "assets/images/backPortrait.png"
                  : "assets/images/backLandscape.png"),
              fit: BoxFit.cover)),
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
          itemCount: widget.categories.length,
          itemBuilder: (context, index) {
            return Card(
              child: ExpansionTile(
                tilePadding: const EdgeInsets.all(20),
                title: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        widget.categories[index].categoryName,
                        maxLines: 1,
                        style: GoogleFonts.oswald(
                            textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                          fontSize: 27,
                        )),
                      ),
                      AutoSizeText(
                        "Fashcard Maker: ${widget.categories[index].flashCardMaker}",
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.oswald(
                            textStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                        )),
                      ),
                    ],
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xffF16623),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.0)),
                          padding: const EdgeInsets.all(5.0),
                        ),
                        onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SlidesScreen(
                                  slides: widget.categories[index].slides,
                                  categoryName:
                                      widget.categories[index].categoryName)),
                        ),
                        child: Text('Start Studying',
                            style: GoogleFonts.robotoSlab(
                                textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ))),
                      ),
                    ],
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.categories[index].explanation,
                          style: GoogleFonts.oswald(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Theme.of(context).primaryColor,
                            fontSize: 15,
                          )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    ));
  }
}
