# JSTest
## Test some JavaScript

[![BuildStatus](https://travis-ci.org/Timecraft/js_test.svg?branch=master)](https://travis-ci.org/Timecraft/js_test)

### Screenshots
#### Coming soon!

![JSTestScreenshot](https://github.com/Timecraft/JS_Test/blob/master/data/images/com.github.timecraft.jstest.mainwindow.png)
<br/>
<br/>
[JSTestScreenshot](https://github.com/Timecraft/JS_Test/blob/master/data/images/com.github.timecraft.jstest.sample.png)

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

Install using `ninja install`, then run with `com.github.timecraft.jstest` or by clicking on it in your launcher.

`sudo ninja install`

`com.github.timecraft.jstest`

#### Debugging

If something is acting funny, or if you just want to see my musings, then execution in the terminal will give you all of that.

`com.github.timecraft.jstest`
