-- 只添加评论数据
INSERT INTO comment (user_id, topic_id, content, type, is_delete, is_review)
VALUES
(2, 10, 'Docker确实简化了部署流程', 1, 0, 1),
(3, 10, '这篇文章很实用', 1, 0, 1),
(1, 11, 'Kubernetes是容器编排的首选', 1, 0, 1),
(2, 13, 'React Hooks让代码更简洁', 1, 0, 1),
(3, 14, 'CSS Grid布局很强大', 1, 0, 1),
(1, 15, 'Webpack优化确实很重要', 1, 0, 1);