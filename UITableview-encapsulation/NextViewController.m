//
//  NextViewController.m
//  UITableview-encapsulation
//
//  Created by chuanglong02 on 16/10/19.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *lable =[[UILabel alloc]initWithFrame:CGRectMake(0, 64, 300, 100)];
    lable.numberOfLines = 0;
    
    lable.text = self.model.body;
    
    [self.view addSubview:lable];
    [lable sizeToFit];
    NSLog(@"%@",NSStringFromCGRect(lable.frame));
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
