-- 为新文章添加标签关联
INSERT INTO article_tag (article_id, tag_id)
VALUES
(10, 1), (10, 3),  -- Docker容器化实践 -> Golang, 学习
(11, 1), (11, 3),  -- Kubernetes入门指南 -> Golang, 学习
(12, 1), (12, 3),  -- 微服务架构设计 -> Golang, 学习
(13, 2), (13, 3),  -- React Hooks实战 -> Vue, 学习
(14, 2), (14, 3),  -- CSS Grid布局指南 -> Vue, 学习
(15, 2), (15, 3);  -- Webpack5优化配置 -> Vue, 学习

-- 添加评论数据
INSERT INTO comment (user_id, topic_id, content, type, is_delete, is_review)
VALUES
(2, 10, 'Docker确实简化了部署流程', 1, 0, 1),
(3, 10, '这篇文章很实用', 1, 0, 1),
(1, 11, 'Kubernetes是容器编排的首选', 1, 0, 1),
(2, 13, 'React Hooks让代码更简洁', 1, 0, 1),
(3, 14, 'CSS Grid布局很强大', 1, 0, 1),
(1, 15, 'Webpack优化确实很重要', 1, 0, 1);