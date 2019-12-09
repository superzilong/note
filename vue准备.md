# 搭建vue开发环境
1. dowload nodejs LTS version;
2. 可选安装nvm 对nodejs进行版本管理
3. install vue cli: `npm install -g @vue/cli`,use `vue -V` to check version;
4. 如果之前安装了vue3之前的版本,需要使用npm uninstall vue-cli -g卸载
5. 更新npm镜像源
6. Use command to create a project: vue create XXX
7. setting: pick `all` modules, use `hash mode` to develop, use `Sass/SCSS` to pre-process css, use `Prettier` as a linter/formatter, use `Lint on save`
8. create `vue.config.js` in the project root directory.
9. use element ui `npm i element-ui S`