import 'package:flutter/material.dart';
import 'package:flutter_black_white/utils/constants.dart';

//import 'package:b_w0/helpers/shared_preferences.dart';



class FiltersBedrooms extends StatefulWidget {
  const FiltersBedrooms({Key? key}) : super(key: key);

  @override
  State<FiltersBedrooms> createState() => _FiltersBedroomsState();
}

class _FiltersBedroomsState extends State<FiltersBedrooms> {

  late List<PropertiesRooms> _propertiesRooms;
  late List<String> _filtersSearchRooms;
  late int _defaultChoiceIndex;


  @override
  void initState() {
    super.initState();
    _propertiesRooms = <PropertiesRooms>[
      const PropertiesRooms('1+'),
      const PropertiesRooms('2+'),
      const PropertiesRooms('3+'),
      const PropertiesRooms('4+'),
      //const PropertiesRooms('5+'),
    ];
    //_filtersSearchRooms = Preferences.filterRoomsLoggedOut;
    _filtersSearchRooms = [];
    _defaultChoiceIndex = 0;
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB( 24.0, 28.0, 24.0, 0.0 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('MINIMUM', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: kSecondaryColor),),
                      Text('BEDROOMS', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kSecondaryColor),),
                    ],
                  ),
                  Wrap(
                    children: propertiesRoomsWidgets.toList(),
                  ),
                ],
              ),
            ),        
          ],
        )
      ),
    );
  }


  Iterable<Widget> get propertiesRoomsWidgets sync* {
    for (PropertiesRooms propertiesRooms in _propertiesRooms) {
      yield Padding(
        padding: const EdgeInsets.symmetric( horizontal: 0.0 ),
        child: ChoiceChip(
          label: Container(
            width: 30,
            alignment: Alignment.center,
            child: Text(propertiesRooms.name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: _defaultChoiceIndex == _propertiesRooms.indexOf(propertiesRooms) ? Colors.white : kPrimaryColor ), ),
          ),
          labelPadding: const EdgeInsets.all(0.0),
          backgroundColor: const Color(0xFFFFFFFF),
          selectedColor: kPrimaryColor,
          shape: const RoundedRectangleBorder(side: BorderSide(), borderRadius: BorderRadius.all(Radius.circular(8))),
          side: const BorderSide( color: kPrimaryColor ),
          selected: _defaultChoiceIndex == _propertiesRooms.indexOf(propertiesRooms),
          onSelected: ( bool selected ) {
            setState(() {
              _defaultChoiceIndex = selected ? _propertiesRooms.indexOf(propertiesRooms) : 0;
              selected ? _filtersSearchRooms.add(propertiesRooms.name) : _filtersSearchRooms.removeWhere((String name) => name == propertiesRooms.name);
              //Preferences.filterRoomsLoggedOut = _filtersSearchRooms;
            });
          },
        )
      );
    }
  }
}


class PropertiesRooms {
  const PropertiesRooms(this.name);
  final String name;
}