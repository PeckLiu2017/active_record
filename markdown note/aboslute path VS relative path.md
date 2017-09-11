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
