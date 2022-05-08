# Scroll Loop Auto Scroll

This widget automatically scrolls the custom child widget to an infinite loop.

## Example

<img src="https://github.com/Ashish-Raturi/scroll_loop_auto_scroll/raw/master/doc/example.gif" height="500" />

## Features
* Infinite Auto Scroll
* Custom child widgets
* Delay after every round
* Custom scroll direction
* Specifying custom durations and gap
* Like for more features

## Installation

Add `scroll_loop_auto_scroll: ^0.0.3` to your `pubspec.yaml` dependencies. And import it:

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
   scrollDirection: Axis.horizontal,
   reverseScroll: false
 )
```

## License

MIT
