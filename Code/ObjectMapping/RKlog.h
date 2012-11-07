//
//  RestKitLogging.h
//
//  Created by Levi Brown on 2/1/12.
//

#import "DDLog.h"

static const int rkLogLevel = LOG_LEVEL_ERROR;

#define RK_LOG_CONTEXT 80

#define RKLogError(frmt, ...)     SYNC_LOG_OBJC_MAYBE(rkLogLevel, LOG_FLAG_ERROR,   RK_LOG_CONTEXT, frmt, ##__VA_ARGS__)
#define RKLogWarning(frmt, ...)     ASYNC_LOG_OBJC_MAYBE(rkLogLevel, LOG_FLAG_WARN,    RK_LOG_CONTEXT, frmt, ##__VA_ARGS__)
#define RKLogInfo(frmt, ...)     ASYNC_LOG_OBJC_MAYBE(rkLogLevel, LOG_FLAG_INFO,    RK_LOG_CONTEXT, frmt, ##__VA_ARGS__)
#define RKLogDebug(frmt, ...)     ASYNC_LOG_OBJC_MAYBE(rkLogLevel, LOG_FLAG_INFO,    RK_LOG_CONTEXT, frmt, ##__VA_ARGS__)
#define RKLogTrace(frmt, ...)  ASYNC_LOG_OBJC_MAYBE(rkLogLevel, LOG_FLAG_VERBOSE, RK_LOG_CONTEXT, frmt, ##__VA_ARGS__)