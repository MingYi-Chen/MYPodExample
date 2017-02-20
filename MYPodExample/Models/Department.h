//
//  Department.h
//  MYPodExample
//
//  Created by Ming Yi Chen on 20/02/2017.
//  Copyright © 2017 Ming Yi Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Department;

@interface Person:NSObject
@property (strong,nonatomic)Department * department;
@end

@interface Department: NSObject
@property (strong,nonatomic)Person * person;
@end


