//
//  Book.h
//  StudyIosDemo
//
//  Created by 秦跃 on 2025/3/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//协议  类似 Java接口
@protocol Book <NSObject>

- (void) lookBook;
//使用该协议 并不需要实现全部的接口
- (void) writeBook;
@end

NS_ASSUME_NONNULL_END
