# Scroll Loop Auto Scroll

A Flutter widget that scrolls widgets infinitely in any direction.

## Example

<img src="https://github.com/Ashish-Raturi/scroll_loop_auto_scroll/blob/master/doc/example.gif" height="400" />

## Features
* Infinite Auto Scroll
* Custom child widgets
* Delay after every round
* Custom scroll direction
* Specifying custom durations and gap

## Installation

Add `scroll_loop_auto_scroll: ^0.0.1` to your `pubspec.yaml` dependencies. And import it:

```dart
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
```

## How to use
Simply create a `ScrollLoopAutoScroll` widget, and pass the required params:

```dart
  ScrollLoopAutoScroll(
    child: Text(
      'Very long text that bleeds out of the rendering space',
      style: TextStyle(fontSize: 20),
    ),
    scrollDirection: Axis.horizontal,
  )
```


## Params

```dart

ScrollLoopAutoScroll(
   child: child,
   delay: Duration(seconds: 1),
   disableAnimation: false,
   duration: Duration(seconds: 10),
   gap: 25,
   pause: Duration(seconds: 5),
   scrollDirection: Axis.horizontal
 )
```

## License

MIT
