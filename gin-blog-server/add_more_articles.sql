-- 添加更多文章数据
INSERT INTO article (title, category_id, `desc`, content, img, comment_count, read_count, is_top, type, status, is_delete, user_id)
VALUES
-- 后端文章
('Docker容器化实践', 1, 'Docker基础与进阶技巧', 'Docker是一个开源的容器化平台，可以帮助开发者打包、分发和运行应用程序。本文介绍了Docker的基本概念、常用命令和最佳实践。', 'https://cdn.hahacode.cn/1679461101bae50be09654aa77754691e97840ad62.jpg', 8, 220, 0, 1, 1, 0, 1),
('Kubernetes入门指南', 1, '容器编排平台实践', 'Kubernetes是一个开源的容器编排平台，用于自动化容器的部署、扩展和管理。本文介绍了Kubernetes的核心概念和基本操作。', 'https://cdn.hahacode.cn/1676182015fb77af0dd426bb04261a0c896aeac8f4.jpg', 6, 180, 1, 1, 1, 0, 2),
('微服务架构设计', 1, '微服务拆分与治理', '微服务架构是一种将应用程序构建为一组小型服务的方法，这些服务运行在自己的进程中，通过轻量级机制进行通信。本文介绍了微服务架构的设计原则和实践经验。', 'https://cdn.hahacode.cn/1679460598fb0af82a672efa72bc533983ea54d6e5.jpg', 12, 250, 0, 1, 1, 0, 1),

-- 前端文章
('React Hooks实战', 2, 'React新特性详解', 'React Hooks是React 16.8引入的新特性，允许你在不编写class的情况下使用state以及其他的React特性。本文通过实例介绍了Hooks的使用方法。', 'https://cdn.hahacode.cn/1679461585ade64f3e1212e3b1b4e67a02b043b25c.jpg', 15, 300, 0, 1, 1, 0, 3),
('CSS Grid布局指南', 2, '现代网页布局技术', 'CSS Grid是一种二维网格布局系统，为网页布局提供了强大的工具。本文详细介绍了Grid布局的各种功能和使用方法。', 'https://cdn.hahacode.cn/50e0ec7fde824633b2cd7870028670b2.jpeg', 10, 220, 1, 1, 1, 0, 3),
('Webpack5优化配置', 2, '前端构建工具优化', 'Webpack是一个现代JavaScript应用程序的静态模块打包器。本文介绍了Webpack 5的新特性和优化配置方法。', 'https://cdn.hahacode.cn/1679460844fb44f7496e7331bfa4edf181390edec0.jpg', 14, 280, 0, 1, 1, 0, 2);