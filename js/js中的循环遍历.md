# js中的循环遍历

## 原理

我们可以从typescript中接口德定义来了解javascript中遍历的实现原理, 以下代码是typescript中定义遍历所用到的接口:

1. Iterable是给Array, Set 或者Map等可遍历的对象实现的接口, 该接口中包含一个系统定义的symbol来作为函数名,并返回一个Iterator接口;
2. Iterator接口包含一个next函数,并返回一个IterationResult接口;
3. IterationResult接口定义了两个属性, 一个是value, 一个是done, 当done为true时循环结束.

```javascript
interface Iterable {
  [Symbol.iterator]() : Iterator,
}

interface Iterator {
  next(value?: any) : IterationResult,
}

interface IterationResult {
  value: any,
  done: boolean,
}
```

## 使用场合

* 当使用for...of...循环时, 会自动找到遍历对象中的Symbol.iterator属性, 拿到iterator后进行循环.
* 当使用剩余参数(rest parameters)时:

```javascript
let arr = [1, 2, 3];
let [first, ...rest] = arr;
// first = 1; rest = [2, 3];
```

* 当使用扩展运算符时(spread operator)时:

```javascript
let arr = [1, 2, 3];
let arr_copy = [...arr];
// arr_copy = [1, 2, 3];
```

* 当使用Generator时候
