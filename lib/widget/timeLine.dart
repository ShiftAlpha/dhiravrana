import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(<Widget>[
        Row(
          children: [
            Container(
              constraints: const BoxConstraints(maxHeight: 100),
              color: Colors.white,
              child: TimelineTile(
                axis: TimelineAxis.horizontal,
                alignment: TimelineAlign.end,
                isFirst: true,
                startChild: Container(
                  constraints: const BoxConstraints(
                    minWidth: 120,
                  ),
                  color: Colors.amberAccent,
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}
