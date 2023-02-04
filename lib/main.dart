import 'package:catalog_app/reponsive/responsive.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(),
      drawer: !ResponsiveScreen.isDesktop(context)
          ? _menu(
              screenSizeHeight: _screenSize * 1.4,
              screenSizeWidth: _screenSize / 1.4,
            )
          : null,
      body: ResponsiveScreen(
        desktop: _desktopScreen(_screenSize, context),
        tablate: _tablateScreen(_screenSize, context),
        mobile: _mobileScreen(_screenSize, context),
      ),
    );
  }

  Widget _desktopScreen(Size _screenSize, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: _screenSize.width > ResponsiveScreen.tablateWithLimit ? 3 : 4,
          child: _menu(
            screenSizeHeight: _screenSize,
            screenSizeWidth: _screenSize,
          ),
        ),
        Expanded(
          flex: _screenSize.width > ResponsiveScreen.tablateWithLimit ? 5 : 7,
          child: _listView(),
        ),
        Expanded(
          flex: _screenSize.width > ResponsiveScreen.tablateWithLimit ? 8 : 10,
          child: _listDetails(),
        )
      ],
    );
  }

  Widget _tablateScreen(Size _screenSize, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: _screenSize.width > ResponsiveScreen.tablateWithLimit ? 5 : 7,
          child: _listView(),
        ),
        Expanded(
          flex: _screenSize.width > ResponsiveScreen.tablateWithLimit ? 8 : 10,
          child: _listDetails(),
        )
      ],
    );
  }

  Widget _mobileScreen(Size _screenSize, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: _screenSize.width > ResponsiveScreen.tablateWithLimit ? 5 : 7,
          child: _listView(),
        ),
      ],
    );
  }

  AppBar _appBar() => AppBar(
        title: const Text("Responsive View"),
        centerTitle: true,
      );
  Widget _menu(
      {required Size screenSizeWidth, required Size screenSizeHeight}) {
    return Card(
      child: Container(
        height: screenSizeHeight.height,
        width: screenSizeWidth.width,
        alignment: Alignment.topCenter,
        color: Colors.blue,
        child: const Text("Menu"),
      ),
    );
  }

  Widget _listView() => ListView.builder(
        itemCount: 18,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.deepPurpleAccent,
            child: Container(
              alignment: Alignment.center,
              height: 100,
              child: Text(
                "item[$index]",
              ),
            ),
          );
        },
      );
  Widget _listDetails() => Card(
        child: Container(
          color: Colors.amber,
          alignment: Alignment.topCenter,
          height: 400,
          child: const Text("ListView Details"),
        ),
      );
}
