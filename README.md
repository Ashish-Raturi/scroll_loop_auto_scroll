# Scroll Loop Auto Scroll

This widget automatically scrolls the custom child widget to an infinite loop.

## Examples

<img src="https://github.com/Ashish-Raturi/scroll_loop_auto_scroll/raw/master/doc/stockIndexLoop.gif" height="100" width="300" />


<img src="https://github.com/Ashish-Raturi/scroll_loop_auto_scroll/raw/master/doc/example.gif" height="600" />

## Features
* User scroll input 🆕
* Infinite Auto Scroll
* Custom child widgets
* Custom scroll direction
* Specifying custom durations and gap
* Like for more features

## Installation

Add `scroll_loop_auto_scroll: ^0.0.5` to your `pubspec.yaml` dependencies. And import it:

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
   child: child, //required
   scrollDirection: Axis.horizontal, //required
   delay: Duration(seconds: 1),
   duration: Duration(seconds: 50),
   gap: 25,
   reverseScroll: false,
   duplicateChild : 25,
   enableScrollInput : true,
   delayAfterScrollInput : Duration(seconds: 1)
 )
```

## More Level Up Your Flutter Skills

⭐️ Stripe In Flutter  [Link](https://gappsolution.com/course/stripe-in-flutter)

⭐️ Flutter In-App Purchase [Link](https://gappsolution.com/course/learn-flutter-in-app-purchase)

⭐️ Flutter In-App Subscription  [Link](https://gappsolution.com/course/learn-flutter-in-app-subscriptions)

## License

MIT
