//
//  Teacher.h
//  StudyIosDemo
//
//  Created by 秦跃 on 2025/3/6.
//
#import <Foundation/Foundation.h>
#import "NsPerson.h"
#import "KeWen.h"
NS_ASSUME_NONNULL_BEGIN

@interface Teacher : NsPerson <KeWen>
+ (void)addMethodTest;
@end

NS_ASSUME_NONNULL_END
