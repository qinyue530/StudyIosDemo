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
@property (weak, nonatomic) IBOutlet UIButton *jisuanButton;
- (IBAction)shangyi:(id)sender;
- (IBAction)youyi:(id)sender;
- (IBAction)zuoyi:(id)sender;
- (IBAction)xiayi:(id)sender;
- (IBAction)fangda:(id)sender;
- (IBAction)suoxiao:(id)sender;
- (IBAction) jisuan;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//点击按钮时间
- (IBAction)compute {
    NSLog(@"------------");
}

- (IBAction) jisuan{
    //获取用户输入数据
    NSString* str1 = self.number1.text;
    NSString* str2 = self.number2.text;
    int n1 = str1.intValue;
    int n2 = str2.intValue;
    //计算和
    int sum = n1 + n2;
    //显示结果
    self.lblResult.text = [NSString stringWithFormat:@"%d",sum];
    //谁调出键盘谁就是第一响应者，让第一响应者辞职就可以把键盘收回
    //响应者辞职
    self.number1.resignFirstResponder;
    self.number2.resignFirstResponder;
}

- (IBAction)suoxiao:(id)sender {
    //掌握frame［包含位置和大小）、center（只能修改位置）、bounds［只能修改大小｝bransfprm[位置、大小、旋转都可以] 的使用
    //获取按钮坐标和大小
    CGRect cgr1 = self.jisuanButton.frame;
    cgr1.size.width*=0.9;
    cgr1.size.height*=0.9;
    self.jisuanButton.frame = cgr1;
    NSLog(@"缩小 tag值为:%ld",[sender tag]);
}

- (IBAction)fangda:(id)sender {
    //bounds有为位置信息单x,y始终是0，0 无法改变位置
    CGRect cgr1 = self.jisuanButton.bounds;
    cgr1.size.width*=1.1;
    cgr1.size.height*=1.1;
    self.jisuanButton.bounds = cgr1;
    NSLog(@"放大 tag值为:%ld",[sender tag]);
}

- (IBAction)shangyi:(id)sender{
    //通过动画的方式执行
    //开启动画
    [UIView beginAnimations:nil context:nil];
    //设置动画执行时间
    [UIView setAnimationDuration:1];
    
    CGRect cgr1 = self.jisuanButton.frame;
    cgr1.origin.y-=10;
    self.jisuanButton.frame = cgr1;
    NSLog(@"向上 tag值为:%ld",[sender tag]);
    //提交动画
    [UIView commitAnimations];
    
    
}

- (IBAction)xiayi:(id)sender {
    CGPoint cgp1 = self.jisuanButton.center;
    cgp1.y+=10;
    self.jisuanButton.center = cgp1;
    NSLog(@"向下 tag值为:%ld",[sender tag]);
}

- (IBAction)zuoyi:(id)sender {
    CGRect cgr1 = self.jisuanButton.frame;
    cgr1.origin.x-=10;
    self.jisuanButton.frame = cgr1;
    NSLog(@"向左 tag值为:%ld",[sender tag]);
}

- (IBAction)youyi:(id)sender {
    CGRect cgr1 = self.jisuanButton.frame;
    cgr1.origin.x+=10;
    self.jisuanButton.frame = cgr1;
    NSLog(@"向右 tag值为:%ld",[sender tag]);
}
@end
