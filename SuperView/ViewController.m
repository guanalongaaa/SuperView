//
//  ViewController.m
//  SuperView
//
//  Created by love on 2017/8/23.
//  Copyright © 2017年 guanal. All rights reserved.
//

#import "ViewController.h"

#import "TestViewController.h"

#import "GlobleView.h"

@interface ViewController ()
{
    UISwitch * Gswitch; //开关
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.title = @"首页";
    
    //初始化全局按钮方式
    [[GlobleView shareGloble]setupUI]; //默认位置
    
    //带位置初始化
//     [[GlobleView shareGloble]setupUIWithframe:CGRectMake(150, 200, 50, 50)];
    
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(135, 100, 100, 100)];
    button.backgroundColor = [UIColor blackColor];
    [button setTitle:@"跳转" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    //开关
    Gswitch = [[UISwitch alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
    [Gswitch addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventValueChanged];
    Gswitch.center = CGPointMake(self.view.center.x , self.view.center.y + 150);
    //提示
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    label.center = CGPointMake(Gswitch.center.x, Gswitch.center.y + 30);
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"小功能开关";
    [label setFont:[UIFont systemFontOfSize:12]];
    
    [self.view addSubview:label];
    [self.view addSubview:Gswitch];

    
    
    //开关状态
    NSString *state = [[NSUserDefaults standardUserDefaults] objectForKey:@"SHOWLittleSWITCH"];
    if ([state isEqualToString:@"0"] || state == nil) {
        [Gswitch setOn:YES];
    }else{
        [Gswitch setOn:NO];
    }

    
}

//跳转到下个界面
-(void)buttonClick:(UIButton *)sender{
    
    TestViewController *TVC = [[TestViewController alloc]init];
    
     [self.navigationController pushViewController:TVC animated:NO];
}


//UISwitch 点击事件
-(void)buttonAction:(UISwitch *)sender
{
    BOOL isshowG = sender.isOn;
    NSString * result = @"";
    
    if (isshowG) {
        result = @"0";
        [[GlobleView shareGloble] showGlobalView];
    }else
    {
        result = @"1";
         [[GlobleView shareGloble] hideGlobalView];
    }
    
    NSLog(@"%@",result);
    //保存状态
    [[NSUserDefaults standardUserDefaults] setObject:result forKey:@"SHOWLittleSWITCH"];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
