-- 生成简单的假文章数据
INSERT INTO article (title, category_id, `desc`, content, img, comment_count, read_count, is_top, type, status, is_delete, user_id)
VALUES
-- 后端文章
('Go语言基础教程', 1, 'Go语言入门指南', '这是一篇关于Go语言基础的教程，包含变量、函数、控制流等内容。Go语言是一种编译型语言，具有简洁的语法和强大的并发特性。', 'https://cdn.hahacode.cn/1679461101bae50be09654aa77754691e97840ad62.jpg', 10, 150, 1, 1, 1, 0, 1),
('MySQL数据库入门', 1, 'MySQL基础操作教程', 'MySQL是最流行的关系型数据库之一，本文介绍了数据库的基本概念、SQL语句、索引优化等内容。', 'https://cdn.hahacode.cn/1676182015fb77af0dd426bb04261a0c896aeac8f4.jpg', 8, 200, 0, 1, 1, 0, 2),
('Redis缓存使用指南', 1, '高性能缓存系统实践', 'Redis是一个高性能的键值存储系统，本文介绍了Redis的基本数据类型、持久化机制、集群模式等内容。', 'https://cdn.hahacode.cn/1679460598fb0af82a672efa72bc533983ea54d6e5.jpg', 5, 180, 0, 1, 1, 0, 1),

-- 前端文章
('Vue 3快速入门', 2, 'Vue 3框架学习笔记', 'Vue 3带来了很多新特性，包括Composition API、Teleport、Fragments等。本文介绍了Vue 3的基本使用方法和最佳实践。', 'https://cdn.hahacode.cn/1679461585ade64f3e1212e3b1b4e67a02b043b25c.jpg', 15, 250, 1, 1, 1, 0, 3),
('TypeScript基础教程', 2, 'TypeScript类型系统详解', 'TypeScript为JavaScript添加了静态类型检查，提高了代码的可维护性。本文介绍了TypeScript的基础类型、接口、泛型等内容。', 'https://cdn.hahacode.cn/50e0ec7fde824633b2cd7870028670b2.jpeg', 12, 190, 0, 1, 1, 0, 3),
('前端性能优化技巧', 2, '提升Web应用性能的方法', '前端性能优化是一个重要的话题，本文介绍了资源加载优化、运行时优化、渲染优化等方面的技巧。', 'https://cdn.hahacode.cn/1679460844fb44f7496e7331bfa4edf181390edec0.jpg', 20, 300, 0, 1, 1, 0, 2);

-- 为文章添加标签关联
INSERT INTO article_tag (article_id, tag_id)
VALUES
(1, 1), (1, 3),  -- Go语言基础教程 -> Golang, 学习
(2, 3),          -- MySQL数据库入门 -> 学习
(3, 3),          -- Redis缓存使用指南 -> 学习
(4, 2), (4, 3),  -- Vue 3快速入门 -> Vue, 学习
(5, 3),          -- TypeScript基础教程 -> 学习
(6, 2), (6, 3);  -- 前端性能优化技巧 -> Vue, 学习

-- 生成一些评论数据
INSERT INTO comment (user_id, article_id, content, is_delete)
VALUES
(2, 1, 'Go语言确实很好用！', 0),
(3, 1, '这篇教程对新手很友好', 0),
(1, 4, 'Vue 3的Composition API很强大', 0),
(2, 4, '学习了很多新知识', 0),
(3, 6, '性能优化很重要', 0);