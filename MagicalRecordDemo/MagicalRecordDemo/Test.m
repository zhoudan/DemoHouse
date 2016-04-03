//
//  Test.m
//  MagicalRecordDemo
//
//  Created by 周单单 on 16/4/3.
//  Copyright © 2016年 zhoudandan. All rights reserved.
//

#import "Test.h"

static Test *t = nil;

@implementation Test

+ (instancetype)shareSingle
{
    static dispatch_once_t onceT;
    dispatch_once(&onceT, ^{
        t = [[self alloc] init];
    });
    
    return t;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [self shareSingle];
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return [self shareSingle];
}


@end
