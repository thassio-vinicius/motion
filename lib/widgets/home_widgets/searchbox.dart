import 'package:flutter/material.dart';
import 'package:motion/utils/fonts.dart';

class SearchBox extends StatefulWidget {
  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  Color _boxColor = Colors.white.withAlpha(130);

  TextEditingController _searchController = TextEditingController(
    text: 'Escolha a música perfeita para meditação',
  );

  TextStyle _searchStyle = TextStyle(
    fontFamily: CustomFonts.helvetica65,
    color: Colors.white.withAlpha(150),
    fontSize: 12,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 25,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Monte sua playlist para relaxar',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: CustomFonts.helvetica65,
                ),
              ),
            ),
          ),
          Positioned(
            left: 25,
            top: 35,
            child: Container(
              decoration: BoxDecoration(
                  color: _boxColor,
                  borderRadius: BorderRadius.all(Radius.circular(13))),
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Image.asset('assets/images/icon_search.png'),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: TextField(
                        maxLines: 1,
                        controller: _searchController,
                        onTap: () => _tapTextField(),
                        style: _searchStyle,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          border:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _tapTextField() {
    setState(() {
      _boxColor = Colors.white;
      _searchStyle = TextStyle(
        fontFamily: CustomFonts.helvetica65,
        color: Colors.black,
        fontSize: 16,
      );
      _searchController.text = '';
    });
  }
}
