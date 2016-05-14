//
//  DLCustomLeftBarButtonItemViewController.m
//  DLRightPanGestureBack
//
//  Created by vera on 16/5/14.
//  Copyright © 2016年 vera. All rights reserved.
//

#import "DLCustomLeftBarButtonItemViewController.h"

@interface DLCustomLeftBarButtonItemViewController ()<UIGestureRecognizerDelegate>

@end

@implementation DLCustomLeftBarButtonItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     * 自定义leftBarButtonItem，右滑返回已经失效
     */
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:nil action:nil];
    
    
    /*
     * 解决方案，设置代理，实现gestureRecognizerShouldBegin:方法
     */
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    //导航的rootViewController关闭右滑返回功能
    if (self.navigationController.viewControllers.count <= 1)
    {
        return NO;
    }
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
