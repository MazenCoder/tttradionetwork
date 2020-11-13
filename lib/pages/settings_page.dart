import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:get_version/get_version.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:flutter/material.dart';


class SettingsPage extends StatelessWidget {

  RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: "rateMyApp_",
    minDays: 3,
    minLaunches: 7,
    remindDays: 2,
    remindLaunches: 5,
    googlePlayIdentifier: 'com.mazencoder.tttradionetwork',
    appStoreIdentifier: '1491556149',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<String>(
        future: GetVersion.projectVersion,
        builder: (context, snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.waiting: return Center(
              child: CircularProgressIndicator(),
            );
            default: return SettingsList(
              lightBackgroundColor: Colors.white,
              sections: [

                SettingsSection(
                  title: 'General',
                  tiles: [
                    SettingsTile(
                      title: 'About',
                      leading: Icon(MdiIcons.informationOutline),
                      onTap: () async {
                        await aboutDialog(context, snapshot.data);
                      },
                    ),

                    SettingsTile(
                      title: 'Rate this app',
                      leading: Icon(MdiIcons.commentCheck),
                      onTap: () {
                        rateMyApp.init().then((_) {
                          rateMyApp.showRateDialog(
                            context, title: 'Rate this app',
                            message: 'Help other users enjoy this application',
                            dialogStyle: DialogStyle(
                              titleAlign: TextAlign.center,
                              messageAlign: TextAlign.center,
                              messagePadding: EdgeInsets.only(bottom: 20.0),
                            ),
                            rateButton: 'Ok',
                            noButton: 'No thanks',
                            laterButton: 'Later',
                          );
                        });
                      },
                    ),

                    SettingsTile(
                      title: 'Version',
                      leading: Icon(Icons.android),
                      subtitle: '${snapshot.data}',
                    ),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Future<void> aboutDialog(BuildContext context, String version) async {
    await showDialog(context: context, builder: (context) => AlertDialog(
      title: Column(
        children: [
          Text('About'),
          Text('Version $version'),
        ],
      ),
      content: Text("Thank you for downloading our app"),
      actions: <Widget>[
        FlatButton(
          child: Text('OK'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ));
  }
}
