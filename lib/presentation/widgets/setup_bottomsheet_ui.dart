import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked_themes/stacked_themes.dart';
import '../../app/locator.dart';
import 'package:stacked_services/stacked_services.dart';

enum BottomSheetType { basic, full, profilePic, busLane, busTerminal, busDate, busTime, tripSafety}

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.basic: (context, sheetRequest, completer) =>
        _FloatingBoxBottomSheet(request: sheetRequest, completer: completer),

    BottomSheetType.profilePic: (context, sheetRequest, completer) =>
        ProfilePicBottomSheet(request: sheetRequest, completer: completer),

    BottomSheetType.busLane: (context, sheetRequest, completer) =>
        BusLaneBottomSheet(request: sheetRequest, completer: completer,),

    BottomSheetType.busTerminal: (context, sheetRequest, completer) =>
        BusTerminalBottomSheet(request: sheetRequest, completer: completer,),

    BottomSheetType.busDate: (context, sheetRequest, completer) =>
        BusDateBottomSheet(request: sheetRequest, completer: completer,),

    BottomSheetType.busTime: (context, sheetRequest, completer) =>
        BusDepartTimeBottomSheet(request: sheetRequest, completer: completer,),

    BottomSheetType.tripSafety: (context, sheetRequest, completer) =>
        SafetyBottomSheet(request: sheetRequest, completer: completer,),

  };

  bottomSheetService.setCustomSheetBuilders(builders);
}


//onTap: () => completer(SheetResponse(...));
//completer(SheetResponse(confirmed: true))

class ProfilePicBottomSheet extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;


   ProfilePicBottomSheet({
    Key key,
    this.request,
    this.completer,

  }) : super(key: key);

  final ThemeService _themeService = locator<ThemeService>();
  ThemeService get getTheme => _themeService;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),

      ),
      child: Column(
        children: [
          //Header
          //Header
          Container(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      SizedBox(
                        height: 26,
                        width: 26,
                      ),
                      Text('Update profile photo',
                        style:
                        Theme.of(context).textTheme.headline6.apply(color: (getThemeManager(context).selectedThemeMode == ThemeMode.dark)
                            ?
                        Theme.of(context).colorScheme.onSurface
                            :
                        Theme.of(context).colorScheme.onError
                        ),
                      ),
                      SizedBox(
                        height: 26,
                        width: 26,
                        child: RawMaterialButton(
                          padding: EdgeInsets.all(0),
                          elevation: 0,
                          fillColor: Theme.of(context).colorScheme.onSurface,
                          shape: CircleBorder(),
                          onPressed: (){
                            Navigator.pop(context);
                          },

                          child: Container(
                              padding: EdgeInsets.all(7),
                              child:
                              SvgPicture.asset('assets/icons/icon-close-back-black.svg',
                                color:  Theme.of(context).colorScheme.background,)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Divider(
                  color: Theme.of(context).colorScheme.surface,
                  thickness: 1,
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),

          //Content
          Container(
            padding: EdgeInsets.symmetric(vertical: 0),
            child: Column(
              children: [
                MaterialButton(
                  padding: EdgeInsets.all(0),
                  splashColor: Theme.of(context).colorScheme.onSurface,
                  onPressed: (){
                    completer(SheetResponse(data: 'Gallery'));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.06,),
                    height: 60,
                    child: Row(
                      children: [
                        Container(
                          height: 27,
                          width: 27,
                          child: SvgPicture.asset('assets/icons/folder.svg',
                            color:
                            (getThemeManager(context).selectedThemeMode == ThemeMode.dark)
                                ?
                            Theme.of(context).colorScheme.onSecondary
                                :
                            Theme.of(context).colorScheme.onBackground
                          ),
                        ),
                        SizedBox(width: 15,),
                        Text('Pick from photo album',
                          style:
                          Theme.of(context).textTheme.bodyText1.apply(
                              color:
                              (getThemeManager(context).selectedThemeMode == ThemeMode.dark)
                                  ?
                              Theme.of(context).colorScheme.onSecondary
                                  :
                              Theme.of(context).colorScheme.onBackground
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 10,),

                MaterialButton(
                  padding: EdgeInsets.all(0),
                  splashColor: Theme.of(context).colorScheme.onSurface,
                  onPressed: (){
                    completer(SheetResponse(data: 'Camera'));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.06,),
                    height: 60,
                    child: Row(
                      children: [
                        Container(
                          height: 27,
                          width: 27,

                          child: SvgPicture.asset('assets/icons/camera.svg' ,
                            color:
                            (getThemeManager(context).selectedThemeMode == ThemeMode.dark)
                                ?
                            Theme.of(context).colorScheme.onSecondary
                                :
                            Theme.of(context).colorScheme.onBackground
                          ),
                        ),
                        SizedBox(width: 15,),
                        Text('Take a photo',
                          style: Theme.of(context).textTheme.bodyText1.apply(
                              color:
                              (getThemeManager(context).selectedThemeMode == ThemeMode.dark)
                                  ?
                              Theme.of(context).colorScheme.onSecondary
                                  :
                              Theme.of(context).colorScheme.onBackground
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}

class BusLaneBottomSheet extends StatelessWidget {
  //final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final SheetRequest request;
  final Function(SheetResponse) completer;

  BusLaneBottomSheet({
    Key key,
    this.request,
    this.completer,

  }) : super(key: key);

  final ThemeService _themeService = locator<ThemeService>();
  ThemeService get getTheme => _themeService;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.5,
        minChildSize: 0.2,
        maxChildSize: 0.9,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            //height: 400,
            width: size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),

            ),
            child: Column(
              children: [
                //Header
                Container(
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            SizedBox(
                              height: 26,
                              width: 26,
                            ),
                            Text('${request.title}',
                              style:
                              Theme.of(context).textTheme.headline6.apply(color: (getThemeManager(context).selectedThemeMode == ThemeMode.dark)
                                      ?
                                  Theme.of(context).colorScheme.onSurface
                                      :
                                  Theme.of(context).colorScheme.onError
                              ),
                            ),
                            SizedBox(
                              height: 26,
                              width: 26,
                              child: RawMaterialButton(
                                padding: EdgeInsets.all(0),
                                elevation: 0,
                                fillColor: Theme.of(context).colorScheme.onSurface,
                                shape: CircleBorder(),
                                onPressed: (){
                                  Navigator.pop(context);
                                },

                                child: Container(
                                  padding: EdgeInsets.all(7),
                                    child:
                                    SvgPicture.asset('assets/icons/icon-close-back-black.svg',
                                      color:  Theme.of(context).colorScheme.background,)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Divider(
                        color: Theme.of(context).colorScheme.surface,
                        thickness: 1,
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    //scrollDirection: Axis.vertical,
                    itemCount: request.data?.length,
                    controller: scrollController,

                    itemBuilder: (_, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.06),
                        //title: Text('${items[index]}'),
                        leading: Text('${request.data[index]}',
                          style: Theme.of(context).textTheme.bodyText1.apply(color:
                          (getThemeManager(context).selectedThemeMode == ThemeMode.dark)
                              ?
                          Theme.of(context).colorScheme.onSecondary
                              :
                          Theme.of(context).colorScheme.onBackground,),
                        ),

                        trailing: (request.description == request.data[index])
                            ?
                        Container(height: 20, width: 20,
                          child: SvgPicture.asset( 'assets/icons/tick-mark.svg', color: Theme.of(context).colorScheme.secondary
                          ),
                        )
                            : null,
                        onTap: () {
                          completer(SheetResponse(
                              data: request.data[index]));
                        },
                      );
                    },
                  ),),

                SizedBox(height: 20,),
              ],
            ),
          );
        }
    );

  }
}

class BusTerminalBottomSheet extends StatelessWidget {
  //final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  //final ScrollController controller = ScrollController();

  final SheetRequest request;
  final Function(SheetResponse) completer;

  BusTerminalBottomSheet({
    Key key,
    this.request,
    this.completer,

  }) : super(key: key);

  final ThemeService _themeService = locator<ThemeService>();
  ThemeService get getTheme => _themeService;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.5,
        minChildSize: 0.2,
        maxChildSize: 0.9,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            //height: 400,
            width: size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),

            ),
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              children: [
                //Header
                Container(
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            SizedBox(
                              height: 26,
                              width: 26,
                            ),
                            Text('${request.title}',
                              style:
                              Theme.of(context).textTheme.headline6.apply(color: (getThemeManager(context).selectedThemeMode == ThemeMode.dark)
                                  ?
                              Theme.of(context).colorScheme.onSurface
                                  :
                              Theme.of(context).colorScheme.onError
                              ),
                            ),
                            SizedBox(
                              height: 26,
                              width: 26,
                              child: RawMaterialButton(
                                padding: EdgeInsets.all(0),
                                elevation: 0,
                                fillColor: Theme.of(context).colorScheme.onSurface,
                                shape: CircleBorder(),
                                onPressed: (){
                                  Navigator.pop(context);
                                },

                                child: Container(
                                    padding: EdgeInsets.all(7),
                                    child:
                                    SvgPicture.asset('assets/icons/icon-close-back-black.svg',
                                      color:  Theme.of(context).colorScheme.background,)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Divider(
                        color: Theme.of(context).colorScheme.surface,
                        thickness: 1,
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: request.data.length,
                    physics: BouncingScrollPhysics(),

                    itemBuilder: (_, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.06),
                        //title: Text('${items[index]}'),
                        leading: Text('${request.data[index].busTerminalName}',
                          style: Theme.of(context).textTheme.bodyText1.apply(color:
                          (getThemeManager(context).selectedThemeMode == ThemeMode.dark)
                              ?
                          Theme.of(context).colorScheme.onSecondary
                              :
                          Theme.of(context).colorScheme.onBackground,),
                        ),

                        trailing: (request.description == (request.data[index].busTerminalID).toString())
                            ?
                        Container(height: 20, width: 20,
                          child: SvgPicture.asset( 'assets/icons/tick-mark.svg', color: Theme.of(context).colorScheme.secondary
                          ),
                        )
                            : null,
                        onTap: () {
                          completer(SheetResponse(
                              data: request.data[index].busTerminalID));
                        },
                      );
                    },
                  ),),

                SizedBox(height: 20,),
              ],
            ),
          );
        }
    );

  }
}

// ignore: must_be_immutable
class BusDateBottomSheet extends StatelessWidget {
  //final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final SheetRequest request;
  final Function(SheetResponse) completer;

  BusDateBottomSheet({
    Key key,
    this.request,
    this.completer,

  }) : super(key: key);

  final ThemeService _themeService = locator<ThemeService>();

  ThemeService get getTheme => _themeService;

  DateTime tempPickedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
            height: size.height * 0.5,
            width: size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),

            ),
            child: Column(
              children: [
                //Header
                Container(
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            SizedBox(
                              height: 26,
                              width: 26,
                            ),
                            Text('${request.title}',
                              style:
                              Theme.of(context).textTheme.headline6.apply(color: (getThemeManager(context).selectedThemeMode == ThemeMode.dark)
                                  ?
                              Theme.of(context).colorScheme.onSurface
                                  :
                              Theme.of(context).colorScheme.onError
                              ),
                            ),
                            SizedBox(
                              height: 26,
                              width: 26,
                              child: RawMaterialButton(
                                padding: EdgeInsets.all(0),
                                elevation: 0,
                                fillColor: Theme.of(context).colorScheme.onSurface,
                                shape: CircleBorder(),
                                onPressed: (){
                                  Navigator.pop(context);
                                },

                                child: Container(
                                    padding: EdgeInsets.all(7),
                                    child:
                                    SvgPicture.asset('assets/icons/icon-close-back-black.svg',
                                      color:  Theme.of(context).colorScheme.background,)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Divider(
                        color: Theme.of(context).colorScheme.surface,
                        thickness: 1,
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),

                Expanded(
                  child: CupertinoDatePicker(
                    minimumDate: DateTime.now(),
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (DateTime dateTime) {
                      //

                        tempPickedDate = dateTime;

                      print(dateTime.toString());
                    },
                  ),
                ),
                //BUTTON
                Container(
                  width: size.width,
                  height: 45,
                  margin: EdgeInsets.only(
                      left: size.width * 0.06,
                      right: size.width * 0.06),
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary.withOpacity(0.1)),

                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0))),                    ),
                    onPressed: (){
                      //completer(SheetResponse(confirmed: true));

                      print(tempPickedDate.toString());

                      completer(SheetResponse(data: tempPickedDate));

                    },
                    child: Text(
                      'DONE',
                      style: Theme.of(context).textTheme.button.apply(color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ),

                SizedBox(height: 20,),
              ],
            ),
          );

  }
}

class BusDepartTimeBottomSheet extends StatelessWidget {
  //final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final ScrollController controller = ScrollController();

  final SheetRequest request;
  final Function(SheetResponse) completer;

  BusDepartTimeBottomSheet({
    Key key,
    this.request,
    this.completer,

  }) : super(key: key);

  final ThemeService _themeService = locator<ThemeService>();
  ThemeService get getTheme => _themeService;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.5,
        minChildSize: 0.2,
        maxChildSize: 0.9,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            //height: 400,
            width: size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),

            ),
            child: Column(
              children: [
                //Header
                Container(
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            SizedBox(
                              height: 26,
                              width: 26,
                            ),
                            Text('${request.title}',
                              style:
                              Theme.of(context).textTheme.headline6.apply(color: (getThemeManager(context).selectedThemeMode == ThemeMode.dark)
                                  ?
                              Theme.of(context).colorScheme.onSurface
                                  :
                              Theme.of(context).colorScheme.onError
                              ),
                            ),
                            SizedBox(
                              height: 26,
                              width: 26,
                              child: RawMaterialButton(
                                padding: EdgeInsets.all(0),
                                elevation: 0,
                                fillColor: Theme.of(context).colorScheme.onSurface,
                                shape: CircleBorder(),
                                onPressed: (){
                                  Navigator.pop(context);
                                },

                                child: Container(
                                    padding: EdgeInsets.all(7),
                                    child:
                                    SvgPicture.asset('assets/icons/icon-close-back-black.svg',
                                      color:  Theme.of(context).colorScheme.background,)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Divider(
                        color: Theme.of(context).colorScheme.surface,
                        thickness: 1,
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    shrinkWrap: true,
                    //scrollDirection: Axis.vertical,
                    itemCount: request.data.length,
                    physics: BouncingScrollPhysics(),

                    itemBuilder: (_, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.06),
                        //title: Text('${items[index]}'),
                        leading: Text('${request.data[index]}',
                          style: Theme.of(context).textTheme.bodyText1.apply(color:
                          (getThemeManager(context).selectedThemeMode == ThemeMode.dark)
                              ?
                          Theme.of(context).colorScheme.onSecondary
                              :
                          Theme.of(context).colorScheme.onBackground,),
                        ),

                        trailing: (request.description == request.data[index])
                            ?
                        Container(height: 20, width: 20,
                          child: SvgPicture.asset( 'assets/icons/tick-mark.svg', color: Theme.of(context).colorScheme.secondary
                          ),
                        )
                            : null,
                        onTap: () {
                          completer(SheetResponse(
                              data: request.data[index]));
                        },
                      );
                    },
                  ),
                ),

                SizedBox(height: 20,),
              ],
            ),
          );
        }
    );

  }
}

class SafetyBottomSheet extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;


  SafetyBottomSheet({
    Key key,
    this.request,
    this.completer,

  }) : super(key: key);

  final ThemeService _themeService = locator<ThemeService>();
  ThemeService get getTheme => _themeService;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return  DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.9,
        minChildSize: 0.9,
        maxChildSize: 0.9,
        builder: (BuildContext context, ScrollController scrollController) {
        return Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),

        ),
        child: Column(
          children: [

            //Header
            Container(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        SizedBox(
                          height: 26,
                          width: 26,
                        ),
                        Text('Safety toolkit',
                          style:
                          Theme.of(context).textTheme.headline6.apply(color: (getThemeManager(context).selectedThemeMode == ThemeMode.dark)
                              ?
                          Theme.of(context).colorScheme.onSurface
                              :
                          Theme.of(context).colorScheme.onError
                          ),
                        ),
                        SizedBox(
                          height: 26,
                          width: 26,
                          child: RawMaterialButton(
                            padding: EdgeInsets.all(0),
                            elevation: 0,
                            fillColor: Theme.of(context).colorScheme.onSurface,
                            shape: CircleBorder(),
                            onPressed: (){
                              Navigator.pop(context);
                            },

                            child: Container(
                                padding: EdgeInsets.all(7),
                                child:
                                SvgPicture.asset('assets/icons/icon-close-back-black.svg',
                                  color:  Theme.of(context).colorScheme.background,)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Divider(
                    color: Theme.of(context).colorScheme.surface,
                    thickness: 1,
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width*0.06),
              padding: EdgeInsets.symmetric(vertical: 10,),
              child: Text(
                'Features to help you feel safe and secure while you ride',
                style:  Theme.of(context).textTheme.bodyText1.apply(color: Theme.of(context).colorScheme.onSurface),

              ),
            ),

            SizedBox(
              height: 15,
            ),

            Container(
              width: size.width,
              //height: 200.0,
              margin: EdgeInsets.symmetric(horizontal: size.width*0.06),
              padding: EdgeInsets.symmetric(vertical: 10,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Theme.of(context).colorScheme.surface,

              ),
              child: Column(children: [

                //Share ride details
                Container(
                  child: RawMaterialButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () async{
                      completer(SheetResponse(data: 'share'));
                    },
                    child: Container(
                      height: 65,
                      width: size.width,

                      padding: EdgeInsets.symmetric(horizontal: size.width*0.06),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset('assets/icons/share.svg', color: Theme.of(context).colorScheme.onSurface,),
                                SizedBox(width: 15),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      //width: size.width - 70,
                                      child: Container(
                                        child: Text(
                                          'Share ride details',
                                          style:  Theme.of(context).textTheme.bodyText1,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 3,
                                    ),

                                    Container(
                                      child: Text(
                                        'Share location and car info',
                                        style:  Theme.of(context).textTheme.subtitle1,
                                      ),
                                    ),


                                  ],
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset('assets/icons/arrowforward.svg',  color: Theme.of(context).colorScheme.onSurface,),
                        ],
                      ),
                    ),
                  ),
                ),

                //Emergency
                Container(
                  child: RawMaterialButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      completer(SheetResponse(data: 'emergency'));
                    },
                    child: Container(
                      height: 65,
                      width: size.width,
                      padding: EdgeInsets.symmetric(horizontal: size.width*0.06),
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset('assets/icons/safetyicon.svg', color: Theme.of(context).colorScheme.error,),
                                SizedBox(width: 15),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      //width: size.width - 70,
                                      child: Container(
                                        child: Text(
                                          'Emergency assist',
                                          style:  Theme.of(context).textTheme.bodyText1.apply(color: Theme.of(context).colorScheme.error),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 3,
                                    ),

                                    Container(
                                      child: Text(
                                        'Call local authority',
                                        style: Theme.of(context).textTheme.subtitle1,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset('assets/icons/arrowforward.svg' , color: Theme.of(context).colorScheme.onSurface,),
                        ],
                      ),
                    ),
                  ),
                ),
              ],),
            )
          ],
        ),
      );
        }
    );
  }
}

class _FloatingBoxBottomSheet extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;
  const _FloatingBoxBottomSheet({
    Key key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(

      ),
    );
  }
}