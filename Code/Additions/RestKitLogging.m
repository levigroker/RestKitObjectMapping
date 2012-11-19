//
//  RestKitLogging.m
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

#import "RestKitLogging.h"

const int rkDefaultLogLevel = LOG_LEVEL_ERROR;

@implementation RestKitLogging

+ (RestKitLogging *)sharedInstance
{
    static dispatch_once_t onceQueue;
    static RestKitLogging *restKitLogging = nil;
    
    dispatch_once(&onceQueue, ^{ restKitLogging = [[self alloc] init]; });
    return restKitLogging;
}

- (id)init
{
    if ((self = [super init]))
    {
        self.logLevel = rkDefaultLogLevel;
    }
    
    return self;
}

@end
