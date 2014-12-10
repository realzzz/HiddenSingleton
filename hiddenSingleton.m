//
//  hiddenSingleton.m
//  hiddenSingleton
//
//  Created by ZHANGPENG on 10/12/14.
//  Copyright (c) 2014. All rights reserved.
//

#import "hiddenSingleton.h"

@implementation singletonClass

- (id) init
{
    self = [super init];
    if (self) {
        // load object data from file to memeory
    }
    return self;
}

- (void) dealloc
{
    // persist object data to file
}

@end

@interface hiddenSingleton ()

@property (retain, nonatomic) singletonClass * coreObj;
@end

@implementation hiddenSingleton

static __weak singletonClass * coreObjShadowPtr;

- (id) init
{
    self = [super init];
    if (self) {
        if (coreObjShadowPtr == nil) {
            _coreObj = [[singletonClass alloc]init];
            coreObjShadowPtr = _coreObj;
        }
        else
        {
            _coreObj = coreObjShadowPtr;
        }
    }
    return self;
}


@end
