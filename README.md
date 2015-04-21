docker-ionic
============

A docker container for developing with the [ionic framework](http://ionicframework.com/)

This container comes fully loaded with:

- Ubuntu 14:04
- node.js
- ionic
- cordova
- android sdk
- android-16 platform (based on [device usage](https://developer.android.com/about/dashboards/index.html))

Usage
-----
For maximum fun: `eval "$(docker run --rm brimstone/ionic bash)"`
Then call `ionic` as you normally would.

Building
--------
Before you `ionic build` you should modify `platforms/android/AndroidManifest.xml` to `android:minSdkVersion="16"` and `android:targetSdkVersion="22"`
