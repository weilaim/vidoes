package utils

import (
	"runtime"

	"go.uber.org/zap"
)

// LogWrapper 为函数执行提供统一的日志包装
func LogWrapper(funcName string, params ...interface{}) {
	// 记录函数开始执行的日志
	Logger.Debug("Function start",
		zap.String("function", funcName),
		zap.Any("params", params),
	)
}

// LogWrapperWithResult 为函数执行提供统一的日志包装（含返回结果）
func LogWrapperWithResult(funcName string, result interface{}, err error, params ...interface{}) {
	if err != nil {
		Logger.Error("Function error",
			zap.String("function", funcName),
			zap.Any("params", params),
			zap.Error(err),
		)
		return
	}
	Logger.Info("Function completed",
		zap.String("function", funcName),
		zap.Any("params", params),
		zap.Any("result", result),
	)
}

// GetFunctionName 获取当前函数名，用于日志标识
func GetFunctionName() string {
	pc, _, _, _ := runtime.Caller(1)
	funcName := runtime.FuncForPC(pc).Name()
	return funcName
}



