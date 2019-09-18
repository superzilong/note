# Vue基础之绑定语法

1. **{{}}** 将HTML元素值和vue对象的data成员进行绑定
```html
<div id="vue_det">
    <h1>site : {{site}}</h1>
    <h1>url : {{url}}</h1>
    <h1>{{details()}}</h1>
</div>
```
2. **v-bind** 将HTML元素属性和vue对象的data成员进行绑定。
```html
<!-- 完整语法 -->
<a v-bind:href="url"></a>
<!-- 缩写 -->
<a :href="url"></a>
```
3. **v-on** 将DOM事件与vue对象中的methods属性进行绑定。
```html
<!-- 完整语法 -->
<a v-on:click="doSomething"></a>
<!-- 缩写 -->
<a @click="doSomething"></a>
```
4. **v-if** 将HTML元素的visibility属性与data成员(bool)进行绑定, true/false对应visible/collapsed。
```html
<div id="app">
    <p v-if="seen">现在你看到我了</p>
</div>
```
5. **v-model** 指令用来在 input、select、textarea、checkbox、radio 等表单控件元素上创建双向数据绑定，根据表单上的值，自动更新绑定的元素的值。
```html
<div id="app">
    <p>{{ message }}</p>
    <input v-model="message">
</div>
<script>

new Vue({
  el: '#app',
  data: {
    message: 'Runoob!'
  }
})
</script>
```
6. **filer** 对绑定的vue对象中的data成员进行转换运算
```html
<div id="app">
  {{ message | capitalize }}
</div>
    
<script>
new Vue({
  el: '#app',
  data: {
    message: 'runoob'
  },
  filters: {
    capitalize: function (value) {
      if (!value) return ''
      value = value.toString()
      return value.charAt(0).toUpperCase() + value.slice(1)
    }
  }
})
</script>
```