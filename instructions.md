# Instructions

## Setup

To start, you must have the files in the same directory as the program that you are making and run the following import statements: 

```matlab
import Window.*;
import Rect.*;
import Sprite.*;
```

To start, you should make a window using the follow lines: 

```matlab
newWindow = Window;
newWindow = newWindow.setResolution([500 500])
newWindow = newWindow.init()
```

where the [500 500] can be replaced by any resolution you choose.

To render the window, run code like the following to create a figure which can be used to get keyboard, mouse, and close input and then rendering the window.

```matlab
fig = figure;
newWindow = newWindow.render();
newWindow.clear();
```

For a simple example of how to blit images to the surface, we will use the included rectangle functionality. To make the rectangle, use the following code:

```matlab
testRect = Rect;
testRect = testRect.init(200,200,[255,0,0])
```
This will create a red square with a side length of 200 MATLAB pixels.

To add this to the window, you will use code like the following:

```matlab
newWindow = newWindow.blit(testRect, [0 0]);
newWindow = newWindow.render();
```
where [0 0] can be replaced by any position that keeps the rectangle in the bounds of the window resolution (this limitation may be removed in a future update).

To load a sprite, you will use code like the following:

```matlab
s = Sprite;
s = s.init(255,255,"mike.png");
```

Where the height and width of the sprite that you want to use are specified for the initialization process, followed by the filename of the image, in this case `mike.png`.

The rendering process for this is the same as it is for the rectangle:

```matlab
newWindow = newWindow.blit(s, [0 0]);
```