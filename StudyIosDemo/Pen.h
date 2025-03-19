//
//  Pen.h
//  StudyIosDemo
//
//  Created by 秦跃 on 2025/3/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Pen <NSObject>
- (void)doHomeWork;
- (void)doHomeWork:(NSString*) bookName;
- (void)writeBook;
@end

NS_ASSUME_NONNULL_END
