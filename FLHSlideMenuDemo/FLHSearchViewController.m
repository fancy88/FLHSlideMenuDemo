//
//  FLHSearchViewController.m
//  FLHSlideMenuDemo
//
//  Created by mac on 2018/6/15.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "FLHSearchViewController.h"

@interface FLHSearchViewController ()

@end

@implementation FLHSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Test";
    self.view.backgroundColor = [UIColor cyanColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController popViewControllerAnimated: YES];
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
