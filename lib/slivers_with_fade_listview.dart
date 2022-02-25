import 'package:flutter/material.dart';

class SliversWithFadeListView extends StatefulWidget {
  const SliversWithFadeListView({Key? key}) : super(key: key);

  @override
  _SliversWithFadeListViewState createState() =>
      _SliversWithFadeListViewState();
}

class _SliversWithFadeListViewState extends State<SliversWithFadeListView> {
  late ScrollController _scrollController;

  double height = 90;

  Color indigo700 = Colors.indigo.shade700;
  Color indigo600 = Colors.indigo.shade600;
  Color cyanAccent400 = Colors.cyanAccent.shade400;

  scrollListener() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    scrollListener();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            collapsedHeight: 75,
            expandedHeight: 250,
            primary: true,
            // floating: true,
            // snap: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [indigo700, indigo600, indigo700])),
              ),
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: const <Widget>[
                    CircleAvatar(backgroundColor: Colors.white),
                    SizedBox(width: 10),
                    Expanded(child: Text("Sliver App with Fade ListView")),
                  ],
                ),
              ),
            ),
            // title: Text("Sliver "),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
              child: Container(
                color: Colors.black12,
                child: const Center(
                  child: Text("Scroll to see Scroll Effects"),
                ),
              ),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.all(40)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final itemPositionOffset = height *
                    index; // To get current position of Widget in ListView
                // print(itemPositionOffset);

                final difference = _scrollController.offset -
                    itemPositionOffset; // To get difference between scroll controller offset and widget
                // print(difference);

                final percent = 1 - (difference / height);
                // print(percent);

                double opacity = percent;
                // print(opacity);
                (opacity > 0.5) ? opacity = 1.0 : opacity = 0.0;

                double scaleValue = percent;
                if (percent > 1.0) {
                  scaleValue = 1.0;
                }

                return Opacity(
                  opacity: opacity,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..scale(scaleValue),
                    child: Align(
                      heightFactor: 0.7,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: index.isOdd
                                  ? [Colors.cyan, cyanAccent400]
                                  : [Colors.indigoAccent, Colors.indigo],
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        height: height,
                        child: Center(
                          child: Text('$index', textScaleFactor: 4),
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: 22,
            ),
          ),
        ],
      ),
    );
  }
}
