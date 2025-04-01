//
//  ViewController.m
//  StudyIosDemo
//
//  Created by 秦跃 on 20210/2/12.
//

#import "ViewController.h"
//类扩展
@interface ViewController ()
- (IBAction)compute;
@property (weak, nonatomic) IBOutlet UITextField *number1;
@property (weak, nonatomic) IBOutlet UITextField *number2;
@property (weak, nonatomic) IBOutlet UILabel *lblResult;
@property (weak, nonatomic) IBOutlet UIButton *pingyi;
@property (weak, nonatomic) IBOutlet UIButton *xuanzhuan;
@property (weak, nonatomic) IBOutlet UIButton *suofang;
@property (weak, nonatomic) IBOutlet UIButton *fuwei;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *jisuan;
//Text Field中
//Secure Text Entry点上对勾，可以隐藏密码
//Placeholder 输入框提示信息
//clear Button 改为 is always visible 输入框最后有个叉按钮点击会清空
- (IBAction)shangyi:(id)sender;
- (IBAction)youyi:(id)sender;
- (IBAction)zuoyi:(id)sender;
- (IBAction)xiayi:(id)sender;
- (IBAction)fangda:(id)sender;
- (IBAction)suoxiao:(id)sender;
- (IBAction) jisuan:(id)sender;
- (IBAction)pingyi:(id)sender;
- (IBAction)xuanzhuan:(id)sender;
- (IBAction)suofang:(id)sender;
- (IBAction)fuwei:(id)sender;

@end

@implementation ViewController
//当要显示一个界面的时候，首先创建这个界面对应的控制器控制器创建好以后，接着创建控制器所管理的那个view，当这个view加载完毕以后就开始执行下面的方法了。
//所以只要viewDidLoad方法被执行了，就表示控制器所管理的view创建好了
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //动态创建一个按钮
    UIButton *btn = [[UIButton alloc] init];
//    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
//    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    //普通状态 按钮内容
    [btn setTitle:@"aaa" forState:UIControlStateNormal];
    //点击状态 按钮内容
    [btn setTitle:@"bbb" forState:UIControlStateHighlighted];
    //设置文字颜色
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    //加载图片
    UIImage *imgNormal = [UIImage imageNamed:@"A"];
    UIImage *imgHighlighted = [UIImage imageNamed:@"B"];
    //普通状态 按钮背景图
    [btn setBackgroundImage:imgNormal forState:UIControlStateNormal];
    //点击状态 按钮背景图
    [btn setBackgroundImage:imgHighlighted forState:UIControlStateHighlighted];
    //设置坐标和大小
    btn.frame = CGRectMake(370, 55, 55, 55);
    //按钮增加一个单击事件
    [btn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}
//点击按钮时间
- (IBAction)buttonClick {
    NSLog(@"-----buttonClick-------");
}
//点击按钮时间
- (IBAction)compute {
    NSLog(@"------------");
}
//复位
- (IBAction)fuwei:(id)sender {
    //清空之前设置的属性
    self.jisuan.transform = CGAffineTransformIdentity;
    self.pingyi.transform = CGAffineTransformIdentity;
    self.suofang.transform = CGAffineTransformIdentity;
    self.xuanzhuan.transform = CGAffineTransformIdentity;
}
//缩放
- (IBAction)suofang:(id)sender {
    self.jisuan.transform = CGAffineTransformScale(self.jisuan.transform, 1.1,1.1);
}
//旋转
- (IBAction)xuanzhuan:(id)sender {
    self.jisuan.transform = CGAffineTransformRotate(self.jisuan.transform, -M_PI_4);
}
//平移
- (IBAction)pingyi:(id)sender {
    self.jisuan.transform = CGAffineTransformTranslate(self.jisuan.transform, 5,5);
}

- (IBAction) jisuan:(id)sender {
    //获取用户输入数据
    NSString* str1 = self.number1.text;
    NSString* str2 = self.number2.text;
    int n1 = str1.intValue;
    int n2 = str2.intValue;
    //计算和
    int sum = n1 + n2;
    //显示结果
    self.lblResult.text = [NSString stringWithFormat:@"%d",sum];
    NSLog(@"密码: %@",self.password.text);
    //谁调出键盘谁就是第一响应者，让第一响应者辞职就可以把键盘收回
    //响应者辞职
//    self.password.resignFirstResponder;
//    self.number1.resignFirstResponder;
//    self.number2.resignFirstResponder;
    //当前view停止编辑，也可以退出键盘
    [self.view endEditing:YES];
    //平移
    self.pingyi.transform = CGAffineTransformMakeTranslation(0, -50);
    //旋转
    self.xuanzhuan.transform = CGAffineTransformMakeRotation(M_PI_4);
    //缩放
    self.suofang.transform = CGAffineTransformMakeScale(1.5, 1.5);
}

- (IBAction)suoxiao:(id)sender {
    //掌握frame［包含位置和大小）、center（只能修改位置）、bounds［只能修改大小｝bransfprm[位置、大小、旋转都可以] 的使用
    //获取按钮坐标和大小
    CGRect cgr1 = self.jisuan.frame;
    cgr1.size.width*=0.9;
    cgr1.size.height*=0.9;
    self.jisuan.frame = cgr1;
    NSLog(@"缩小 tag值为:%ld",[sender tag]);
}

- (IBAction)fangda:(id)sender {
    //bounds有为位置信息单x,y始终是0，0 无法改变位置
    CGRect cgr1 = self.jisuan.bounds;
    cgr1.size.width*=1.1;
    cgr1.size.height*=1.1;
    self.jisuan.bounds = cgr1;
    NSLog(@"放大 tag值为:%ld",[sender tag]);
}

- (IBAction)shangyi:(id)sender{
    //通过动画的方式执行
    //开启动画
    [UIView beginAnimations:nil context:nil];
    //设置动画执行时间
    [UIView setAnimationDuration:0.5];
    
    CGRect cgr1 = self.jisuan.frame;
    cgr1.origin.y-=10;
    self.jisuan.frame = cgr1;
    NSLog(@"向上 tag值为:%ld",[sender tag]);
    //提交动画
    [UIView commitAnimations];
    
    
}

- (IBAction)xiayi:(id)sender {
    //block方式实现动画效果
    [UIView animateWithDuration:0.5 animations:^{
        CGPoint cgp1 = self.jisuan.center;
        cgp1.y+=10;
        self.jisuan.center = cgp1;
        NSLog(@"向下 tag值为:%ld",[sender tag]);
    }];
}

- (IBAction)zuoyi:(id)sender {
    CGRect cgr1 = self.jisuan.frame;
    cgr1.origin.x-=10;
    self.jisuan.frame = cgr1;
    NSLog(@"向左 tag值为:%ld",[sender tag]);
}

- (IBAction)youyi:(id)sender {
    CGRect cgr1 = self.jisuan.frame;
    cgr1.origin.x+=10;
    self.jisuan.frame = cgr1;
    NSLog(@"向右 tag值为:%ld",[sender tag]);
}
@end
