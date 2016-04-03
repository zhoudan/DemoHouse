//
//  Test.h
//  MagicalRecordDemo
//
//  Created by 周单单 on 16/4/3.
//  Copyright © 2016年 zhoudandan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Test : NSObject<NSCopying>


@property (nonatomic, strong) NSString *name;

+ (instancetype)shareSingle;


@end
