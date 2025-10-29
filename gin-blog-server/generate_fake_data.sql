-- 生成假文章数据
INSERT INTO article (title, category_id, `desc`, content, img, comment_count, read_count, is_top, type, status, is_delete, user_id)
VALUES
-- 后端文章
('Go语言并发编程实战', 1, '深入讲解Go语言的goroutine和channel使用方法', '## Go语言并发编程\n\nGo语言通过goroutine和channel提供了强大的并发编程能力。\n\n### goroutine基础\ngoroutine是Go语言中的轻量级线程，由Go运行时管理。\n\n```go\nfunc main() {\n    go fmt.Println("Hello from goroutine")\n    fmt.Println("Hello from main")\n    time.Sleep(time.Second)\n}\n```\n\n### channel通信\nchannel是goroutine之间的通信机制。\n\n```go\nch := make(chan int)\ngo func() {\n    ch <- 42\n}()\nvalue := <-ch\n```', 'https://cdn.hahacode.cn/1679461101bae50be09654aa77754691e97840ad62.jpg', 5, 128, 1, 1, 1, 0, 1)

('Gin框架API开发最佳实践', 1, '使用Gin框架构建高性能RESTful API的技巧', '## Gin框架最佳实践\n\n### 路由组织\n按功能模块组织路由：\n\n```go\nfunc SetupRouter() *gin.Engine {\n    r := gin.Default()\n    \n    // API路由组\n    api := r.Group("/api")\n    {\n        api.GET("/articles", GetArticles)\n        api.POST("/articles", CreateArticle)\n    }\n    \n    return r\n}\n```\n\n### 中间件使用\n```go\nr.Use(cors.New(cors.Config{\n    AllowOrigins: []string{"*"},\n    AllowMethods: []string{"GET", "POST", "PUT", "DELETE"},\n}))\n```', 'https://cdn.hahacode.cn/1676182015fb77af0dd426bb04261a0c896aeac8f4.jpg', 3, 89, 0, 1, 1, 0, 1),

('MySQL索引优化全攻略', 1, '深入理解MySQL索引原理与优化技巧', '## MySQL索引优化\n\n### 索引类型\n- B-tree索引\n- Hash索引\n- 全文索引\n\n### 索引设计原则\n1. 最左前缀原则\n2. 避免在索引列上进行计算\n3. 选择高选择性的列作为索引\n\n```sql\n-- 好的索引设计\nCREATE INDEX idx_user_name ON user(name);\n\n-- 避免这样做\nSELECT * FROM user WHERE LEFT(name, 3) = 'abc';\n```', 'https://cdn.hahacode.cn/16794608978464e5d4342e4e11e0967b000afd679d.png', 8, 256, 0, 1, 1, 0, 2),

('Redis缓存设计与性能优化', 1, '构建高性能缓存系统的关键技术', '## Redis缓存实战\n\n### 缓存策略\n- 缓存穿透\n- 缓存击穿\n- 缓存雪崩\n\n### 代码示例\n```go\nfunc GetUserByID(id int) (*User, error) {\n    // 尝试从缓存获取\n    key := fmt.Sprintf("user:%d", id)\n    userStr, err := redisClient.Get(ctx, key).Result()\n    if err == nil {\n        var user User\n        json.Unmarshal([]byte(userStr), &user)\n        return &user, nil\n    }\n    \n    // 从数据库获取\n    user, err := db.GetUser(id)\n    if err != nil {\n        return nil, err\n    }\n    \n    // 设置缓存\n    userBytes, _ := json.Marshal(user)\n    redisClient.Set(ctx, key, userBytes, time.Hour)\n    \n    return user, nil\n}\n```', 'https://cdn.hahacode.cn/1679460598fb0af82a672efa72bc533983ea54d6e5.jpg', 12, 342, 1, 1, 1, 0, 1),

('微服务架构设计模式', 1, '微服务架构中的关键设计模式与实践', '## 微服务架构\n\n### 服务拆分原则\n- 按业务域拆分\n- 单一职责原则\n- 服务自治\n\n### 服务发现\n```yaml\n# Consul配置示例\nservices:\n  - name: user-service\n    tags: ["api"]\n    port: 8080\n    check:\n      http: http://localhost:8080/health\n      interval: 10s\n```', 'https://cdn.hahacode.cn/16794606941b34c85a97a62dcf7184082474c8c55d.jpg', 6, 187, 0, 1, 1, 0, 2),

-- 前端文章
('Vue 3 Composition API详解', 2, '探索Vue 3新特性与最佳实践', '## Vue 3 Composition API\n\n### setup函数\n```vue\n<script setup>\nimport { ref, computed, onMounted } from 'vue'\n\nconst count = ref(0)\nconst doubleCount = computed(() => count.value * 2)\n\nconst increment = () => {\n  count.value++\n}\n\nonMounted(() => {\n  console.log('组件已挂载')\n})\n</script>\n\n<template>\n  <div>\n    <p>Count: {{ count }}</p>\n    <p>Double: {{ doubleCount }}</p>\n    <button @click="increment">Increment</button>\n  </div>\n</template>\n```\n\n### 响应式API\n- ref\n- reactive\n- computed\n- watch', 'https://cdn.hahacode.cn/1679461585ade64f3e1212e3b1b4e67a02b043b25c.jpg', 23, 567, 1, 1, 1, 0, 3),

('TypeScript进阶技巧', 2, '掌握TypeScript高级特性提升代码质量', '## TypeScript进阶\n\n### 类型体操\n```typescript\n// 工具类型\ntype DeepReadonly<T> = {\n  readonly [P in keyof T]: T[P] extends object ? DeepReadonly<T[P]> : T[P]\n}\n\n// 使用示例\ninterface User {\n  name: string\n  address: {\n    city: string\n  }\n}\n\nconst user: DeepReadonly<User> = {\n  name: 'Alice',\n  address: { city: 'Beijing' }\n}\n```\n\n### 泛型约束\n```typescript\nfunction getProperty<T, K extends keyof T>(obj: T, key: K): T[K] {\n  return obj[key]\n}\n```', 'https://cdn.hahacode.cn/50e0ec7fde824633b2cd7870028670b2.jpeg', 15, 432, 0, 1, 1, 0, 3),

('Tailwind CSS 项目实战', 2, '使用Tailwind CSS快速构建现代化UI', '## Tailwind CSS实战\n\n### 基础配置\n```javascript\n// tailwind.config.js\nmodule.exports = {\n  content: [\n    './src/**/*.{html,js,vue}',\n  ],\n  theme: {\n    extend: {\n      colors: {\n        primary: '#3b82f6',\n      },\n    },\n  },\n}\n```\n\n### 组件示例\n```vue\n<template>\n  <button class="bg-primary hover:bg-primary/90 text-white font-bold py-2 px-4 rounded transition duration-300">\n    提交按钮\n  </button>\n</template>\n```', 'https://cdn.hahacode.cn/1679460844fb44f7496e7331bfa4edf181390edec0.jpg', 7, 203, 0, 1, 1, 0, 2),

('React Hooks 深度解析', 2, '理解React Hooks原理与自定义Hook开发', '## React Hooks\n\n### 常用Hooks\n```jsx\nimport { useState, useEffect, useCallback } from 'react'\n\nfunction useCounter(initialValue = 0) {\n  const [count, setCount] = useState(initialValue)\n  \n  const increment = useCallback(() => {\n    setCount(prev => prev + 1)\n  }, [])\n  \n  const decrement = useCallback(() => {\n    setCount(prev => prev - 1)\n  }, [])\n  \n  return { count, increment, decrement }\n}\n```\n\n### useEffect依赖项\n```jsx\nuseEffect(() => {\n  const timer = setTimeout(() => {\n    console.log('Timer executed')\n  }, 1000)\n  \n  return () => clearTimeout(timer)\n}, []) // 空依赖，只执行一次\n```', 'https://cdn.hahacode.cn/1679460788fdc43c54069809585a7694dfe09ac0a5.png', 18, 476, 0, 1, 1, 0, 3),

('前端性能优化指南', 2, '全面提升前端应用性能的策略与技巧', '## 前端性能优化\n\n### 资源加载优化\n- 图片优化\n- 代码分割\n- 懒加载\n\n### Vite配置示例\n```javascript\n// vite.config.js\nexport default {\n  build: {\n    chunkSizeWarningLimit: 1000,\n    rollupOptions: {\n      output: {\n        manualChunks: {\n          vue: ['vue', 'vue-router'],\n          ui: ['ant-design-vue'],\n        },\n      },\n    },\n  },\n}\n```\n\n### 运行时优化\n- 虚拟列表\n- 防抖节流\n- 缓存策略', 'https://cdn.hahacode.cn/1679461101bae50be09654aa77754691e97840ad62.jpg', 25, 689, 1, 1, 1, 0, 1);

-- 为文章添加标签关联
INSERT INTO article_tag (article_id, tag_id)
VALUES
(1, 1), (1, 3),  -- Go语言并发编程实战 -> Golang, 学习
(2, 1), (2, 3),  -- Gin框架API开发最佳实践 -> Golang, 学习
(3, 3),          -- MySQL索引优化全攻略 -> 学习
(4, 3),          -- Redis缓存设计与性能优化 -> 学习
(5, 3),          -- 微服务架构设计模式 -> 学习
(6, 2), (6, 3),  -- Vue 3 Composition API详解 -> Vue, 学习
(7, 3),          -- TypeScript进阶技巧 -> 学习
(8, 3),          -- Tailwind CSS 项目实战 -> 学习
(9, 2), (9, 3),  -- React Hooks 深度解析 -> Vue, 学习
(10, 2), (10, 3); -- 前端性能优化指南 -> Vue, 学习

-- 生成一些评论数据
INSERT INTO comment (user_id, article_id, content, is_delete)
VALUES
(2, 1, '非常实用的Go并发教程，感谢分享！', 0),
(3, 1, 'goroutine确实比线程更轻量', 0),
(1, 6, 'Vue 3的Composition API确实很好用', 0),
(2, 6, '学到了很多新知识', 0),
(3, 10, '性能优化很重要，这篇文章很全面', 0);