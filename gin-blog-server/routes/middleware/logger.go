package middleware

import (
	"fmt"
	"gin-blog/utils"
	"time"

	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

// 日志中间件
func Logger() gin.HandlerFunc {
	return func(c *gin.Context) {
		start := time.Now()
		// 添加请求ID
		requestID := utils.Encryptor.MD5(fmt.Sprintf("%d_%s", time.Now().UnixNano(), c.ClientIP()))
		c.Header("X-Request-ID", requestID)

		// 请求开始日志
		utils.Logger.Info("Request start",
			zap.String("requestID", requestID),
			zap.String("method", c.Request.Method),
			zap.String("path", c.Request.URL.Path),
			zap.String("query", c.Request.URL.RawQuery),
			zap.String("ip", c.ClientIP()),
			zap.String("user-agent", c.Request.UserAgent()),
		)
		
		c.Next()
		cost := time.Since(start)
		// 请求结束日志
		logger := utils.Logger.Info
		if c.Writer.Status() >= 400 {
			logger = utils.Logger.Error
		}
		
		logger("Request completed",
			zap.String("requestID", requestID),
			zap.Int("status", c.Writer.Status()),
			zap.String("method", c.Request.Method),
			zap.String("path", c.Request.URL.Path),
			zap.String("query", c.Request.URL.RawQuery),
			zap.String("ip", c.ClientIP()),
			zap.String("user-agent", c.Request.UserAgent()),
			zap.String("errors", c.Errors.ByType(gin.ErrorTypePrivate).String()),
			zap.Duration("cost", cost),
			zap.String("userID", ""), // 可从上下文获取当前登录用户ID
		)
	}
}
