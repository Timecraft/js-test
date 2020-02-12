# JSTest
## Test some JavaScript

[![AppCenter](https://appcenter.elementary.io/badge.svg)](https://appcenter.elementary.io/com.github.timecraft.js-test)

[![BuildStatus](https://travis-ci.org/Timecraft/js_test.svg?branch=master)](https://travis-ci.org/Timecraft/js_test)


### Screenshots

| **White** | **Light** | **Dark** |
| -------- | -------- | --------- |
|![JSTestScreenshot](https://github.com/Timecraft/JS_Test/blob/master/data/images/com.github.timecraft.js-test.mainwindow.white.png)| ![JSTestScreenshot](https://github.com/Timecraft/JS_Test/blob/master/data/images/com.github.timecraft.js-test.mainwindow.light.png) | ![JSTestScreenshot](https://github.com/Timecraft/JS_Test/blob/master/data/images/com.github.timecraft.js-test.mainwindow.dark.png)
|![JSTestScreenshot](https://github.com/Timecraft/JS_Test/blob/master/data/images/com.github.timecraft.js-test.sample.white.png) | ![JSTestScreenshot](https://github.com/Timecraft/JS_Test/blob/master/data/images/com.github.timecraft.js-test.sample.light.png) | ![JSTestScreenshot](https://github.com/Timecraft/JS_Test/blob/master/data/images/com.github.timecraft.js-test.sample.dark.png)

<br/>
<br/>
<br/>
<br/>
<br/>



### Building, Testing, and Installation
#### Dependencies

- valac
- libgtk-3-dev
- libgranite-dev
- libwebkit2gtk-4.0-dev
- libgtksourceview-3.0-dev
- elementary-sdk
- meson

##### A one liner
`sudo apt install valac libgtk-3-dev libgranite-dev libwebkit2gtk-4.0-dev libgtksourceview-3.0-dev elementary-sdk meson`

#### Installation

Use `meson` to build.

`meson build --prefix=/usr`

Change into `build` directory and use `ninja` to compile.

`cd build`

`ninja`

Install using `ninja install`, then run with `com.github.timecraft.js-test` or by clicking on it in your launcher.

`sudo ninja install`

`com.github.timecraft.js-test`

#### Debugging

If something is acting funny, or if you just want to see my musings, then execution in the terminal will give you all of that.

`com.github.timecraft.js-test`
