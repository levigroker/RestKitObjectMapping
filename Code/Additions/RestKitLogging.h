//
//  RestKitLogging.h
//
//  Created by Levi Brown on 11/7/12.
//  Copyright (c) 2012 Levi Brown. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import <Foundation/Foundation.h>
#import "DDLog.h"

extern const int rkDefaultLogLevel;
#define RK_LOG_CONTEXT 80

#define RKLogError(frmt, ...)     SYNC_LOG_OBJC_MAYBE([RestKitLogging sharedInstance].logLevel, LOG_FLAG_ERROR,   RK_LOG_CONTEXT, frmt, ##__VA_ARGS__)
#define RKLogWarning(frmt, ...)     ASYNC_LOG_OBJC_MAYBE([RestKitLogging sharedInstance].logLevel, LOG_FLAG_WARN,    RK_LOG_CONTEXT, frmt, ##__VA_ARGS__)
#define RKLogInfo(frmt, ...)     ASYNC_LOG_OBJC_MAYBE([RestKitLogging sharedInstance].logLevel, LOG_FLAG_INFO,    RK_LOG_CONTEXT, frmt, ##__VA_ARGS__)
#define RKLogDebug(frmt, ...)     ASYNC_LOG_OBJC_MAYBE([RestKitLogging sharedInstance].logLevel, LOG_FLAG_INFO,    RK_LOG_CONTEXT, frmt, ##__VA_ARGS__)
#define RKLogTrace(frmt, ...)  ASYNC_LOG_OBJC_MAYBE([RestKitLogging sharedInstance].logLevel, LOG_FLAG_VERBOSE, RK_LOG_CONTEXT, frmt, ##__VA_ARGS__)

@interface RestKitLogging : NSObject

/* Should be one of the CocoaLumberjack logging levels:
 LOG_LEVEL_OFF
 LOG_LEVEL_ERROR
 LOG_LEVEL_WARN
 LOG_LEVEL_INFO
 LOG_LEVEL_VERBOSE
 
 Defaults to 'rkDefaultLogLevel'
*/
@property (nonatomic,assign) int logLevel;

+ (RestKitLogging *)sharedInstance;

@end
