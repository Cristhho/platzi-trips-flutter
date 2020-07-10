import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {

  final IconData icon;
  final VoidCallback onPressed;


  FloatingActionButtonGreen({this.icon, this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return _FloatingActionButtonGreen();
  }

}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> with AutomaticKeepAliveClientMixin {

  IconData icon;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    this.icon = Icons.favorite_border;
  }
  
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF11FA53),
      mini: true,
      tooltip: 'Favorite',
      child: Icon(
        widget.icon
      ),
      onPressed: widget.onPressed,
      heroTag: null,
    );
  }

}