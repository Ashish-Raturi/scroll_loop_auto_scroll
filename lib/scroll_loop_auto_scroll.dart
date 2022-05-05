library scroll_loop_auto_scroll;

import 'package:flutter/material.dart';

class ScrollLoopAutoScroll extends StatefulWidget {
  const ScrollLoopAutoScroll(
      {required this.child,
      Key? key,
      this.delay = const Duration(seconds: 1),
      this.disableAnimation = false,
      this.duration = const Duration(seconds: 10),
      this.gap = 25,
      this.id,
      this.pause = const Duration(seconds: 5),
      this.scrollDirection = Axis.horizontal})
      : super(key: key);

  /// Widget to display in loop
  ///
  /// required
  final Widget child;

  /// Duration to wait before starting animation
  ///
  /// Default set to Duration(seconds: 1).
  final Duration delay;

  /// If animation should be stopped and position reset
  ///
  /// Default set to false.
  final bool disableAnimation;

  /// Duration of animation
  ///
  /// Default set to Duration(seconds: 10).
  final Duration duration;

  /// Sized between end of child and beginning of next child instance
  ///
  /// Default set to 25.
  final double gap;

  /// Used to track widget instance and prevent rebuilding unnecessarily if parent rebuilds
  final String? id;

  /// Time to pause animation inbetween loops
  ///
  /// Default set to Duration(seconds: 5).
  final Duration pause;

  /// The axis along which the scroll view scrolls.
  ///
  /// Default set to [Axis.horizontal].
  final Axis scrollDirection;

  @override
  State<ScrollLoopAutoScroll> createState() => _ScrollLoopAutoScrollState();
}

class _ScrollLoopAutoScrollState extends State<ScrollLoopAutoScroll>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<Offset> offset;
  late final ScrollController scrollController;

  String id = '';
  ValueNotifier<bool> shouldScroll = ValueNotifier<bool>(false);

  @override
  void initState() {
    id = widget.id ?? DateTime.now().toString();

    animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    offset = Tween<Offset>(
      begin: Offset.zero,
      end: widget.scrollDirection == Axis.horizontal
          ? const Offset(-.5, 0)
          : const Offset(0, -.5),
    ).animate(animationController);

    scrollController = ScrollController();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      animationHandler();
    });

    super.initState();
  }

  @override
  void didUpdateWidget(covariant ScrollLoopAutoScroll oldWidget) {
    id = widget.id ?? DateTime.now().toString();

    if (!shouldScroll.value || oldWidget.id != id) {
      animationController.reset();
      shouldScroll.value = false;
    }

    if (!widget.disableAnimation && oldWidget.id != id) {
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        animationHandler();
      });
    }

    super.didUpdateWidget(oldWidget);
  }

  animationHandler() async {
    if (scrollController.position.maxScrollExtent > 0) {
      shouldScroll.value = true;

      await Future.delayed(widget.delay);

      if (shouldScroll.value && mounted) {
        animationController.forward().then((_) async {
          animationController.reset();
          await Future.delayed(widget.pause);

          if (shouldScroll.value && mounted) {
            animationHandler();
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: widget.scrollDirection,
      child: SlideTransition(
        position: offset,
        child: ValueListenableBuilder<bool>(
          valueListenable: shouldScroll,
          builder: (BuildContext context, bool shouldScroll, _) {
            return widget.scrollDirection == Axis.horizontal
                ? Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: shouldScroll ? widget.gap : 0,
                        ),
                        child: widget.child,
                      ),
                      if (shouldScroll)
                        Padding(
                          padding: EdgeInsets.only(
                            right: widget.gap,
                          ),
                          child: widget.child,
                        ),
                    ],
                  )
                : Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: shouldScroll ? widget.gap : 0,
                        ),
                        child: widget.child,
                      ),
                      if (shouldScroll)
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: widget.gap,
                          ),
                          child: widget.child,
                        ),
                    ],
                  );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
