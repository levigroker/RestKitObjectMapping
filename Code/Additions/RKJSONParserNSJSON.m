//
//  RKJSONParserNSJSON.m
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

#import "RKJSONParserNSJSON.h"
#import "RestKitLogging.h"

@implementation RKJSONParserNSJSON

- (id)objectFromString:(NSString *)string error:(NSError **)error
{
    RKLogTrace(@"string = '%@'", string);

    id retVal = nil;
    
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    if (data.length > 0)
    {
        retVal = [NSJSONSerialization JSONObjectWithData:data options:self.JSONReadingOptions error:error];
    }

    return retVal;
}

- (NSString *)stringFromObject:(id)object error:(NSError **)error
{
    NSString *retVal = nil;
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:object options:0 error:error];
    if (data)
    {
        retVal = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
    }

    return retVal;
}

@end
