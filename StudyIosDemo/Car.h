//
//  Car.h
//  StudyIosDemo
//
//  Created by 秦跃 on 2025/3/12.
//

#import <Foundation/Foundation.h>
@class NsPerson;
NS_ASSUME_NONNULL_BEGIN

//1.当两个类相互包含的时候.当Person.h中包含Book.h而Book.h中又包含 Person.h这个时候，就会出现循环引用的问题。就会造成无限递归的问题，而导致无法编译通过，
//2．解决方案：其中一边不要使用#import引入对方的头文件.   而是使用 @class类名；来标注这是1个类。这样子就可以在不引入对方头文件的情况下，告诉编译器这是1个类.
//在 .m文件中再 #import对方的头文件 就可以了
//3.@class与#import的区别
//1）. #import是将指定的文件的内容拷贝到写指令的地方.
//2）． @class 并不会拷贝任何内容，只是告诉编译器，这是1个类，这样编译器在编译的时候才可以知道这是1个类.

@interface Car : NSObject
//
@property(atomic,assign,readwrite,getter=snsPerson,setter=setSnsPerson:) NsPerson *snsPerson;

@end


NS_ASSUME_NONNULL_END
