//
//  Pen.h
//  StudyIosDemo
//
//  Created by 秦跃 on 2025/3/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Pen <NSObject>
//@required 修饰的方法，必须实现该方法，如果不实现 会出现警告，可以运行，默认为required
@required
- (void)doHomeWork;
- (void)doHomeWork:(NSString*) bookName;
//@optional 如果不实现 也不会警告
@optional
- (void)writeBook;
@end

NS_ASSUME_NONNULL_END
