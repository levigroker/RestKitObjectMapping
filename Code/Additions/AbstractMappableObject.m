//
//  AbstractMappableObject.m
//
//  Created by Levi Brown on 11/7/12.
//  Copyright (c) 2012 RestKit. All rights reserved.
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

#import "AbstractMappableObject.h"
#import <objc/runtime.h>

@implementation AbstractMappableObject

+ (RKObjectMapping *)objectMapping
{
    RKObjectMapping *retVal = [RKObjectMapping mappingForClass:[self class]];
    
    //Iterate over all properties and add default mappings for them with the
    //same key path as property name.
    unsigned int propertyCount = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &propertyCount);
    
    for (unsigned int i = 0; i < propertyCount; ++i)
    {
        objc_property_t property = properties[i];
        const char * name = property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:name];
        [retVal mapKeyPath:propertyName toAttribute:propertyName];
    }
    
    free(properties);
    
    return retVal;
}

#pragma mark - Overrides

- (NSString *)description
{
    unsigned int propertyCount = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &propertyCount);
    NSMutableDictionary *allProperties = [NSMutableDictionary dictionaryWithCapacity:propertyCount];
    for (unsigned int i = 0; i < propertyCount; ++i)
    {
        objc_property_t property = properties[i];
        const char * name = property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:propertyName];
        [allProperties setObject:(value == nil ? [NSNull null] : value) forKey:propertyName];
    }
    
    free(properties);
    
    NSString *retVal = [NSString stringWithFormat:@"[%@ <%p>: %@]", [self class], self, [allProperties description]];
    
    return retVal;
}

@end
