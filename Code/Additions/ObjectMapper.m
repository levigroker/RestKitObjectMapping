//
//  ObjectMapper.m
//  RestKit
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

#import "ObjectMapper.h"
#import "RKObjectMapping.h"
#import "RKObjectMapper.h"
#import "RKObjectMappingProvider.h"
#import "RKObjectMappingResult.h"
#import "RKObjectSerializer.h"
#import "RestKitLogging.h"

@implementation ObjectMapper

+ (NSArray *)objectsFromDictionary:(NSDictionary *)dictionary withKeyPathToClassDictionary:(NSDictionary *)keyPathToClassDict
{
    NSArray *retVal = nil;
    
    //Create and populate a mapping provider based on the supplied key path to class mappings
    RKObjectMappingProvider *mappingProvider = [[[RKObjectMappingProvider alloc] init] autorelease];
    
    for (NSString *keyPath in [keyPathToClassDict allKeys])
    {
        Class klass = [keyPathToClassDict objectForKey:keyPath];
        RKObjectMapping *mapping = [klass objectMapping];
        if (mapping == nil)
        {
            RKLogWarning(@"No mapping available for class '%@'.", klass);
        }
        else
        {
            [mappingProvider setMapping:mapping forKeyPath:keyPath];
            //RKLogTrace(@"Mapped class '%@' to key path '%@'.", klass, keyPath);
        }
    }
    
    //Create the mapper and perform the object mapping
    RKObjectMapper *mapper = [RKObjectMapper mapperWithObject:dictionary mappingProvider:mappingProvider];
    RKObjectMappingResult *mappingResult = [mapper performMapping];
    retVal = [mappingResult asCollection];
    
    return retVal;
}

+ (NSDictionary *)dictionaryFromMappableObject:(id <MappableObject>)mappableObject withRootKeyPath:(NSString *)rootKeyPath
{
    NSDictionary *retVal = nil;
    
    RKObjectMapping *mapping = [[mappableObject class] objectMapping];
    RKObjectMapping *inverseMapping = [mapping inverseMapping];
    if (inverseMapping == nil)
    {
        RKLogWarning(@"No mapping available for class '%@'.", [mappableObject class]);
    }
    else
    {
        inverseMapping.rootKeyPath = rootKeyPath;
        RKObjectSerializer * serializer = [RKObjectSerializer serializerWithObject:mappableObject mapping:inverseMapping];
        //See "Variable Qualifiers" at http://developer.apple.com/library/mac/#releasenotes/ObjectiveC/RN-TransitioningToARC/Introduction/Introduction.html
        __autoreleasing NSError *error = nil;
        retVal = [serializer serializedObject:&error];
        if (!retVal)
        {
            RKLogError(@"Unable to serialize object '%@'. Error: %@", mappableObject, error);
        }
    }
    
    return retVal;
}

@end
