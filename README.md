# MarqueeTest

Shows how to stop a scrolling `UIScrollView` in place.  The basic idea is to look at the `presentationLayer` of the underlying `CALayer`, and steal its current `bounds` property; then remove all animations, allow UIKit’s custom animation delegate objects to work their magic, then set the bounds back.  Do it all when the customer starts dragging.

Blog post coming soon-ish.
