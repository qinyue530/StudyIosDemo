//
//  Student+StudentBag.h
//  StudyIosDemo
//
//  Created by 秦跃 on 2025/3/14.
//

#import "Student.h"

NS_ASSUME_NONNULL_BEGIN
//使用分类注意的几个地方：
//1. 分类只能增加方法，不能增加属性
//2. 在分类之中可以写 @property 但是不会自动生成私有属性。也不会自动生成getter setter的实现.
//只会生成getter setter的声明.
//所以，你就需要自己写getter 和 setter的声明，也需要自己定义属性 这个属性就必须在本类中，
//3. 在分类的方法实现中不可以直接访问本类的真私有属性（定义在本类的 @implementation之中）但是可以调用本类的getter setter来访问属性.
//本类的 @property生成的私有属性，只可以在本类的实现中访问，分类中不能直接访问私有属性 真，分类可以使用 getter setter 来访问.
//4.分类中可以存在和本类同名方法的.
//当分类中有和本类中同名的方法的时候，优先调用分类的方法。哪怕没有引入分类的头文件。
//如果多个分类中有相同的方法，优先调用最后编译的分类，
@interface Student (StudentBag)
- (void)hehe;
@end

NS_ASSUME_NONNULL_END
