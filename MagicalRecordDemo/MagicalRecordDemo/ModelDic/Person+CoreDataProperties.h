//
//  Person+CoreDataProperties.h
//  MagicalRecordDemo
//
//  Created by 周单单 on 16/4/2.
//  Copyright © 2016年 zhoudandan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *address;

@end

NS_ASSUME_NONNULL_END
