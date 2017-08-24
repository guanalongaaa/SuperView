# SuperView

![Alt text](https://github.com/guanalongaaa/SuperView/raw/master/test2.gif)


# 结合两个优秀的库组合，已单例模式来使用，之前写过一个类似的但只能在当前ViewController 使用
采用单例模式后添加到window上，可以在任意界面使用

#

+(instancetype)shareGloble;

/**
初始化
*/
-(void)setupUI;
-(void)setupUIWithframe:(CGRect)rect;


/**
显示视图
*/
-(void)showGlobalView;

/**
隐藏
*/
-(void)hideGlobalView;

1、初始化
2、可以在GlobleView.m中自定义点击事件
3.提供随时显示和隐藏界面接口

