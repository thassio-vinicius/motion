import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:motion/utils/fonts.dart';

class WeekRow extends StatefulWidget {
  @override
  _WeekRowState createState() => _WeekRowState();
}

class _WeekRowState extends State<WeekRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 36),
      //height: MediaQuery.of(context).size.height * 0.30,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildWeekDay(context, day: 'Dom', isToday: _getToday('Dom')),
          _buildWeekDay(context, day: 'Seg', isToday: _getToday('Seg')),
          _buildWeekDay(context, day: 'Ter', isToday: _getToday('Ter')),
          _buildWeekDay(context, day: 'Qua', isToday: _getToday('Qua')),
          _buildWeekDay(context, day: 'Qui', isToday: _getToday('Qui')),
          _buildWeekDay(context, day: 'Sex', isToday: _getToday('Sex')),
          _buildWeekDay(context, day: 'Sáb', isToday: _getToday('Sáb')),
        ],
      ),
    );
  }

  bool _getToday(String day) {
    String formattedDate;
    DateTime date = DateTime.now().subtract(Duration(hours: 3));
    initializeDateFormatting('pt_BR');
    formattedDate = DateFormat.E('pt_BR').format(date);

    if (day.toLowerCase() == formattedDate) {
      return true;
    }
    return false;
  }

  Widget _buildWeekDay(BuildContext context, {String day, bool isToday}) {
    return Stack(
      children: isToday
          ? [
              if (isToday)
                Container(
                  width: MediaQuery.of(context).size.width * 0.12,
                  height: MediaQuery.of(context).size.width * 0.30,
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(132),
                    borderRadius: BorderRadius.all(
                      Radius.circular(13),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      '25-33min',
                      style: TextStyle(
                        fontFamily: CustomFonts.helvetica65,
                        fontSize: 9,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.12,
                  height: MediaQuery.of(context).size.width * 0.20,
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Colors.transparent),
                      right: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(bottom: 21),
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      day,
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: CustomFonts.helvetica65,
                        color: Colors.white.withAlpha(180),
                      ),
                    ),
                  ),
                ),
              ),
            ]
          : [
              Container(
                width: MediaQuery.of(context).size.width * 0.12,
                height: MediaQuery.of(context).size.width * 0.20,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: Colors.white,
                      width: day == 'Dom' ? 2.0 : 1.0,
                    ),
                    right: BorderSide(color: Colors.white),
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    day,
                    style: TextStyle(
                      fontSize: 11,
                      fontFamily: CustomFonts.helvetica65,
                      color: Colors.white.withAlpha(180),
                    ),
                  ),
                ),
              ),
            ],
    );
  }
}
