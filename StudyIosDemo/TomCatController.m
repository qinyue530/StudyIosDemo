//
//  TomCatController.m
//  StudyIosDemo
//
//  Created by 秦跃 on 2025/4/16.
//

#import "TomCatController.h"


@interface TomCatController ()

@end

@implementation TomCatController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"第二页"; // 设置导航栏标题
    // 创建返回按钮
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(100, 200, 200, 50);
    [backButton setTitle:@"返回首页" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(popToFirstPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
}

// 返回按钮点击事件
- (void)popToFirstPage {
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
