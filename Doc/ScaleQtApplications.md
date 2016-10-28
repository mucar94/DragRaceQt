# Scale Qt Application for HiDPI Displays

e.g. for my Dell Inspiron 7559 with 4K Touch Display

tested with *Qt Creator* and *Seafile Client*, but should work for a lot more applications written in Qt.

## Set automatic scaling based on system DPI information

Add the following line to your personal ~/.profile file
```
export QT_AUTO_SCREEN_SCALE_FACTOR=1
```
On my Laptop this results in a very huge application ... like 4x

## Set fixed scales for internal and external display

Add the following line to your personal ~/.profile file
```
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCREEN_SCALE_FACTORS='2;1'
```
On my Laptop this seems to be the best solution right now, because UI gets scaled with the factor for this screen and dot-sized text elements use system scale factor for each screen. It does not work if you plug in a second HiDPI Screen because ```~/.profile``` gets only executed once you log in.

## Set fixed scale for UI elements and use system scale for text

Add the following line to your personal ~/.profile file
```
export QT_DEVICE_PIXEL_RATIO=2
```
Somestimes text gets scaled two times ... this is deprecated since Qt 5.6, better use *QT_SCREEN_SCALE_FACTORS*


See also:
https://blog.qt.io/blog/2016/01/26/high-dpi-support-in-qt-5-6/
