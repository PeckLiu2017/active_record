<<<<<<< HEAD
# 绝对路径与相对路径的原理
### 绝对路径与相对路径
像`/public/image.jpg`这样以``"/"``开头的路径是绝对路径,像`./public/image.jpg`以``'./'``开头,`../public/image.jpg`以``'../'``开头,`../../public/image.jpg`以``'../../'``开头,或者开头什么也不加比如`public/image.jpg`这类的路径是相对路径。
### 相对路径的写法
假设有如下几个文件：
- public/Dir1/SubDir1/Ref1.html
- public/Dir1/SubDir2/Ref2.html
- public/Dir2/SubDir3/Ref3.html
- public/Dir2/SubDir4/Ref4.html
- public/Dir2/SubDir4/SubDir5/Ref5.html
- public/Dir2/Ref6.html
他们有的路径层次较多，有的路径层次较浅，这时我选一个`public/Dir2/SubDir4/Ref4.html`这个路径层次处于中间比较特殊的文件作为研究对象，来探究绝对路径与相对路径的写法。
### 几种相对路径表示方法
- 路径开头什么也没有表示同级目录。
- `.`或`./`表示当前目录。
- `..`或``'../'``表示上一级目录。
- 以此类推，`../../`表示上上级目录。
### 页面链接绝对路径与相对路径
相对路径的计算采取"向上向下原则"（自己命名的原则下面会阐述）运用上述'./'等几种相对路径表示方法灵活表示路径，绝对路径的计算从路径开头的'/'符号开始直至到达目标位置。
- 本页：``public/Dir2/SubDir4/Ref4.html``
- 到达跟它同一目录的public/Dir2/SubDir4/Ref7.html:
`<a href="Ref7.html">"Ref7.html"</a>--it lead to http://localhost:3000/Dir2/SubDir4/Ref7.html in my project
`
- 到达它同级文件`public/Dir2/SubDir4/SubDir5`的下一级目录中文件`public/Dir2/SubDir4/SubDir5/Ref5.html`:
`<a href="SubDir5/Ref5.html">"SubDir5/Ref5.html"</a>--it lead to http://localhost:3000/Dir2/SubDir4/SubDir5/Ref5.html in my project`
- 到达它父级文件的同级文件`public/Dir2/Ref6.html`:
`<a href="../Ref6.html">"../Ref6.html"</a>--it lead to http://localhost:3000/Dir2/Ref6.html in my project`
- 到达文件`public/Dir1/SubDir1/Ref1.html`，这需要越过当前路径`SubDir4`向上两级到达`public`，然后向下两级到达到达`public/Dir1/SubDir1`，寻找`Ref1.html`
`<a href="../../Dir1/SubDir1/Ref1.html">"../../Dir1/SubDir1/Ref1.html"</a>--it lead to http://localhost:3000/Dir1/SubDir1/Ref1.html in my project`
- 同理到达public/Dir1/SubDir2/Ref2.html：
`<a href="../../Dir1/SubDir2/Ref2.html">"../../Dir1/SubDir2/Ref2.html"</a>--it lead to http://localhost:3000/Dir1/SubDir2/Ref2.html in my project`
- 如果到达public/Dir2/SubDir3/Ref3.html，这需要越过当前路径`SubDir4`，向上一级到达`Dir2`，然后向下到达`public/Dir2/SubDir3`，寻找`Ref3.html`
### 总结：
- 路径的填写跟它的深浅层次有关。
- 绝对路径是指目录下的绝对位置，直接到达目标位置，通常是从盘符开始的路径。完整的描述文件位置的路径就是绝对路径，如果在网站上，是以web站点根目录为参考基础的目录路径。
- 相对路径就是指从这个文件所在的路径开始计算的跟其它文件（或文件夹）的路径关系。使用相对路径可以为我们带来非常多的便利。
=======
如果直接用绝对路径一下到底一目了然, 大家都看得懂。但相对路径有时在目录前加``'./'``,``'../'``,``'../../'``,或者有时候什么也不加比如`public/image.jpg`就让我有些迷惑。


先看看有没有共同父目录。
哪一个目录深，哪一个目录浅
深目录引用浅目录要视情况多加"../"
浅目录引用深目录要视情况少加或者不加"../"

比如，public/Dir1/SubDir1/Ref1.html,相对于public文件的层次为3层
public/Dir1/SubDir2/Ref2.html,相对于public文件的层次为3层
public/Dir2/SubDir3/Ref3.html,相对于public文件的层次为3层
public/Dir2/SubDir4/Ref4.html,相对于public文件的层次为3层
public/Dir2/SubDir4/SubDir5/Ref5.html,相对于public文件的层次为4层
public/Dir2/Ref6.html,相对于public文件的层次为2层



|      |       引用另一文件的页面         |       被另一文件引用的页面       | 引用页面相对于被引用页面的深浅层次 |      最终引用路径       |
| ---- | ----------------------------- | ----------------------------- | ---------------------------- | --------------------- |
|      | public/Dir1/SubDir1/Ref1.html | public/Dir1/SubDir2/Ref2.html |               0              | ../SubDir2/Ref2.html  |
|      | public/Dir1/SubDir1/Ref1.html | public/Dir2/SubDir3/Ref3.html |               0              | ../../Dir2/SubDir3/Ref3.html |
|      | public/Dir1/SubDir1/Ref1.html | public/Dir2/SubDir4/Ref4.html |               0              |            |
|      | public/Dir1/SubDir1/Ref1.html | public/Dir2/SubDir4/SubDir5/Ref5.html |              -1              |            |
|      | public/Dir1/SubDir2/Ref2.html |     public/Dir2/Ref6.html     |               1              |            |
|      | public/Dir1/SubDir2/Ref2.html | public/Dir2/SubDir3/Ref3.html |                              |            |
|      | public/Dir1/SubDir2/Ref2.html | public/Dir2/SubDir4/Ref4.html |                              |            |
|      | public/Dir1/SubDir2/Ref2.html |     public/Dir2/Ref5.html     |                              |            |
|      | public/Dir2/SubDir3/Ref3.html | public/Dir1/SubDir1/Ref1.html |                              |   d        |
|      | public/Dir2/SubDir3/Ref3.html | public/Dir1/SubDir2/Ref2.html |                   |        |
|      | public/Dir2/SubDir3/Ref3.html | public/Dir2/SubDir4/Ref4.html |                   |        |
|      | public/Dir2/SubDir3/Ref3.html |                               |                   |        |
|      | public/Dir2/SubDir4/Ref4.html |                               |                   |        |
|      | public/Dir2/SubDir4/Ref4.html |                               |                   |        |
|      | public/Dir2/SubDir4/Ref4.html |                               |                   |        |
|      | public/Dir2/SubDir4/Ref4.html |                               |                   |        |
|      |     public/Dir2/Ref5.html     |                               |                   |        |
|      |     public/Dir2/Ref5.html     |                               |                   |        |
|      |     public/Dir2/Ref5.html     |                               |                   |        |
|      |     public/Dir2/Ref5.html     |                               |                   |        |
|      |                               |                               |                   |        |
|      |                               |                               |                   |        |
|      |                               |                               |                   |        |
|      |                               |                               |                   |        |
|      |                               |                               |                   |        |
|      |                               |                               |                   |        |
|      |                               |                               |                   |        |
|      |                               |                               |                   |        |
|      |                               |                               |                   |        |
|      |                               |                               |                   |        |
|      |                               |                               |                   |        |
>>>>>>> 124a07c... get a right demo
