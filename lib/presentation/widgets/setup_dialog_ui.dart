import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import '../../app/locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// The type of dialog to show
enum DialogType { basic, form, loading, onFailed, onConfirmRed, onDriverArrived, onNoDriver, onBusNotStarted}

final ThemeService _themeService = locator<ThemeService>();
ThemeService get getTheme => _themeService;

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.basic: (context, sheetRequest, completer) =>
        _BasicDialog(request: sheetRequest, completer: completer),
    DialogType.form:  (context, sheetRequest, completer) =>
        _FormDialog(request: sheetRequest, completer: completer),
    DialogType.loading:  (context, sheetRequest, completer) =>
        _LoadingDialog(request: sheetRequest, completer: completer),

  };

  dialogService.registerCustomDialogBuilders(builders);
}



class _BasicDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _BasicDialog({Key key, this.request, this.completer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child:
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              request.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              request.description,
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              // Complete the dialog when you're done with it to return some data
              onTap: () => completer(DialogResponse(confirmed: true)),
              child: Container(
                child: request.showIconInMainButton
                    ? Icon(Icons.check_circle)
                    : Text(request.mainButtonTitle),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _FormDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _FormDialog({Key key, this.request, this.completer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(), /* Build your dialog UI here */
    );
  }
}

class _LoadingDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const _LoadingDialog({Key key, this.request, this.completer}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Dialog(
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(horizontal: size.width*0.20),
      shape: RoundedRectangleBorder(
        borderRadius:  BorderRadius.circular(10),
      ),
      //backgroundColor: Colors.transparent,
      child: Container(
        //margin: EdgeInsets.symmetric(horizontal: 100),
        height: 130,
        //width: 80,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius:  BorderRadius.circular(10),
          color: (Theme.of(context).colorScheme.brightness == Brightness.light)
              ?
          Theme.of(context).colorScheme.background
              :
          Theme.of(context).colorScheme.surface
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: SpinKitThreeBounce(
                      color:
                      Theme.of(context).colorScheme.onError
                  ),
              ),
              //CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(XDColor_blue),),
              SizedBox(height: 5,),
              Text(
                request.title,
                style: Theme.of(context).textTheme.headline6.apply(
                    color:
                    Theme.of(context).colorScheme.onError
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}




