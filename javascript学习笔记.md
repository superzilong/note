| 版本 | 描述 | 时间           |
|      |      |                |
| v1   | 创建 | 2019年10月31日 |


[TOC]
#Javascript学习笔记
![logo](https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTDGdDnSI__JR_jzxRm6qUztp60yvPaBcNc3K9Bu8NTqZDd02JS)
##1 简介
Introduce from wiki:
>JavaScript (/ˈdʒɑːvəˌskrɪpt/), often abbreviated as JS, is a high-level, interpreted scripting language that conforms to the ECMAScript specification. JavaScript has curly-bracket syntax, dynamic typing, prototype-based object-orientation, and first-class functions.

>Alongside HTML and CSS, JavaScript is one of the core technologies of the World Wide Web. JavaScript enables interactive web pages and is an essential part of web applications. The vast majority of websites use it, and major web browsers have a dedicated JavaScript engine to execute it.

>As a multi-paradigm language, JavaScript supports event-driven, functional, and imperative (including object-oriented and prototype-based) programming styles. It has APIs for working with text, arrays, dates, regular expressions, and the DOM, but the language itself does not include any I/O, such as networking, storage, or graphics facilities. It relies upon the host environment in which it is embedded to provide these features.

>Initially only implemented client-side in web browsers, JavaScript engines are now embedded in many other types of host software, including server-side in web servers and databases, and in non-web programs such as word processors and PDF software, and in runtime environments that make JavaScript available for writing mobile and desktop applications, including desktop widgets.

总的来说就是JavaScript是一个解释型的脚本语言，它包含动态类型，基于原型，面向对象，函数优先的特性。
Javascript起初主要应用于浏览器端，作用于网页交互。现今已经发展到服务端的应用，移动端的应用和桌面应用等领域。

##2 数据类型
###2.1 Bool
true和false
###2.2 数值
javscript的内部，所有数字都是以64位浮点数存储，特殊数字包括NAN和Infinity
###2.3 字符串
字符串就是零个或多个排在一起的字符，放在单引号或者或双引号之中。
注意:

* 如果在非特殊字符前面使用反斜杠，则反斜杠会被省略。
```javascript
'\a'
// "a"
```
* 无法改变字符串中的单个字符
```javascript
var s = 'hello';

delete s[0];
s // "hello"

s[1] = 'a';
s // "hello"

s[5] = '!';
s // "hello"
```
* 由于 HTML 语言的属性值使用双引号，所以很多项目约定 JavaScript 语言的字符串只使单引号。
* 我们还需要知道，每个字符在 JavaScript 内部都是以16位（即2个字节）的 UTF-16 格式储存。也就是说，JavaScript 的单位字符长度固定为16位长度，即2个字节。JavaScript 对 UTF-16 的支持是不完整的，由于历史原因，只支持两字节的字符，不支持四字节的字符。
###2.4 对象
###2.5 函数
###2.6 数组
###2.7 null和undefined
```javascript
undefined == null
// true undefined与null都被转换为false
Number(null) // 0
Number(undefined) // NaN
```
###2.8 数据类型转换
强制转换和自动转换
##3. 运算符
##4. 语法专题
###4.1 if while

###4.2 异常处理
Javascript语言原生提供**Error**构造函数来跑出异常。try{...}catch{...}finally{...}
##5 面向对象
##6 常用操作
###6.1 console
###6.2 正则表达式
###6.3 异步操作
###6.4 DOM操作
##7 编程风格
* 大括号的起首跟在关键字之后
* 函数的声明和调用的地方，函数名和小括号之间没有空格
