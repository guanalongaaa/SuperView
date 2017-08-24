//
//  GlobleView.m
//  SuperView
//
//  Created by love on 2017/8/23.
//  Copyright © 2017年 guanal. All rights reserved.
//

#import "GlobleView.h"

@implementation GlobleView

static GlobleView * galView;

+(instancetype)shareGloble{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        galView = [[GlobleView alloc]init];
    });
    return galView;
    
}


/**
 不带坐标初始化
 */
-(void)setupUI{
    
    self.globleView = [[WMDragView alloc] initWithFrame:CGRectMake(0, 0 , 50, 50)];
    self.globleView.layer.cornerRadius = 14;
    self.globleView.isKeepBounds = NO; // 是不是保持在边界，默认为NO,没有黏贴边界效果
    self.globleView.dragEnable = YES; //对否可以拖拽  默认yes
    self.globleView.imageView.image = [UIImage imageNamed:@"icon_weather"];
    [self.globleView setBackgroundColor:[UIColor redColor]];
    
    UIWindow *win = [UIApplication sharedApplication].keyWindow;
    
    [win addSubview:self.globleView];

    
    self.globleView.center = win.center;
    
    __block GlobleView *WeakSelf = self;
    
    self.globleView.ClickDragViewBlock = ^(WMDragView *dragView){
        
        [WeakSelf showAnotherView];
        
    };
}

/**
 带坐标初始化
 */
-(void)setupUIWithframe:(CGRect)rect
{
    CGFloat x = rect.origin.x;
    CGFloat y = rect.origin.y;
    CGFloat h = rect.size.height;
    CGFloat w = rect.size.width;
    
    self.globleView = [[WMDragView alloc] initWithFrame:CGRectMake(x, y , h, w)];
    self.globleView.layer.cornerRadius = 15;
    self.globleView.isKeepBounds = NO;
    self.globleView.imageView.image = [UIImage imageNamed:@"icon_weather"];
    [self.globleView setBackgroundColor:[UIColor redColor]];
    
    UIWindow *win = [UIApplication sharedApplication].keyWindow;
    
    [win addSubview:self.globleView];
    
    __block GlobleView *WeakSelf = self;
    
    self.globleView.ClickDragViewBlock = ^(WMDragView *dragView){
        
        [WeakSelf showAnotherView];
        
    };

}


/**
 全局按钮点击事件
 */
-(void)showAnotherView
{
    PopoverView *popoverView = [PopoverView popoverView];
    [popoverView showToView:self.globleView withActions:[self QQActions]];
}


/**
 单个事件点击

 @return 点击弹出视图数组
 */
- (NSArray<PopoverAction *> *)QQActions {
    // 发起多人聊天 action
    PopoverAction *multichatAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_multichat"] title:@"发起多人聊天" handler:^(PopoverAction *action) {
#pragma mark - 该Block不会导致内存泄露, Block内代码无需刻意去设置弱引用.
        
        NSLog(@"点击发起多人聊天");
        
    }];
    // 加好友 action
    PopoverAction *addFriAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_addFri"] title:@"加好友" handler:^(PopoverAction *action) {
        
        NSLog(@"点击加好友");
    }];
    // 扫一扫 action
    PopoverAction *QRAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_QR"] title:@"扫一扫" handler:^(PopoverAction *action) {
        
        NSLog(@"点击扫一扫");
    }];
    // 面对面快传 action
    PopoverAction *facetofaceAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_facetoface"] title:@"面对面快传" handler:^(PopoverAction *action) {
        
        NSLog(@"点击面对面快传");
    }];
    // 付款 action
    PopoverAction *payMoneyAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"right_menu_payMoney"] title:@"付款" handler:^(PopoverAction *action) {
        
        NSLog(@"点击付款");
    }];
    
    return @[multichatAction, addFriAction, QRAction, facetofaceAction, payMoneyAction];
}


//显示
-(void)showGlobalView
{
    self.globleView.hidden = NO;
}
//隐藏
-(void)hideGlobalView
{
    self.globleView.hidden = YES;
}


@end
