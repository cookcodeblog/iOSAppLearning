## Lean to master Auto Layout to make App works nicely on diffent Apple devices

### What is Auto Layout

Auto Layout allows us to create *constaints* that define *relationship* between two views.

![Auto Layout Basic Concept](http://wx2.sinaimg.cn/mw690/006RF1rrgy1fizv6u3hr0j30yo0nywnm.jpg)

### Auto Layout Tutorial (Basic)

* [Auto Layout Tutorial in Xcode with Swift for iOS 10 | iOS Development Tutorial](https://www.youtube.com/watch?v=R0PrgE_PKSg)

Learn how to add contraints : (x, y, up, down and weight/height)
Learn how to clear constraints, but I can't find **Update Framework** menu.

### All Things Auto Layout Series

* [iOS Development: Introduction to All Things Auto Layout Series Pt 1](https://www.youtube.com/watch?v=1NomEvSFaVU&list=PLHmNdpdzx21GwEzSt4LNdlUAyQIchiWi7) // ING

**比喻：**

Auto Layout 简单地来说就像是给一张海报排版，目的是在不同尺寸大小的海报上显示出来的文字，图片还能准确地表达出原本的意思，不能错乱。
排版讲究的主要因素有：

* 对齐 （比如水平，垂直，居中，两端，左对齐，右对齐等）
* 间隔 （上，下，左，右间隔）
* 大小 （图片，文字的宽度，高度）
* 位置 （相对位置，绝对位置，X/Y坐标）

#### Use "Pin" set constraints

Click `|-[]-|' menu to fill values (hard code) for:

Sapces:

* Top space
* Bottom space
* Leading space
* Trailing space

Size:

* Width
* Height


### Use "Mouse" set constraints

![Use Mouse set contraints](http://wx2.sinaimg.cn/mw690/006RF1rrgy1fj0yvcwfsoj30u0140gol.jpg)

Compare with "Pin" approach, use "Mouse" is more flexible, and can set alignment, and also set constraints to another base view.



### Auto Layout Tutorial in Xcode with Swift for iOS 11 (Advanced)

* [Auto Layout Tutorial in Xcode with Swift for iOS 11 | iOS Development Tutorial](https://www.youtube.com/watch?v=synofzEkUfU#t=8.607561) // TODO
