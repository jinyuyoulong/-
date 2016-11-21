//
//  WBAbourtViewController.m
//  正则表达式
//
//  Created by fans on 15/11/20.
//  Copyright © 2015年 FF. All rights reserved.
//

#import "WBAbourtViewController.h"

@interface WBAbourtViewController ()

@end

@implementation WBAbourtViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    NSURL *imageUrl = [NSURL URLWithString:[[NSUserDefaults standardUserDefaults] objectForKey:@"ABOUTUS"]];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:imageView];
    
    
    //增加一下语句设定给界面大小
//    self.preferredContentSize = CGSizeMake(320, 440);
//    [self setContentSizeForViewInPopover:CGSizeMake(320, 440)];
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
