//
//  main.m
//  StudyIosDemo
//
//  Created by 秦跃 on 2025/2/12.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "NsPerson.h"
#import "Student.h"
#import "Teacher.h"
#import "Student+StudentBag.h"
#import "Teacher+TeacherBag.h"
// Objective-C 没有方法的重载

/**
 .h     头文件     写类声明
 ,m    实现文件    写类的实现
 */
/**
分组导航标记

会在导航条对应的位置展示一个标题
#pragma mark 描述信息
会出现一条水平分隔线
#pragma mark -
 
 */
#pragma mark - 方法
//定义宏
#define LogBOOL(var) NSLog(@"%@",var==YES?@"YES":@"NO")
void test(void){
    NSLog(@"test==============");
    NSLog(@"test==============");
    NSLog(@"test==============");
}
//block作为函数入参
void blockMethod(void (^block)(),int num){
    NSLog(@"blockMethod----------%d",num);
    block();
}
//block作为函数返回值
typedef void (^MyBlock)();
MyBlock myBlockTest(void (^block)(),int num){
    NSLog(@"myBlockTest----------%d",num);
    block();
    return block;
}
int num = 0;
#pragma mark - main方法
int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        //typedef 基本数据类型关键字重命名
        typedef unsigned long long int bigInt;
        unsigned long long int a = 123;
        bigInt b = 123;
        // Setup code that might create autoreleased objects goes here.
        NSLog(@"Hello World!");
        //C指针用NULL int *i = NULL; 不指向内存中的空间
        /*OC的类指针使用nil  
        NsPerson *p = nil;   不指向任何对象
        那么这个时候 如果通过p1指针去访问p1指针指向的对象的属性
        这个时候会运行报错，那么这个时候，如果通过p1指针去调用对象的方法 运行不会报错 但是方法不会执行，没有任何反应
         */
        if(NULL == nil){
            NSLog(@"%@ ========= %@" , NULL,nil);
        }
        
        NsPerson *nsPerson = [NsPerson new];
        nsPerson.name = @"qinyue";
        nsPerson.height = 12.2f;
        NSLog(@"===========%@ ======== %f" , nsPerson.name , nsPerson.height);
        nsPerson.name = @"qinyue";
        nsPerson.height = 111.11f;
        NSLog(@"===========%@ ======== %f" , nsPerson.name , nsPerson.height);
        
        NSLog(@"\n");
        NSLog(@"\n");
        NSLog(@"\n");
        //方法调用
        [nsPerson run];
        int result = [nsPerson runInt];
        NSLog(@"nsPerson runInt 结果=== %d", result);
        NSLog(@"\n");
        NSLog(@"\n");
        NSLog(@"\n");
        [nsPerson eat:nsPerson.name :nsPerson.height];
        NSString *eatResult = [nsPerson eatNSString:nsPerson.name :nsPerson.height];
        NSLog(@"%@" , eatResult);
        [nsPerson sumWith:5 :7];
        NSLog(@"\n");
        NSLog(@"\n");
        NSLog(@"\n");
        
        NsPerson *personA = [NsPerson new];
        personA.name=@"AAA";
        NsPerson *personB = personA;
        personB.name = @"BBB";
        NsPerson *personC = personB;
        personC.name = @"CCC";
        NSLog(@"%@=======%@=========%@" , personA.name , personB.name , personC.name);
        test();
        
        Student *_student = [Student new];
        //对象作为参数的方法 是地址传递，方法中的赋值会影响传入对象的值
        [_student getPersonName:nsPerson];
        NSLog(@"以对象作为参数的方法====%@",nsPerson.name);
        
        NsPerson *nsPersonQ = [_student getPerson:@"qinyue" :11 :111.12f];
        NSLog(@"以对象作为返回值的方法=====%@=======%d=======%f",nsPersonQ.name,nsPersonQ.age,nsPersonQ.height);
        
        Student* std = [Student new];
        std = [std makeStudent:nsPersonQ :@"qqq" :222 :333.33f ];
        NSLog(@"以对象作为属性==NsPerson===%@====%d====%f=====Student=====%@=====%d=====%f",
              std.sNsPerson.name, std.sNsPerson.age,std.sNsPerson.height
              ,std.name,std.age,std.height);
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
        BOOL compareResult = [std compareAge:_student];
        NSLog(@"年龄比较结果===%d",compareResult);
        
        @try {
            NSLog(@"try");
            Student* exceptionStudent = [Student new];
            [exceptionStudent studentException];
        } @catch (NSException *exception) {
            NSLog(@"-------------%@",exception);
        } @finally {
            NSLog(@"@finally");
        }
    
        //类方法调用
        [Student leiFangFa];
        Student *ss = [Student student:@"qinyue":222:22.33f];
        NSLog(@"%@===变量地址：%p====%d======%f",ss.name,ss.name,ss.age,ss.height);
        
        NSString *ns = @"123";
        NSLog(@"%@",ns);
        //C语言字符串
        char *str0 = "qinyue";
        //C语言字符串转为OC
        NSString *nsstr = [NSString stringWithUTF8String:str0];
        //字符串拼接
        NSString *swf = [NSString stringWithFormat:@"name %@ ,age %d , height %f" , ss.name , ss.age,ss.height];
        NSLog(@"%@",swf);
        //字符串长度
        NSUInteger length = [swf length];
        NSLog(@"=======%lu",length);
        //字符串判断
        BOOL eqResult = [nsstr isEqualToString:swf];
        NSLog(@"=======%d",eqResult);
        
        //匿名对象 没有名字对象，没有用1个指针去存储这个对象的地址
        [[NsPerson new] runInt];
        NsPerson* myPerson = [NsPerson new];
        [myPerson setAge:111];
        [myPerson setName:@"adjakf"];
        [myPerson setHeight:123.55f];
        NSLog(@"get 获取值 -----%@-------%d-------%f",[myPerson name],[myPerson age],[myPerson height]);
        //static 不能修饰熟悉和方法
        //static可以修饰方法中的局部变量．
        //如果方法中的局部变量被static修饰，那么这个变量就会被变成静态变量.
        //存储在常量区当方法执行完毕之后不会回收下次再执行这个方法的时候直接使用而不会再声明了.
        NsPerson* n1 = [NsPerson new];
        [n1 nsPerson:myPerson];
        [n1 staticMethodTest];
        [n1 staticMethodTest];
        [n1 staticMethodTest];
        [n1 staticMethodTest];
        [n1 selfMethodTest];
        [ss run];
        [ss runInt];
        [ss eat:nsPerson.name :nsPerson.height];
        NSLog(@"================多态 Start================");
        Teacher *tea1 = [Teacher new];
        NsPerson *tea2 = [Teacher new];
        [Teacher addMethodTest];
        [tea1 runInt];
        [tea1 selfMethodTest];
        [tea1 run];
        [tea2 run];
        
        tea1.name = @"iqjdjfsj";
        
        //NsPerson description 方法 类似Java的toString
        NSString *ns1 = [tea1.name description];
        NSString *ns2 = [tea1 description];
        //字符串
        NSLog(@"%@" , ns1);
        //地址
        NSLog(@"%@" , ns2);
        NSLog(@"================获取Class对象地址 Start================");
        //类似Java反射机制
        Class cl1 = [personA class];
        Class cl2 = [NsPerson class];
        NSLog(@"%p------%p------%p" , cl1,cl2,ns1);
        NSLog(@"%@------%@" , cl1,cl2);
        [cl1 addMethodTest];
        //class 获取类地址。创建对象
        NsPerson *persconClasss = [cl2 new];
        [persconClasss runInt];
        //没有入参
        SEL s0 = @selector(runInt);
        //一个入参
        SEL s1 = @selector(oneJoinMethod:);
        //不能使用
        //SEL s2 = @selector(twoJoinMethod:);
        NSLog(@"s1 = %p", s0);
        [persconClasss performSelector:s0];
        [persconClasss performSelector:s1 withObject:[NSNumber numberWithInt:123]];
        //不能使用
        //[persconClasss performSelector:s2 withObject:@"123" withObject:@"qwe"];
        //相当于 [persconClasss setName:@"12312"] 调用set方法
        persconClasss.name = @"12312";
        //相当于[persconClasss name]  调用get方法
        NSLog(@"------- %@" , persconClasss.name);
        
        //万能指针
        NSObject *obj = @"123123";
        //需要类型强转 调用方法
        int objLength = [(NSString *)obj length];
        NSLog(@"objLength的长度 = %d", objLength);
        //id是1个typedef自定义类型 万能指针，任意的OC对象都可以指,
        id testID = @"qweqweq";
        //调用对象方法 不需要做类型强转,也不会检查方法在对象中是否真实存在,不能使用点语法
        int idLength = [testID length];
        //[testID runInt];
        NSLog(@"testID的长度 = %d", idLength);
        
        //返回值为id 与  instancetype
        NsPerson* ns4 = [NsPerson nsPerson];
        Student* st4 = [Student nsPerson];
        NSString* str4 = [NsPerson nsPerson];
        str4=@"2ujkahdasa";
        NSLog(@"str4的长度 = %d", str4.length);
        NsPerson* ns5 = [NsPerson idNsPerson];
        Student* st5= [Student idNsPerson];
        NSString* str5 = [NsPerson idNsPerson];
        str5=@"2ujkahdasa";
        NSLog(@"str5的长度 = %d", str5.length);
        // 0 - false  , 1 - true
        //判断对象中是否存在该方法
        BOOL* bo1 = [ns5 respondsToSelector:@selector(runInt)];
        if(bo1){
            [ns5 runInt];
        }else{
            NSLog(@"runInt 方法不存在");
        }
        //判断一个对象是否为指定类或指定类的子类的实例
        bo1 = [st5 isKindOfClass:[NsPerson class]];
        NSLog(@"st5 为NsPerson及子类对象吗 %d" , bo1);
        bo1 = [st5 isKindOfClass:[Student class]];
        NSLog(@"st5 为Student及子类对象吗 %d" , bo1);
        //判断一个对象是否为指定类对象 不包含子类
        bo1 = [st5 isMemberOfClass:[NsPerson class]];
        NSLog(@"st5 为NsPerson对象吗 %d" , bo1);
        bo1 = [st5 isMemberOfClass:[Student class]];
        NSLog(@"st5 为Student对象吗 %d" , bo1);
        //判断类是否为另外一个类的子类
        bo1 = [Student isSubclassOfClass:[Student class]];
        NSLog(@"Student是否为Student的子类 %d" , bo1);
        bo1 = [Student isSubclassOfClass:[NsPerson class]];
        NSLog(@"Student是否为NsPerson的子类 %d" , bo1);
        bo1 = [NsPerson isSubclassOfClass:[Student class]];
        NSLog(@"NsPerson是否为Student的子类 %d" , bo1);
        //判断类中是否有指定的方法（不包含类方法 ）
        bo1 = [Student instancesRespondToSelector:@selector(runInt)];
        NSLog(@"Student是否有runInt方法 %d" , bo1);
        bo1 = [Student instancesRespondToSelector:@selector(leiFangFa)];
        NSLog(@"Student是否有leiFangFa方法 %d" , bo1);
        
        //相当于 NsPerson *ns7 = [NsPerson new];
        NsPerson *ns6 = [[NsPerson alloc] init];
        NsPerson *ns7 = [[NsPerson alloc] initWithAll:@"qinyue" :11 :124.2f];
        NSLog(@"自定义构造方法 %@------%d------%f" , ns7.name,ns7.age,ns7.height);
        //ARC模式 使用
        //引用计数器
//        int rc =[ns6 retainCount];
//        NSLog(@"ns6 引用计数器  %d" , rc);
        //引用加1
//        [ns6 retain];
        //引用减1 为0时回收
//        [ns6 release];
//        [ns6 release];
        //EXC_BAD_ACCESS 野指针，对象已经被回收或非法内存地址
        //[ns6 retain];
//        [ns6 retain];
//        rc =[ns6 retainCount];
//        NSLog(@"ns6 引用计数器  %d" , rc);
        //强指针，默认就是强指针可不写 强指针赋值为 nil 时 对象被立即回收
        __strong Car* carStrong = [Car new];
        //弱指针 与强指针作用相同，区别在于ARC模式下 如果1个对象没有任何强类型的指针指向这个对象的时候，对象就会被立即自动释放
        __weak Car* carWeak = [Car new];
        carStrong = nil;
        __weak Car* pointCarStrong = carStrong;
        [carStrong run];
        //3），在ARC机制下，当对象被回收的时候，原来指向这个对象的弱指针会被自动设置为nil
        //不会报错
        [pointCarStrong run];
        //对象存储到当前自动释放池
        //[carStrong autorelease];
        NSLog(@"============循环引用 - 强指针===================");
        NsPerson* strongPerson = [NsPerson new];
        Car* strongCar = [Car new];
        strongPerson.strongCar = strongCar;
        strongCar.strongPerson = strongPerson;
        NSLog(@"============循环引用 - 弱指针===================");
        NsPerson* weakPerson = [NsPerson new];
        Car* weakCar = [Car new];
        weakPerson.weakCar = weakCar;
        weakCar.weakPerson = weakPerson;
        
        NSLog(@"============结束===================");
        
        [ss hehe];
        //延展
        tea1.bag = @"yanZhanTest";
        int num1 = 123;
        //block 内部可以取定义在外部的值，可以修改全局变量的值但是不能修改定义在外部的局部变量值
        //如果需要修改 要在外部的局部变量定义时前方增加 __block
        __block int num2 = 234;
        typedef void (^block1)();
        block1 ablock;
        void (^myBlock1)()= ^void(){
            num2++;
            num++;
            NSLog(@"block-------%d-------%d---------%d",num,num1,num2);
        };
        typedef int (^block2)();
        block2 bblock;
        int (^myBlock2)()= ^int(){
            return 1;
        };
        typedef int (^block3)(int num1 , int num2);
        block3 cblock;
        int (^myBlock3)(int num1 , int num2) = ^int(int num1,int num2){
            return num1+num2;
        };
        myBlock1();
        myBlock2();
        myBlock3(num1,num2);
        blockMethod(^{
            myBlock1();
        },1);
        
        MyBlock mybl = myBlockTest(myBlock1, 1);
        [std lookBook];
        //不实现协议的全部方法不会报错，调用时会报错
        //[std writeBook];
        //
        [std doHomeWork];
        [std doHomeWork:@"数学"];
        
        [tea1 lookBook];
        
        //根据是否遵循某个协议 创建类，如果没有遵循会报错
        NSObject<KeWen>* keWenNs = [Teacher new];
        //NSObject<KeWen>* keWenStu = [Student new];
        id<KeWen> keWenId = [Teacher new];
        
        NSObject<Book,Pen>* bpNs = [Student new];
        id<Book,Pen> bpId = [Student new];
        
        NSString* str1 = @"a";
        NSString* str2 = @"a";
        NSString* str3 = [NSString stringWithFormat:@"a"];
        int index = 5;
        //字符串常用的方法
        //字符串格式化拼接
        NSString* withResult = [NSString stringWithFormat:@"====%@====%@====%d",str1,str2,123];
        //字符串长度
        NSInteger resultLength = withResult.length;
        //获取指定位置的字符
        unichar ch = [withResult characterAtIndex:index];
        //C语言字符串转为OC
        NSString *nsstr1 = [NSString stringWithUTF8String:str0];
        //OC语言字符串转为C
        const char *nsstr2 = nsstr1.UTF8String;
        NSLog(@"字符串：%@",withResult);
        NSLog(@"字符串长度：%ld",resultLength);
        NSLog(@"字符串第%d个字符为：%C",index,ch);
        //两个字符串内容是否相当   == 作用两边数据是否相同，&str1 == &str2 是变量地址的值
        // 0 - false  , 1 - true
        NSLog(@"str1 = %@ , str2 = %@ ,str2==str1 = %d  , &str1 == &str2 = %d",str1 , str2 , str1 == str2 , &str1 == &str2);
        NSLog(@"str1 = %@ , str3 = %@ ,str3==str1 = %d  , &str1 == &str3 = %d",str1 , str3 , str1 == str3 , &str1 == &str3);
        //比较字符串内容
        BOOL equal1 = [str1 isEqualToString:str3];
        BOOL equal2 = [str1 isEqualToString:str2];
        NSLog(@"%d-----%d",equal1,equal2);
        #pragma mark - 读取写入文件 start
        //将字符串的内容写入到文件中
        //writeToFile:文件路径
        //atomically:YES:先写到临时文件中，安全效率低 NO:直接写入到文件 不安全效率高
        //encoding: 编码
        //error: 二级指针 要传递1个NSError地址，写入成功为nil，写入失败就会指向错误对象
        //返回值为BOOL类型，代表是否写入成功 ， err == nil 也可判断为写入成功
        NSError *err;
        BOOL res = [str1 writeToFile:@"/Users/qinyue/writeToFile.txt" atomically:NO encoding:NSUTF8StringEncoding error:&err];
        if(res || err == nil){
            NSLog(@"写入成功");
        }else{
            NSLog(@"写入失败:%@",err);
            //简要信息
            NSLog(@"写入失败:%@",err.localizedDescription);
        }
        //从磁盘上的文件读取字符串
        NSString *strFile = [NSString stringWithContentsOfFile:@"/Users/qinyue/writeToFile.txt" encoding:NSUTF8StringEncoding error:&err];
        if(err == nil){
            NSLog(@"读取成功 : %@" , strFile);
        }else{
            NSLog(@"读取失败:%@",err);
            //简要信息
            NSLog(@"读取失败:%@",err.localizedDescription);
        }
        //使用NSURL 读取文件和网友
        NSURL *ul1 = [NSURL URLWithString:@"https://www.baidu.com/"];
        //读取网页
        NSString *urlStr = [NSString stringWithContentsOfURL:ul1 encoding:NSUTF8StringEncoding error:&err];
        NSLog(@"%@",urlStr);
        
        ul1 = [NSURL URLWithString:@"file:///Users/qinyue/URLWithString.txt"];
        //写入文件
        res = [str1 writeToURL:ul1 atomically:NO encoding:NSUTF8StringEncoding error:&err];
        if(res || err == nil){
            NSLog(@"写入成功");
        }else{
            NSLog(@"写入失败:%@",err);
            //简要信息
            NSLog(@"写入失败:%@",err.localizedDescription);
        }
        //读取文件
        urlStr = [NSString stringWithContentsOfURL:ul1 encoding:NSUTF8StringEncoding error:&err];
        NSLog(@"%@",urlStr);
        #pragma mark - 读取写入文件 end
        //字符串比较
        //options:NSCaseInsensitiveSearch 忽略大小写。
        //NSLiteralSearch 完全匹配 默认
        //NSNumericSearch 字符串相同格式，比较数字
        NSComparisonResult nsr = [str1=@"a101" compare:str2=@"a100" options:NSCaseInsensitiveSearch];
        switch (nsr) {
            case NSOrderedAscending:
                NSLog(@"str1 < str2");
                break;
            case NSOrderedSame:
                NSLog(@"str1 = str2");
                break;
            case NSOrderedDescending:
                NSLog(@"str1 > str2");
                break;
            default:
                NSLog(@"I don't know.");
                break;
        }
        //字符串开始和结束判断
        NSString *beStr = @"https://www.baidu.com/";
        //字符串开头判断
        res = [beStr hasPrefix:@"http"];
        LogBOOL(res);
        //字符串结尾判断
        res = [beStr hasSuffix:@"com/"];
        LogBOOL(res);
        //字符串匹配，range.length = 0 或 range.location = NSNotFound 则为没有找到，找到则为字符串长度
        //range.location 为首次匹配到的字符串下标
        //结构体
        //typedef struct _NSRange {
        //    NSUInteger location;
        //    NSUInteger length;
        //} NSRange;
        NSRange range = [beStr rangeOfString:@"bai"];
        NSLog(@"%lu ------ %lu",range.length ,range.location);
        //初始化结构体,格式化为NSString
        NSRange nsrange1 ={5,5};
        NSRange nsrange2 =NSMakeRange(4, 4);
        NSLog(@"%@",NSStringFromRange(nsrange1));
        //字符串截取
        //从指定的下标截取到最后
        NSString *strSub = [beStr substringFromIndex:3];
        NSLog(@"%@",strSub);
        //从前开始截取到下标
        strSub = [beStr substringToIndex:3];
        NSLog(@"%@",strSub);
        //指定范围截取
        strSub = [beStr substringWithRange:NSMakeRange(3, 5)];
        NSLog(@"%@",strSub);
        //字符串替换,匹配多个会全部替换
        beStr = [beStr stringByReplacingOccurrencesOfString:@"." withString:@"@@"];
        NSLog(@"%@",beStr);
        //类型转换 从头开始转换，遇到不能转换了则停止
        beStr = @"1111asaf2";
        int beInt = beStr.intValue;
        NSInteger beInteger = beStr.integerValue;
        long long beLong = beStr.longLongValue;
        BOOL beBool = beStr.boolValue;
        NSLog(@"%d",beInt);
        beStr = @"123.23";
        double beDouble = beStr.doubleValue;
        beStr = @"123.23f";
        float beFloat = beStr.floatValue;
        beStr = @"    https://www.baidu.com/     ";
        NSLog(@"%@",beStr);
        //去掉字符串前后的
        //whitespaceCharacterSet 空格
        //lowercaseLetterCharacterSet 小写字母
        //uppercaseLetterCharacterSet 大写字母
        //characterSetWithCharactersInString:@" " 指定字符串
        beStr = [beStr stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" "]];
        NSLog(@"%@",beStr);
        //字符串转大写
        beStr = [beStr uppercaseString];
        NSLog(@"%@",beStr);
        //字符串转小写
        beStr = [beStr lowercaseString];
        NSLog(@"%@",beStr);
        //NSMutableString 可修改，不会新创建对象。
        //初始化不能直接 NSMutableString *nsmstr = @"asd";
        //使用NSString 的地方可以使用 NSMutableString 。反之不行
        NSMutableString *nsmstr = [NSMutableString string];
        [nsmstr appendString:@"aaa"];
        [nsmstr appendString:@"bbb"];
        NSLog(@"%@",nsmstr);
        [nsmstr appendFormat:@"ccc%@eee",@"ddd"];
        NSLog(@"%@",nsmstr);
        //NSArray  只能存OC对象，不能非OC对象，不能存储基本数据类型，结尾要加nil，表示元素到此结束
        //这样创建长度为0个
        //NSArray *arr1 = [NSArray new];
        //NSArray *arr2 = [[NSArray alloc] init];
        NSArray *arr1 = [NSArray arrayWithObjects:@"aaa",@"bbb",@"ccc",st4,nil];
        NSLog(@"%@",arr1);
        //这种不需要加nil
        NSArray *arr2 = @[@"zzz",@"xxx",@"nnn"];
        NSLog(@"%@",arr2);
        //取出指定下标的元素
        NSString *arrget = [arr1 objectAtIndex:1];
        //数组里是否有某个元素
        res = [arr1 containsObject:@"aaa"];
        //取数组的第一个元素 , 当数组中没有任何元素，[arr1 objectAtIndex:0] 会报错，arr1.firstObject不会报错取到nil
        NSString *arrgetbegin = arr1.firstObject;
        //取最后一个元素
        NSString *arrgetend = arr1.lastObject;
        //指定元素第一次出现的下标,如果没有找到则为NSUInteger的最大值 NSNotFound
        NSUInteger arrIndex = [arr1 indexOfObject:@"bbb"];
        NSLog(@"arr1长度：%lu-%@-数组中是否有aaa:%d--%@--%@--%ld",arr1.count,arrget,res,arrgetbegin,arrgetend,arrIndex);
        //NSArray 遍历
        NSLog(@"普通for循环");
        for(int i = 0 ; i< arr1.count ; i++){
            NSLog(@"%@",[arr1 objectAtIndex:i]);
        }
        //存储类型不一致时，建议使用id
        NSLog(@"增强for循环");
        for(id ss in arr1){
            NSLog(@"%@",ss);
        }
        //遍历数组中的每一个元素
        NSLog(@"使用block循环");
        [arr1 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"%@-----%ld",obj,idx);
            //*stop=YES时，循环结束
            if(idx == 2){
                *stop = YES;
            }
        }];
        //将数组中的元素连接起来，组成新的字符串，“#”为连接符
        NSString *arrStr = [arr1 componentsJoinedByString:@"#"];
        NSLog(@"%@",arrStr);
        //字符串转NSArray
        arr1 = [arrStr componentsSeparatedByString:@"<"];
        for(id ss in arr1){
            NSLog(@"%@",ss);
        }
        //NSMutableArray 可以动态删除和新增，其他与NSArray 一致
        NSLog(@"NSMutableArray 的使用");
        NSMutableArray *nsArr = [NSMutableArray new];
        nsArr = [[NSMutableArray alloc] init];
        nsArr = [NSMutableArray array];
        nsArr = [NSMutableArray arrayWithObjects:@"aaa",@"bbb",@"ccc", nil];
        //不可以这样定义 nsArr = @[@"aaa",@"bbb",@"ccc"]; 因为后面是 NSArray的定义方式
        NSLog(@"NSMutableArray 增加元素");
        //增加数组
        [nsArr addObject:@"aaa"];
        [nsArr addObject:@"eee"];
        [nsArr addObject:arr2];
        //将arr2数组中的每一个元素，取出来增加到nsArr中
        [nsArr addObjectsFromArray:arr2];
        //将元素插入指定下标位置
        [nsArr insertObject:@"kkk" atIndex:2];
        [nsArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"%@-----%ld",obj,idx);
        }];
        NSLog(@"NSMutableArray 删除元素");
        //删除数组
        //删除指定下标的元素
        [nsArr removeObjectAtIndex:2];
        //删除值为指定值的元素,如果有多个相同的则全部删除
        [nsArr removeObject:arr2];
        [nsArr removeObject:@"aaa"];
        //删除指定范围当值的 指定元素
        [nsArr removeObject:@"bbb" inRange:NSMakeRange(0, 4)];
        //删除最后一个元素
        [nsArr removeLastObject];
        //删除所有元素
        [nsArr removeAllObjects];
        [nsArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"%@-----%ld",obj,idx);
        }];
        NSNumber *number1 = [NSNumber numberWithInt:10];
        NSNumber *number2 = @10;
        NSArray *numArr = @[number1,number2,@10];
        
        //NSDictionary和NSMutableDictionary 类似Java中的Map
        //创建NSDictionary
        //以下三种没有任何数组，没有任何意义。不能动态新增和删除
        NSDictionary *dic = [NSDictionary new];
        dic = [NSDictionary dictionary];
        dic = [[NSDictionary alloc] init];
        //创建 value1,key1,value1,key1,nul
        dic = [NSDictionary dictionaryWithObjectsAndKeys:@"aaa",@"name",@"bbb",@"addres",@"ccc",@"code",nil];
        NSLog(@"%@",dic);
        //简写
        //key不允许重复，后加的无效
        dic = @{@"name":@"aaa",@"address":@"yingkou",@"code":@"1111",@"name":@"bbb"};
        //顺序按照ASCII值顺序打印
        //实际并不是按照顺序存储，是根据key和数组长度通过哈希算法，计算出下标 并存在下标位置，取值时也是这样计算
        NSLog(@"%@",dic);
        //取出指定key的值 如果不存在返回为nil 不报错，
        //dic.count 有多少个key
        NSLog(@"%@--%@--%@--%@--%lu",dic[@"name"],dic[@"aaa"],[dic objectForKey:@"name"],[dic objectForKey:@"aaa"],dic.count);
        //遍历
        //遍历出的是key，在通过key取出value
        for(id item in dic){
            NSLog(@"%@:%@",item,dic[item]);
        }
        //block方法遍历
        [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"block遍历 -- %@:%@",key,obj);
        }];
        //NSMutableDictionary 可以动态新增和删除
        //创建
        NSMutableDictionary *nmDic = [NSMutableDictionary new];
        nmDic = [[NSMutableDictionary alloc] init];
        nmDic = [NSMutableDictionary dictionary];
        nmDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"aaa",@"name",@"bbb",@"addres",@"ccc",@"code",nil];
        //这样不行，@{@"name":@"aaa",@"address":@"yingkou",@"code":@"1111",@"name":@"bbb"}; 为NSDictionary，不能动态新增删除
        //nmDic = @{@"name":@"aaa",@"address":@"yingkou",@"code":@"1111",@"name":@"bbb"};
        //新增
        //如果重复key，会被替换为后添加的
        [nmDic setObject:@"yyy" forKey:@"qqq"];
        [nmDic setObject:@"sss" forKey:@"name"];
        //删除
        //删除指定key
        [nmDic removeObjectForKey:@"name"];
        NSLog(@"%@",nmDic);
        //写入到文件
        res = [nmDic writeToFile:@"/Users/qinyue/writeToFileNSMutableDictionary.plist" atomically:NO];
        //读取文件
        NSDictionary *fileDic = [NSDictionary dictionaryWithContentsOfFile:@"/Users/qinyue/writeToFileNSMutableDictionary.plist"];
        NSLog(@"读取文件中的NSDictionary===%@",fileDic);
        //删除所有
        [nmDic removeAllObjects];
        //文件相关
        NSFileManager *manage = [NSFileManager defaultManager];
        //文件是否存在
        res = [manage fileExistsAtPath:@"/Users/qinyue/writeToFile.txt"];
        LogBOOL(res);
        BOOL flag = NO;
        //res代表是否存在 ，flag判断 文件还是文件夹 YES 文件夹 ， NO 文件
        res = [manage fileExistsAtPath:@"/Users/qinyue/writeToFile.txt" isDirectory:&flag];
        LogBOOL(res);
        LogBOOL(flag);
        //是否有读取权限
        res = [manage isReadableFileAtPath:@"/Users/qinyue/writeToFile.txt"];
        //是否有写权限
        res = [manage isWritableFileAtPath:@"/Users/qinyue/writeToFile.txt"];
        //是否可以删除
        res = [manage isDeletableFileAtPath:@"/Users/qinyue/writeToFile.txt"];
        //获取文件信息
        NSDictionary *fileDesc = [manage attributesOfItemAtPath:@"/Users/qinyue/writeToFile.txt" error:&err];
        NSLog(@"%@----%@",fileDesc,fileDesc[NSFileSize]);
        //获取指定目录下的所有的目录及文件,包含子所有文件夹下
        NSArray *fileArr = [manage subpathsAtPath:@"Users/qinyue/nacos"];
        NSLog(@"%@",fileArr);
        //获取指定目录下的所有的目录及文件
        fileArr = [manage contentsOfDirectoryAtPath:@"Users/qinyue/nacos" error:&err];
        NSLog(@"%@",fileArr);
        //在指定的目录创建并写入文件
        NSString *fileContents = @"上酒店司机及时降低建军打开v小客车你可能就安静的";
        NSDate *fileDate = [fileContents dataUsingEncoding:NSUTF8StringEncoding];
        //第一个是 文件路径；第二个是文件内容 如果创建空文件 传 nil；第三个是文件属性，默认为nil
        res = [manage createFileAtPath:@"Users/qinyue/nacos/fileDate.txt" contents:fileDate attributes:nil];
        //创建文件夹
        //路径 ；YES作为路径创建，NO不会做一路径创建；指定属性，默认为nil
        res = [manage createDirectoryAtPath:@"Users/qinyue/nacos/fileDate/aaa/bbb/cccc" withIntermediateDirectories:YES attributes:nil error:&err];
        //拷贝
        res = [manage copyItemAtPath:@"Users/qinyue/nacos/fileDate.txt" toPath:@"Users/qinyue/nacos/copyFileDate.txt" error:&err];
        //移动
        res = [manage moveItemAtPath:@"Users/qinyue/nacos/fileDate.txt" toPath:@"Users/qinyue/nacos/moveFileDate.txt" error:&err];
        //删除
        res = [manage removeItemAtPath:@"Users/qinyue/nacos/moveFileDate.txt" error:&err];
        //结构体无法存储到集合中。可包装到对象后，在存到集合
        //界面控件的坐标，与NSPoint一样
        CGPoint cg = CGPointMake(22, 33);
        NSLog(@"%@",NSStringFromCGPoint(cg));
        //界面控件的大小 ，宽度和高度  与NSSize一样
        CGSize size =CGSizeMake(11,22);
        NSLog(@"%@",NSStringFromCGSize(size));
        //界面控件的坐标 和 界面控件的大小
        CGRect reset = CGRectMake(1, 2, 3, 4);
        NSLog(@"%@",NSStringFromCGRect(reset));
        
        NSValue *v1 = [NSValue valueWithCGPoint:cg];
        NSValue *v2 = [NSValue valueWithCGSize:size];
        NSValue *v3 = [NSValue valueWithCGRect:reset];
        [nsArr addObject:v1];
        [nsArr addObject:v2];
        [nsArr addObject:v3];
        NSLog(@"%@",nsArr);
        
        //日期
        
        
    }
    //return UIApplicationMain(argc, arrgv, nil, appDelegateClassName);
}


