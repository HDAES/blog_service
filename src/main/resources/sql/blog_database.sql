/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : blog_database

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 26/01/2021 22:18:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_blog_content
-- ----------------------------
DROP TABLE IF EXISTS `sys_blog_content`;
CREATE TABLE `sys_blog_content`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章ID',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容',
  `path` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章本地地址',
  `read_count` int(10) NULL DEFAULT 0 COMMENT '阅读数量',
  `like_count` int(10) NULL DEFAULT 0 COMMENT '点赞数量',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_blog_content
-- ----------------------------
INSERT INTO `sys_blog_content` VALUES ('1349724745470300162', '', NULL, 0, 0, '2021-01-25 00:08:01', '2021-01-25 00:08:01');
INSERT INTO `sys_blog_content` VALUES ('1354066759607324674', '# Redux 状态管理\n\n## 1.简介\n\nRedux 是 JavaScript 状态容器，提供可预测化的状态管理。[Redux官网](https://redux.js.org/) \n\n## 2.基础\n\n### Action\n\nAction就是把数据从应用传到`store`的有效载荷。它是`store`数据的唯一来源。一般会通过`store.dispatch()`将`action`传到`store`。下面是一个简单`action`例子：\n\n```javascript\nconst ADD_TODO = \"ADD_TODO\"\n\n{\n    type:ADD_TODO,\n    text:\'xxxxxx\'	//这里是从应用中传过来的数据\n}\n```\n\nAction 本质上是 JavaScript 普通对象。我们约定，action 内必须使用一个字符串类型的 `type` 字段来表示将要执行的动作。多数情况下，`type` 会被定义成字符串常量。当应用规模越来越大时，建议使用单独的模块或文件来存放 action。\n\n通常情况下，我们会使用函数的方式返回`action`，这样我就不会考虑`type`的值了，只用关注从应用传递过来的值，这样每一个`action`都是独立的。\n\n```javascript\nconst ADD_TODO = \"ADD_TODO\"\n\nfunction addTode(text){\n    return {\n        type:ADD_TODO,\n        text\n    }\n}\n```\n\n### **Reducers** \n\n**Reducers** 指定了应用状态的变化如何响应 [actions](https://www.redux.org.cn/docs/basics/Actions.html) 并发送到 store 的，记住 actions 只是描述了*有事情发生了*这一事实，并没有描述应用如何更新 state。\n\n 其实`reducers`就是一个纯函数，接受`action`和旧的`state`，返回新的`state`。\n\n```javascript\n(previousState, action) => newState\n```\n\n之所以将这样的函数称之为reducer，是因为这种函数与被传入 [`Array.prototype.reduce(reducer, ?initialValue)`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce) 里的回调函数属于相同的类型。保持 reducer 纯净非常重要。**永远不要**在 reducer 里做这些操作：\n\n- 修改传入参数；\n- 执行有副作用的操作，如 API 请求和路由跳转；\n- 调用非纯函数，如 `Date.now()` 或 `Math.random()`。\n\n下面是一个完整的`reducers`例子：\n\n```javascript\nconst ADD_TODO = \"ADD_TODO\"\n\nconst initState = {\n    name:\'hades\'\n}\n\nexport default ( state = initState, action ) =>{\n    switch (action.type){\n        case ADD_TODO :\n        return {\n          ...state,\n          name:action.name\n      	}\n        default :\n          return{\n           ...state\n        }\n    }\n} \n```\n\n### Store\n\n前面说过使用 [reducers](https://www.redux.org.cn/docs/basics/Reducers.html) 来根据 action 更新 state， **Store** 就是把它们联系到一起的对象。Store 有以下职责：\n\n- 维持应用的 state；\n- 提供 [`getState()`](https://www.redux.org.cn/docs/api/Store.html#getState) 方法获取 state；\n- 提供 [`dispatch(action)`](https://www.redux.org.cn/docs/api/Store.html#dispatch) 方法更新 state；\n- 通过 [`subscribe(listener)`](https://www.redux.org.cn/docs/api/Store.html#subscribe) 注册监听器;\n- 通过 [`subscribe(listener)`](https://www.redux.org.cn/docs/api/Store.html#subscribe) 返回的函数注销监听器。\n\n**Redux 应用只有一个单一的 store**。\n\n### redux-devtools-extension\n\n这是一个redux的插件，需要在创建`store`引入，然后在谷歌浏览器中安装`Redux DevTools`插件，就可以在控制台中查看`state`的值和变化。\n\n```javascript\nimport { createStore } from \'redux\'\nimport { composeWithDevTools } from \'redux-devtools-extension\';\nimport reducers from \'./reducers\'\nexport default () =>createStore(reducers,composeWithDevTools())\n```\n\n## 3.在React中使用Redux\n\nRedux和React之间其实是没有任何关系的，就行`java`和`JavaScript`一样，Redux支持React、Angular、Ember、jQuery 甚至纯 JavaScript。\n\n所以我们使用`react-redux`把两者连接起来。[官网文档](https://react-redux.js.org/)\n\n`react-redux`提供两个重要的组件，一个是`Provider `，另一个是`connect `。Provider 的作用是让App的所有子组件默认都可以拿到state。`connect `的作用是让组件能够获取到state值。\n\n## 4.完整例子\n\n部分代码\n\n```javascript\n// index.js 文件\nimport React from \'react\';\nimport ReactDOM from \'react-dom\';\nimport {Provider } from \'react-redux\'\nimport App from \'./App\';\nimport store from \'./store/store\'\nReactDOM.render(\n  <Provider store={store()}>\n    <App /> \n  </Provider>,  \n  document.getElementById(\'root\')\n);\n\n// store.js\nimport { createStore} from \'redux\'\nimport { composeWithDevTools } from \'redux-devtools-extension\';\nimport reducers from \'./reducers\'\nexport default () =>createStore(reducers,composeWithDevTools())\n\n// action.js\nexport const type ={\n    NAME:\'NAME\'\n}\n\nexport function setName(name){\n    return {\n        type:type.NAME,\n        name\n    }\n}\n\n//reducers.js\nimport { type } from \'./action\'\n\nconst initState = {\n    name:\'hello redux\',\n    age:18\n}\n\nexport default ( state = initState,action) =>{\n    switch(action.type){\n        case type.NAME :\n            return{\n                ...state,\n                name:action.name\n            }\n        default :\n            return {\n                ...state\n            }\n    }\n}\n\n//App.js\nimport React,{ useState} from \'react\';\nimport { setName } from \'./store/action\'\nimport { connect } from \'react-redux\'\nimport \'./app.css\'\nfunction App({name,age,dispatch}) {\n  const [inputName,setInputName] = useState()\n  return (\n    <div className=\"App\">\n      <div className=\"name\">\n        <span>名字：</span>\n        {name}\n      </div>\n      <div className=\"age\">\n        <span>年龄：</span>\n        {age}\n      </div> \n\n      <div className=\"name-input\">\n        <span>名字输入框：</span>\n        <input onChange={(e)=>setInputName(e.target.value)}/>\n        <div style={{marginLeft:20}} onClick={ ()=>dispatch(setName(inputName))} >确定修改			</div>\n      </div>\n        \n    </div>\n  );\n}\n\nconst mapStateToProps = state =>{\n  return {\n    name:state.name,\n    age:state.age\n  }\n}\n\nexport default connect(mapStateToProps)(App);\n\n```\n\n[源码地址](https://github.com/HDAES/example/tree/master/redux-example)', NULL, 0, 0, '2021-01-26 22:04:41', '2021-01-26 22:14:30');
INSERT INTO `sys_blog_content` VALUES ('1354067047999279106', '# Redux 状态管理\n\n## 1.简介\n\nRedux 是 JavaScript 状态容器，提供可预测化的状态管理。[Redux官网](https://redux.js.org/) \n\n## 2.基础\n\n### Action\n\nAction就是把数据从应用传到`store`的有效载荷。它是`store`数据的唯一来源。一般会通过`store.dispatch()`将`action`传到`store`。下面是一个简单`action`例子：\n\n```javascript\nconst ADD_TODO = \"ADD_TODO\"\n\n{\n    type:ADD_TODO,\n    text:\'xxxxxx\'	//这里是从应用中传过来的数据\n}\n```\n\nAction 本质上是 JavaScript 普通对象。我们约定，action 内必须使用一个字符串类型的 `type` 字段来表示将要执行的动作。多数情况下，`type` 会被定义成字符串常量。当应用规模越来越大时，建议使用单独的模块或文件来存放 action。\n\n通常情况下，我们会使用函数的方式返回`action`，这样我就不会考虑`type`的值了，只用关注从应用传递过来的值，这样每一个`action`都是独立的。\n\n```javascript\nconst ADD_TODO = \"ADD_TODO\"\n\nfunction addTode(text){\n    return {\n        type:ADD_TODO,\n        text\n    }\n}\n```\n\n### **Reducers** \n\n**Reducers** 指定了应用状态的变化如何响应 [actions](https://www.redux.org.cn/docs/basics/Actions.html) 并发送到 store 的，记住 actions 只是描述了*有事情发生了*这一事实，并没有描述应用如何更新 state。\n\n 其实`reducers`就是一个纯函数，接受`action`和旧的`state`，返回新的`state`。\n\n```javascript\n(previousState, action) => newState\n```\n\n之所以将这样的函数称之为reducer，是因为这种函数与被传入 [`Array.prototype.reduce(reducer, ?initialValue)`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce) 里的回调函数属于相同的类型。保持 reducer 纯净非常重要。**永远不要**在 reducer 里做这些操作：\n\n- 修改传入参数；\n- 执行有副作用的操作，如 API 请求和路由跳转；\n- 调用非纯函数，如 `Date.now()` 或 `Math.random()`。\n\n下面是一个完整的`reducers`例子：\n\n```javascript\nconst ADD_TODO = \"ADD_TODO\"\n\nconst initState = {\n    name:\'hades\'\n}\n\nexport default ( state = initState, action ) =>{\n    switch (action.type){\n        case ADD_TODO :\n        return {\n          ...state,\n          name:action.name\n      	}\n        default :\n          return{\n           ...state\n        }\n    }\n} \n```\n\n### Store\n\n前面说过使用 [reducers](https://www.redux.org.cn/docs/basics/Reducers.html) 来根据 action 更新 state， **Store** 就是把它们联系到一起的对象。Store 有以下职责：\n\n- 维持应用的 state；\n- 提供 [`getState()`](https://www.redux.org.cn/docs/api/Store.html#getState) 方法获取 state；\n- 提供 [`dispatch(action)`](https://www.redux.org.cn/docs/api/Store.html#dispatch) 方法更新 state；\n- 通过 [`subscribe(listener)`](https://www.redux.org.cn/docs/api/Store.html#subscribe) 注册监听器;\n- 通过 [`subscribe(listener)`](https://www.redux.org.cn/docs/api/Store.html#subscribe) 返回的函数注销监听器。\n\n**Redux 应用只有一个单一的 store**。\n\n### redux-devtools-extension\n\n这是一个redux的插件，需要在创建`store`引入，然后在谷歌浏览器中安装`Redux DevTools`插件，就可以在控制台中查看`state`的值和变化。\n\n```javascript\nimport { createStore } from \'redux\'\nimport { composeWithDevTools } from \'redux-devtools-extension\';\nimport reducers from \'./reducers\'\nexport default () =>createStore(reducers,composeWithDevTools())\n```\n\n## 3.在React中使用Redux\n\nRedux和React之间其实是没有任何关系的，就行`java`和`JavaScript`一样，Redux支持React、Angular、Ember、jQuery 甚至纯 JavaScript。\n\n所以我们使用`react-redux`把两者连接起来。[官网文档](https://react-redux.js.org/)\n\n`react-redux`提供两个重要的组件，一个是`Provider `，另一个是`connect `。Provider 的作用是让App的所有子组件默认都可以拿到state。`connect `的作用是让组件能够获取到state值。\n\n## 4.完整例子\n\n部分代码\n\n```javascript\n// index.js 文件\nimport React from \'react\';\nimport ReactDOM from \'react-dom\';\nimport {Provider } from \'react-redux\'\nimport App from \'./App\';\nimport store from \'./store/store\'\nReactDOM.render(\n  <Provider store={store()}>\n    <App /> \n  </Provider>,  \n  document.getElementById(\'root\')\n);\n\n// store.js\nimport { createStore} from \'redux\'\nimport { composeWithDevTools } from \'redux-devtools-extension\';\nimport reducers from \'./reducers\'\nexport default () =>createStore(reducers,composeWithDevTools())\n\n// action.js\nexport const type ={\n    NAME:\'NAME\'\n}\n\nexport function setName(name){\n    return {\n        type:type.NAME,\n        name\n    }\n}\n\n//reducers.js\nimport { type } from \'./action\'\n\nconst initState = {\n    name:\'hello redux\',\n    age:18\n}\n\nexport default ( state = initState,action) =>{\n    switch(action.type){\n        case type.NAME :\n            return{\n                ...state,\n                name:action.name\n            }\n        default :\n            return {\n                ...state\n            }\n    }\n}\n\n//App.js\nimport React,{ useState} from \'react\';\nimport { setName } from \'./store/action\'\nimport { connect } from \'react-redux\'\nimport \'./app.css\'\nfunction App({name,age,dispatch}) {\n  const [inputName,setInputName] = useState()\n  return (\n    <div className=\"App\">\n      <div className=\"name\">\n        <span>名字：</span>\n        {name}\n      </div>\n      <div className=\"age\">\n        <span>年龄：</span>\n        {age}\n      </div> \n\n      <div className=\"name-input\">\n        <span>名字输入框：</span>\n        <input onChange={(e)=>setInputName(e.target.value)}/>\n        <div style={{marginLeft:20}} onClick={ ()=>dispatch(setName(inputName))} >确定修改			</div>\n      </div>\n        \n    </div>\n  );\n}\n\nconst mapStateToProps = state =>{\n  return {\n    name:state.name,\n    age:state.age\n  }\n}\n\nexport default connect(mapStateToProps)(App);\n\n```\n\n[源码地址](https://github.com/HDAES/example/tree/master/redux-example)', NULL, 0, 0, '2021-01-26 22:04:44', '2021-01-26 22:14:39');
INSERT INTO `sys_blog_content` VALUES ('1354067457518538753', '# Knex 基本用法\n\n## 1.Knexjs简介\n\n一个灵活的、可移植的、使用起来很有趣的`SQL`查询生成器！[官方文档](<https://knexjs.org/>)\n\n`Knex`的主要目标环境是`Node``。您需要安装knex库，然后安装适当的数据库库:`pg用于`PostgreSQL`和Amazon Redshift`, mysql`用于`mysql`或`MariaDB`, `sqlite3`用于`sqlite3`，或者`mssql`用于`mssql`。\n\n------\n\n## 2.安装\n\n```javascript\n$ npm install knex --save\n$ npm install pg\n$ npm install sqlite3\n$ npm install mysql					*\n$ npm install mysql2\n$ npm install oracle\n$ npm install mssql\n```\n\n这里我们选择的是`mysql`数据库，所以我们需要安装 `knex`和`mysql`模块\n\n### 初始化数据库\n\n该`knex`模块本身就是一个函数，它接受Knex的配置对象，接受一些参数。该`client`参数是必需的，用于确定将与库一起使用的客户端适配器。\n\n```javascript\n在目录下创建connect.js文件作为连接模板\nmodule.exports = require(\'knex\')({\n  client: \'mysql\',\n  connection: {\n    host : \'127.0.0.1\',\n    user : \'your_database_user\',\n    password : \'your_database_password\',\n    database : \'myapp_test\'\n  },\n  debug:true,\n  log: {\n    warn(message) {\n    },\n    error(message) {\n    },\n    deprecate(message) {\n    },\n    debug(message) {\n    },\n  },\n   acquireConnectionTimeout: 40000,\n});\n//注：acquireConnectionTimeout默认为60000ms，用于确定在无法获取连接时抛出超时错误之前knex应等待的时间\n\n```\n\n------\n\n## 3.Knex查询生成器\n\n`knex`查询生成器是用于构建和执行标准的`SQL`查询，如界面`select`，`insert`，`update`，`delete`。\n\n### 主要用法：\n\n#### 查询（select）:\n\n创建一个select查询，为查询提供可选的列数组，如果在构建查询时没有指定，则最终默认为*。select调用的响应将使用从数据库中选择的对象数组来解析。\n\n```javascript\n用法一：\nknex(\'books\').select()		//查询`books`表中的所有列\n输出：\nselect * from `books`\n\n\n用法二：	\nknex.select(\'title\', \'author\', \'year\').from(\'books\')		//查询`books`表中`title`,`author`,`year`列\n输出：\nselect `title`, `author`, `year` from `books`\n\n\n用法三：（单条件查询）\nknex(\'users\').where(\'id\', 1)\n输出：\nselect * from `users` where `id` = 1\n\n\n用法四：（多条件查询）\nknex(\'users\').where({\n  first_name: \'Test\',\n  last_name:  \'User\'\n}).select(\'id\')\n输出：\nselect `id` from `users` where `first_name` = \'Test\' and `last_name` = \'User\'\n\n\n用法五：（模糊查询）\nknex(\'users\').where(\'columnName\', \'like\', \'%rowlikeme%\')\n输出：\nselect * from `users` where `columnName` like \'%rowlikeme%\'\n\n用法五：（带算法的查询）\nknex(\'users\').where(\'votes\', \'>\', 100)\n输出：\nselect * from `users` where `votes` > 100\n\n用法六：（连表查询）\n.join(table, first, [operator], second)\nknex(\'users\')\n  .join(\'contacts\', \'users.id\', \'=\', \'contacts.user_id\')\n  .select()\n输出：\nselect * from `users` inner join `contacts` on `users`.`id` = `contacts`.`user_id`\n\n用法七：（限制调试的查询）\nknex.select(\'*\').from(\'users\').limit(10).offset(30)\nOutputs:\nselect * from `users` limit 10 offset 30		//offset:从第几条开始（0为第一条）limit：取几条数据\n\n```\n\n------\n\n\n\n#### 插入（insert）：\n\n创建一个插入查询，将要插入到行中的属性的哈希值或插入数组作为单个插入命令执行。\n\n```javascript\n用法一：\nknex(\'books\').insert({title: \'knex\',author: \'admin\'})\n输出：\ninsert into `books` (`title`,`author`) values (\'knex\',\'admin\')\n```\n\n------\n\n#### 更新（update）：\n\n创建更新查询，根据其他查询约束更新属性哈希值或键/值对。\n\n```javascript\n用法一：\nknex(\'books\').update(\'title\', \'knex\').where({ id: 42 })\n输出：\nupdate `books` set `title` = \'knex\'  where `id` = 42\n```\n\n------\n\n#### 删除（del）：\n\n别名为del，因为删除是JavaScript中的保留字，此方法根据查询中指定的其他条件删除一行或多行。\n\n```javascript\n用法一：\nknex(\'accounts\')\n  .where(\'activated\', false)\n  .del()\n输出：\ndelete from `accounts` where `activated` = false\n```', NULL, 0, 0, '2021-01-26 22:04:47', '2021-01-26 22:14:22');
INSERT INTO `sys_blog_content` VALUES ('1354067629375950850', '# React  Hooks 新特性\n\n## 1.Hooks的介绍\n\nHooks 是React 16.8中的新增功能。 它们使您无需编写类即可使用状态和其他React功能。\n\n## 2.Hooks新增Api\n\n### 2.1.useState\n\n`useState` 通过在函数组件里调用它来给组件添加一些内部 state，`useState`的出现为了解决在函数组件中使用`class`的`setState`。\n\n```react\nimport React, { useState } from \'react\';\nfunction App() {\n  const [count,setCount] = useState(0)\n  console.log(\'render=======\')\n  return (\n    <div>\n        <span>{count}</span>\n        <button onClick={()=>setCount(count+1)}>add</button>\n    </div>\n  );\n}\nexport default App;\n```\n\n这是一个简单的计步器，每当我们点击增加按钮，`count`的值就会增加，并且渲染页面。所以，当`Hooks`函数中的`useState`的值改变时，页面就会重新渲染。\n\n注：当使用`useState`时，执行顺序一定是一样的，及每次执行函数组件，执行结构都是一样的，不存在条件执行在`useState`中。\n\n### 2.2useEffe\n\n`useEffect`的出现时为了代替`class`的生命周期函数。\n\n```react\nuseEffect(()=>{\n    ...do something \n    return ()=>{\n        do something\n    }\n},[])\n```\n\n下面是一个简单的例子，来判断`useEffect`的执行时间\n\n```react\nimport React, { useState ,useEffect} from \'react\';\nfunction App() {\n  const [count,setCount] = useState(0) \n  console.log(\'render\')\n  useEffect(()=>{\n   	console.log(document.getElementById(\'name\'))		//<div id=\"name\">0</div>\n    setCount(10)\n  },[])\n  return (\n    <div>\n        <div id=\"name\">{count}</div>\n        <button onClick={()=>setCount(count+1)}>add</button>\n    </div>\n  );\n}\nexport default App;\n\n```\n\n我们能够直接在`useEffect`中对`document`进行操作，说明它是在 `render`函数执行完之后执行的。我们能够在它中直接对`useState`进行操作，这时浏览器输出\n\n![](http://blog.xl686.com/album/1585807983893.png)\n\n可以很清楚的看到这个函数执行顺序，当我们在`useEffect`中改变`useState`的值后，页面就会重新渲染，会有第二次`render`,但是`useEffect`并没有重复执行，这里就要说下第二个参数。第二个参数的作用决定这个`useEffect`是否执行，为`[]`时，表示只执行一次，当里面的值改变时就会再次执行。 这里感觉有一个小bug，第一次执行的时候，`count`值应该为0，但是通过`docoument`取出来是 改变后的`count`值。	\n\n> `useEffect`里面使用到的state的值, 固定在了`useEffect`内部， 不会被改变，除非`useEffect`刷新，重新固定state的值\n\n```react\nuseEffect(()=>{\n    console.log(document.getElementById(\'name\'))\n   \n   setTimeout(()=>{setCount(10)},1000)\n   setTimeout(()=>{console.log(count)},2000)	//0\n\n  },[])\n\n```\n\n### 2.3useMemo\n\n先看看`memo`的用法，memo针对 一个组件的渲染是否重复执行。\n\n```react\nimport React, { useState, memo } from \'react\';\nfunction App() {\n  const [count,setCount] = useState(0) \n  const [name,setName] = useState(\'hades\')\n  return (  \n    <div>\n        <div id=\"name\">{count}</div>\n        <button onClick={()=>setCount(count+1)}>add</button>\n        <Child/>\n        <Child2 name={name}/>\n    </div>\n  );\n}\n\nconst Child=()=>{\n  console.log(\'child1 render ------\')\n  return(\n    <div>12312</div>\n  )\n}\n\nconst Child2=memo(({name})=>{\n  console.log(\'child2 render ------\'+name )\n  return(\n    <div>12312</div>\n  )\n})\n\nexport default App;\n\n```\n\n`Child`是一个完全无状态的函数组件，每当我们点击增加按钮时，父页面进行刷新，`Child`也会重新渲染，当然这是我们不希望的。当我们使用Memo`方法后，只要传递给子组件的值不改变，则该组件就不会重新渲染。\n\n`useMemo`用来缓存数据，当 组件内部某一个渲染的数据，需要通过计算而来，这个计算是依赖与特定的state、props数据，我们就用`useMemo`来缓存这个数据，以至于我们在修改她们没有依赖的数据源的情况下，多次调用这个计算函数，浪费计算资源，简单例子：\n\n```react\nimport React, { useState } from \'react\';\nfunction App() {\n  \n  const [info,setInfo]=useState({\n    age:18,gender:0\n  })\n  \n  function formatGender(gender) {\n    console.log(\'---调用了翻译性别的方法---\')\n    return gender === 0 ? \'男\' : \'女\'\n  }\n  return (  \n    <div>\n        <div>年龄：{info.age}</div>\n        <div>性别：{formatGender(info.gender)}</div>\n        <button onClick={()=>setInfo({ age:20,gender:0})}>修改年龄</button>\n    </div>\n  );\n}\nexport default App;\n```\n\n当我们修改`info`的值时，函数就会重复执行，也会执行`formatGender`方法。这里我们并没有修改`gender`字段，所以我们并想再调用方法格式化性别，这里我们就可以使用`useMemo`把他保存起来，只有当他改变时，才执行，改进后去下： \n\n```react\nimport React, { useState,useMemo } from \'react\';\nfunction App() {\n  \n  const [info,setInfo]=useState({\n    age:18,gender:0\n  })\n  \n  function formatGender(gender) {\n    console.log(\'---调用了翻译性别的方法---\')\n    return gender === 0 ? \'男\' : \'女\'\n  }\n\n  let gender = useMemo(()=>{\n    return formatGender(info.gender)\n  },[info.gender])\n  return (  \n    <div>\n        <div>年龄：{info.age}</div>\n        <div>性别：{gender}</div>\n        <button onClick={()=>setInfo({ age:20,gender:0})}>修改年龄</button>\n        <button onClick={()=>setInfo({ age:22,gender:1})}>修改性别</button>\n    </div>\n  );\n}\nexport default App;\n```\n\n当我们修改年龄是并不会掉用`formatGender`方法，修改性别时才会调用。\n\n### 2.4useCallback\n\n上一节我们说了，`useMemo`是用来缓存数据的，`useCallback`就是用来缓存方法的，下面为一个没使用`useCallback`的例子：\n\n```react\nimport React, { useState,memo} from \'react\';\nconst Child = memo(({onChange}) =>{\n  console.log(\'child render...\')\n  return (\n      <div>\n          <input type=\"text\" onChange={onChange}/>\n      </div>\n  );\n})\n\nconst Hook =()=>{\n  console.log(\'Hook render...\')\n  const [name,setName]=useState(\'hades\')\n  \nconst onChange = (e)=>{\n  setName(e.target.value)\n}\n  return(\n      <div>\n          <span>{name}</span>\n          <Child  onChange={onChange} />\n      </div>\n  )\n}\nexport default Hook;\n```\n\n当子组件触发`onChange`方法是，会调用父组件的的方法改变`useState`，从而重新渲染页面。但是，这里`memo`判断传入的`onChange`方法是新的方法，从而子组件也会重新渲染。所以我们需要使用`useCallback`把`onChange`方法缓存起来，这样`memo`就会判断为同一方法，子组件就不会重复渲染。改进后的方法为：\n\n```react\nconst onChange = useCallback((e)=>{\n  setName(e.target.value)\n},[])\n```\n\n所以，往往`useCallback`是和`memo`一起使用的。\n\n## 3.完整的例子\n\n```react\nimport React, { useState,memo,useCallback,useMemo,useEffect} from \'react\';\n\nconst App = () =>{\n  console.log(\'App render----------\')\n  const [name,setName]=useState(\'hades\')\n  const [age,setAge]=useState(18)\n  const [gender,setGender]=useState(0)\n\n  useEffect(()=>{\n    console.log(\'当前age为：\'+age)\n  },[age])\n  \n  function formatGender(gender) {\n    console.log(\'---调用了翻译性别的方法---\')\n    return gender === 0 ? \'男\' : \'女\'\n  }\n  \n  const memoGender = useMemo(()=>{\n    return formatGender(gender)\n  },[gender])\n\n  const onChange = useCallback((e) =>{\n    setName(e.target.value)\n  },[])\n\n  return (\n    <div>\n      <div>名字：{name}</div>\n      <div>年龄：{age}</div>\n      <div>性别：{memoGender}</div>\n      <button onClick={()=>{setAge(age+1)}}>Add Age</button>\n      <button onClick={()=>setGender(1)}>Change Gender</button>\n      <Child onChange={onChange}/>\n    </div>\n  )\n}\n\nconst Child = memo(({onChange}) =>{\n  console.log(\'Child render----------\')\n  return(\n    <div>\n      <input onChange={onChange}/>\n    </div>\n  )\n})\n\nexport default App\n```\n\n', NULL, 0, 0, '2021-01-26 22:04:49', '2021-01-26 22:12:03');

-- ----------------------------
-- Table structure for sys_blog_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_blog_details`;
CREATE TABLE `sys_blog_details`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详情ID',
  `s_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类ID',
  `t_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '博客标题',
  `des` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '博客描述',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '博客图片',
  `source` int(11) NULL DEFAULT 0 COMMENT '来源 0: 原创  1:转载',
  `type` int(11) NULL DEFAULT 2 COMMENT '0: pc和小程序 1:微信小程序 2：pc',
  `order_in` int(11) NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_blog_details
-- ----------------------------
INSERT INTO `sys_blog_details` VALUES ('1354066759607324674', '1346353547930595330', '1346657358586925057', 'Redux for React', 'react 状态管理', 'https://hades0512.oss-cn-beijing.aliyuncs.com/1586667804480.png', 0, 0, 0, '2021-01-26 22:00:47', '2021-01-26 22:00:47');
INSERT INTO `sys_blog_details` VALUES ('1354067047999279106', '1346353547930595330', '1354066876603240450', '数组的排序（奇淫技巧）', '一篇关于数组排序的奇淫技巧', 'https://hades0512.oss-cn-beijing.aliyuncs.com/1587994945916.jpg', 0, 0, 0, '2021-01-26 22:01:56', '2021-01-26 22:01:56');
INSERT INTO `sys_blog_details` VALUES ('1354067457518538753', '1346353547930595330', '1354067333400694786', 'KnexJs', 'KnexJs对MySql数据库的基本操作', 'https://hades0512.oss-cn-beijing.aliyuncs.com/1585833654922.png', 0, 0, 0, '2021-01-26 22:03:34', '2021-01-26 22:03:34');
INSERT INTO `sys_blog_details` VALUES ('1354067629375950850', '1346353547930595330', '1346657358586925057', 'React Hooks新特性', '带你了解最新的 React Hooks ', 'https://hades0512.oss-cn-beijing.aliyuncs.com/1585809321031.png', 0, 0, 0, '2021-01-26 22:04:15', '2021-01-26 22:04:15');

-- ----------------------------
-- Table structure for sys_blog_saying
-- ----------------------------
DROP TABLE IF EXISTS `sys_blog_saying`;
CREATE TABLE `sys_blog_saying`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名言ID',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `deleted` int(255) NULL DEFAULT 0 COMMENT '是否删除 0：未删除 1 ：删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_blog_saying
-- ----------------------------
INSERT INTO `sys_blog_saying` VALUES ('1354061719454814209', '追逐梦想就是追逐自己的厄运，满地都是六便士，他却抬头看见了月亮。', '——毛姆《月亮与六便士》', 0, '2021-01-26 21:40:46', '2021-01-26 21:40:46');

-- ----------------------------
-- Table structure for sys_blog_sort
-- ----------------------------
DROP TABLE IF EXISTS `sys_blog_sort`;
CREATE TABLE `sys_blog_sort`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID 主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `type` int(11) NULL DEFAULT 0 COMMENT '0: pc和小程序 1:微信小程序 2：pc',
  `deleted` int(11) NULL DEFAULT 0 COMMENT '删除状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_blog_sort
-- ----------------------------
INSERT INTO `sys_blog_sort` VALUES ('1346035174449393665', 'string', 'string', '1245346456', 0, 1);
INSERT INTO `sys_blog_sort` VALUES ('1346289147920072706', '123', '12312', 'https://hades0512.oss-cn-beijing.aliyuncs.com/de.jpg', 0, 1);
INSERT INTO `sys_blog_sort` VALUES ('1346337337323126786', 'JavaScript', 'nihao', 'https://hades0512.oss-cn-beijing.aliyuncs.com/1583836605249.jpg', 0, 1);
INSERT INTO `sys_blog_sort` VALUES ('1346339473540874241', '1321', '1233', 'https://hades0512.oss-cn-beijing.aliyuncs.com/1583836605249.jpg', 0, 1);
INSERT INTO `sys_blog_sort` VALUES ('1346353547930595330', 'JavaScript', 'icon-javascript', 'https://hades0512.oss-cn-beijing.aliyuncs.com/1583836605249.jpg', 0, 0);
INSERT INTO `sys_blog_sort` VALUES ('1350727272017825794', 'Flutter', 'flutter', 'https://hades0512.oss-cn-beijing.aliyuncs.com/src=http___b-ssl.duitang.com_uploads_item_201805_15_20180515163422_2mACE.thumb.700_0.jpeg&refer=http___b-ssl.duitang.jpg', 0, 1);
INSERT INTO `sys_blog_sort` VALUES ('1354058223716360194', 'Flutter', 'icon-flutter', 'https://hades0512.oss-cn-beijing.aliyuncs.com/1584204001283.png', 0, 0);
INSERT INTO `sys_blog_sort` VALUES ('1354058425105866754', 'Library', 'icon-ku', 'https://hades0512.oss-cn-beijing.aliyuncs.com/logo.png', 0, 0);
INSERT INTO `sys_blog_sort` VALUES ('1354058502964731905', 'Recommend', 'icon-music', 'https://hades0512.oss-cn-beijing.aliyuncs.com/1584204171627.png', 0, 0);

-- ----------------------------
-- Table structure for sys_blog_tags
-- ----------------------------
DROP TABLE IF EXISTS `sys_blog_tags`;
CREATE TABLE `sys_blog_tags`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签ID',
  `s_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类ID',
  `t_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名字',
  `t_icon` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签图标',
  `deleted` int(11) NULL DEFAULT 0 COMMENT '删除状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_blog_tags
-- ----------------------------
INSERT INTO `sys_blog_tags` VALUES ('1346385377467678722', '1346353547930595330', 'Vue', 'vue', 1);
INSERT INTO `sys_blog_tags` VALUES ('1346393316765016065', '1346353547930595330', 'React', 'react', 1);
INSERT INTO `sys_blog_tags` VALUES ('1346657358586925057', '1346353547930595330', 'React', 'react', 0);
INSERT INTO `sys_blog_tags` VALUES ('1350713703477940225', '1346353547930595330', 'Vue', 'vue', 0);
INSERT INTO `sys_blog_tags` VALUES ('1354066876603240450', '1346353547930595330', 'Js', 'js', 0);
INSERT INTO `sys_blog_tags` VALUES ('1354067333400694786', '1346353547930595330', 'node', 'node', 0);

-- ----------------------------
-- Table structure for sys_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_menus`;
CREATE TABLE `sys_menus`  (
  `id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单ID',
  `m_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '父级ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名字',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单地址',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单Icon',
  `sort` int(11) NULL DEFAULT 0 COMMENT '菜单排序',
  `status` int(11) NULL DEFAULT 0 COMMENT '菜单状态',
  `deleted` int(11) NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menus
-- ----------------------------
INSERT INTO `sys_menus` VALUES ('1334509795264266242', '0', '首页', '/index', '/icon', 1, 0, 0, '2020-12-03 22:48:24', '2020-12-03 22:48:24');
INSERT INTO `sys_menus` VALUES ('1334509886049976322', '0', 'ui', '/ui', '/icon-ui', 3, 0, 0, '2020-12-03 22:48:45', '2020-12-13 20:52:26');
INSERT INTO `sys_menus` VALUES ('1334510029532921858', '1334509886049976322', 'Button', '/ui/button', '/icon-ui', 0, 0, 0, '2020-12-03 22:49:20', '2020-12-03 22:49:20');
INSERT INTO `sys_menus` VALUES ('1334510221418135554', '0', '权限管理', '/auth', '/icon-auth', 2, 0, 0, '2020-12-03 22:50:05', '2020-12-03 22:50:05');
INSERT INTO `sys_menus` VALUES ('1334512533704331266', '1334509886049976322', '1313123', '/ui/dilog', 'string', 0, 0, 1, '2020-12-03 22:59:17', '2020-12-04 12:08:18');
INSERT INTO `sys_menus` VALUES ('1334687759586869250', '0', '日志', '/logs', 'string', 4, 0, 0, '2020-12-04 10:35:34', '2020-12-04 10:35:34');
INSERT INTO `sys_menus` VALUES ('1337939648898404354', '1334510221418135554', '菜单', '/auth/menus', '/icon', 2, 0, 0, '2020-12-13 09:57:25', '2020-12-13 21:54:47');
INSERT INTO `sys_menus` VALUES ('1337980579520512001', '1334509886049976322', '轮播图', '/swiper', 'swiper', 0, 0, 1, '2020-12-13 12:40:03', '2020-12-16 11:13:09');
INSERT INTO `sys_menus` VALUES ('1338044026334507010', '0', 'hades23123', '/hades', '1232', 10, 0, 1, '2020-12-13 16:52:10', '2020-12-13 18:08:31');
INSERT INTO `sys_menus` VALUES ('1338120069035687937', '1334510221418135554', '用户组', '/auth/group', NULL, 1, 0, 0, '2020-12-13 21:54:20', '2020-12-13 21:54:59');
INSERT INTO `sys_menus` VALUES ('1339045997518311425', '1334510221418135554', '用户', '/auth/user', NULL, 0, 0, 0, '2020-12-16 11:13:39', '2020-12-16 11:28:52');
INSERT INTO `sys_menus` VALUES ('1339763191164289026', '1334509886049976322', '弹窗', '/ui/modal', NULL, 0, 0, 0, '2020-12-18 10:43:31', '2020-12-18 14:46:54');
INSERT INTO `sys_menus` VALUES ('1339824630574989314', '1334509886049976322', '抽屉', '/ui/drawer', NULL, 0, 0, 0, '2020-12-18 14:47:39', '2020-12-18 14:47:39');
INSERT INTO `sys_menus` VALUES ('1340134770171797506', '1334509886049976322', 'loading', '/ui/loading', NULL, 0, 0, 0, '2020-12-19 11:20:02', '2020-12-19 11:20:55');
INSERT INTO `sys_menus` VALUES ('1340140297954091009', '1334509886049976322', '通知提示', '/ui/note', NULL, 0, 0, 0, '2020-12-19 11:42:00', '2020-12-19 11:42:00');
INSERT INTO `sys_menus` VALUES ('1340218162262286337', '1334509886049976322', 'Tabs', '/ui/tabs', NULL, 0, 0, 1, '2020-12-19 16:51:25', '2020-12-19 16:51:25');
INSERT INTO `sys_menus` VALUES ('1340218162262286338', '1334509886049976322', 'Tabs', '/ui/tabs', NULL, 0, 0, 1, '2020-12-19 16:51:25', '2020-12-19 16:51:25');
INSERT INTO `sys_menus` VALUES ('1340218434980126722', '1334509886049976322', 'Tabs', '/ui/tabs', NULL, 0, 0, 0, '2020-12-19 16:52:30', '2020-12-19 16:52:30');
INSERT INTO `sys_menus` VALUES ('1340223597518233601', '1334509886049976322', 'Emoji', '/ui/emoji', NULL, 0, 0, 0, '2020-12-19 17:13:00', '2020-12-19 17:13:00');
INSERT INTO `sys_menus` VALUES ('1340307458734399490', '0', '图表', '/chart', NULL, 3, 0, 0, '2020-12-19 22:46:15', '2020-12-19 22:46:15');
INSERT INTO `sys_menus` VALUES ('1340309220111392770', '1340307458734399490', '折线图', '/chart/line', NULL, 0, 0, 0, '2020-12-19 22:53:14', '2020-12-19 22:53:14');
INSERT INTO `sys_menus` VALUES ('1340322176823959553', '1340307458734399490', '条形图', '/chart/bar', NULL, 0, 0, 0, '2020-12-19 23:44:44', '2020-12-19 23:44:44');
INSERT INTO `sys_menus` VALUES ('1340327928586280962', '1340307458734399490', '饼图', '/chart/pie', NULL, 0, 0, 0, '2020-12-20 00:07:35', '2020-12-20 00:07:35');
INSERT INTO `sys_menus` VALUES ('1340334276615053314', '1340307458734399490', '水波图', '/chart/liquid', NULL, 0, 0, 0, '2020-12-20 00:32:48', '2020-12-20 00:32:48');
INSERT INTO `sys_menus` VALUES ('1340663453255966722', '1340307458734399490', '词云图', '/chart/word', NULL, 0, 0, 0, '2020-12-20 22:20:50', '2020-12-20 22:20:50');
INSERT INTO `sys_menus` VALUES ('1340669440910139394', '0', '编辑器', '/editor', NULL, 3, 0, 0, '2020-12-20 22:44:38', '2020-12-20 22:44:38');
INSERT INTO `sys_menus` VALUES ('1340669660444205057', '1340669440910139394', 'Braft-editor', '/editor/braft', NULL, 0, 0, 0, '2020-12-20 22:45:30', '2020-12-20 22:45:30');
INSERT INTO `sys_menus` VALUES ('1346017348217053185', '1334509886049976322', '轮播图', '/ui/carousel', NULL, 0, 0, 0, '2021-01-04 16:55:18', '2021-01-04 16:55:18');
INSERT INTO `sys_menus` VALUES ('1346027299119407105', '0', '博客管理', '/blog', NULL, 3, 0, 0, '2021-01-04 17:34:51', '2021-01-04 17:34:51');
INSERT INTO `sys_menus` VALUES ('1346029084877889538', '1346027299119407105', '分类', '/blog/sort', NULL, 0, 0, 0, '2021-01-04 17:41:57', '2021-01-04 17:41:57');
INSERT INTO `sys_menus` VALUES ('1346357882127216641', '1346027299119407105', '标签', '/blog/tags', NULL, 0, 0, 0, '2021-01-05 15:28:28', '2021-01-05 15:28:50');
INSERT INTO `sys_menus` VALUES ('1346668818037735425', '1346027299119407105', '博客详情', '/blog/details', NULL, 0, 0, 0, '2021-01-06 12:04:01', '2021-01-06 12:04:01');
INSERT INTO `sys_menus` VALUES ('1354058827566112770', '1346027299119407105', '名言', '/blog/saying', NULL, 0, 0, 0, '2021-01-26 21:29:16', '2021-01-26 21:29:16');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `pass_word` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `type` int(10) UNSIGNED NULL DEFAULT 5 COMMENT '用户类型：0(default): 超级管理员 1：管理员  5：游客',
  `group_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户组ID',
  `status` int(11) NULL DEFAULT 0 COMMENT '用户状态： 0：激活  1：未激活',
  `deleted` int(11) NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1339578972312211458', 'iu', 'hades', 'baca962007e33c803f9925eb0835c861', 5, '1334742747201794049', 0, 1, '2020-12-17 22:31:30', '2020-12-17 22:31:30');
INSERT INTO `sys_user` VALUES ('1339753742798274561', '肖磊', 'hades', 'baca962007e33c803f9925eb0835c861', 5, '1334742747201794049', 0, 0, '2020-12-18 10:05:58', '2020-12-18 10:05:58');
INSERT INTO `sys_user` VALUES ('1339756352087375874', '123112312', '12312', '3a7264ee6a44603c0b411862f4316856', 5, '1339025188347236354', 0, 0, '2020-12-18 10:16:20', '2020-12-18 10:16:37');

-- ----------------------------
-- Table structure for sys_user_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_group`;
CREATE TABLE `sys_user_group`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户组ID',
  `g_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户组名字',
  `menus` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户组权限菜单',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_group
-- ----------------------------
INSERT INTO `sys_user_group` VALUES ('1334742747201794049', '超级管理员', '1334687759586869250,1334509795264266242,1334510221418135554,1339045997518311425,1338120069035687937,1337939648898404354,1334509886049976322,1334510029532921858,1339763191164289026,1339824630574989314,1340134770171797506,1340140297954091009,1340218434980126722,1340223597518233601,1340669440910139394,1340669660444205057,1340309220111392770,1340322176823959553,1340327928586280962,1340334276615053314,1340307458734399490,1346027299119407105,1346029084877889538,1346357882127216641,1346668818037735425,1354058827566112770', '2020-12-04 14:14:04', '2021-01-26 21:35:41');
INSERT INTO `sys_user_group` VALUES ('1339025188347236354', '游客', '1334509795264266242', '2020-12-16 09:50:57', '2020-12-16 09:50:57');

SET FOREIGN_KEY_CHECKS = 1;
