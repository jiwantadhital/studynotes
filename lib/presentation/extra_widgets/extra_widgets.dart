import 'package:flutter/material.dart';
import 'package:studynotes/resources/colors.dart';

class DoubleTappableInteractiveViewer extends StatefulWidget {
  final double scale;
  final Duration scaleDuration;
  final Curve curve;
  final Widget child;
  
  const DoubleTappableInteractiveViewer({
    super.key,
    this.scale = 2,
    this.curve = Curves.fastLinearToSlowEaseIn,
    required this.scaleDuration,
    required this.child,
  });
  
  @override
  State<DoubleTappableInteractiveViewer> createState() => _DoubleTappableInteractiveViewerState();
}

class _DoubleTappableInteractiveViewerState extends State<DoubleTappableInteractiveViewer>
  with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  Animation<Matrix4>? _zoomAnimation;
  late TransformationController _transformationController;
  TapDownDetails? _doubleTapDetails;
  
  @override
  void initState() {
    super.initState();
    _transformationController = TransformationController();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.scaleDuration,
    )..addListener(() {
      _transformationController.value = _zoomAnimation!.value;
    });
  }
  
  @override
  void dispose() {
    _transformationController.dispose();
    _animationController.dispose();
    super.dispose();
  }
  
  void _handleDoubleTapDown(TapDownDetails details) {
  _doubleTapDetails = details;
}

  void _handleDoubleTap() {
    final newValue = 
      _transformationController.value.isIdentity() ?
        _applyZoom() : _revertZoom();
      
    _zoomAnimation = Matrix4Tween(
      begin: _transformationController.value,
      end: newValue,
    ).animate(
      CurveTween(curve: widget.curve)
        .animate(_animationController)
    );
    _animationController.forward(from: 0);
  }
  
  Matrix4 _applyZoom() {
    final tapPosition = _doubleTapDetails!.localPosition;
    final translationCorrection = widget.scale - 1;
    final zoomed = Matrix4.identity()
      ..translate(
        -tapPosition.dx * translationCorrection,
        -tapPosition.dy * translationCorrection,
      )
      ..scale(widget.scale);
    return zoomed;
  }
  
  Matrix4 _revertZoom() => Matrix4.identity();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTapDown: _handleDoubleTapDown,
      onDoubleTap: _handleDoubleTap,
      child: InteractiveViewer(
        transformationController: _transformationController,
        child: widget.child,
      ),
    );
  }
}


//loading

class DialogBox{

dialogbox(context){
  return showDialog(
                                    barrierDismissible: false,
                                    context: context, builder: (context){
                               return Center(
                                 child: Container(
                                  padding: EdgeInsets.all(10),
                                      height: 60,
                                      width: 60,
                                decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white
                                        ),
                                  child: CircularProgressIndicator(color: ColorManager.primaryColor,strokeWidth: 5,),
                                ),
                              );
                                        });
}
//download
downloadbox(context){
  return showDialog(
                                    barrierDismissible: false,
                                    context: context, builder: (context){
                               return Center(
                                 child: Container(
                                  padding: EdgeInsets.all(10),
                                      height: 60,
                                      width: 60,
                                decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white
                                        ),
                                  child: CircularProgressIndicator(color: ColorManager.primaryColor,strokeWidth: 5,),
                                ),
                              );
                                        });
}

}

class ShowSnackBar{
  snack(String text, Color color){
    final snackBar = SnackBar(
      backgroundColor: color,
  content: Text(text),
);

  return snackBar;


  }
}