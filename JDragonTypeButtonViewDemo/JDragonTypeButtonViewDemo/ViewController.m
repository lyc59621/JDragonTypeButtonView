//
//  ViewController.m
//  JDragonTypeButtonViewDemo
//
//  Created by JDragon on 2017/2/5.
//  Copyright © 2017年 JDragon. All rights reserved.
//

#import "ViewController.h"
#import <JDragonTypeButtonView.h>

#define RGBCOLOR(HEX)     [UIColor colorWithRed:((((HEX)>>16)&0xFF))/255. green:((((HEX)>>8)&0xFF))/255.  blue:((((HEX)>>0)&0xFF))/255. alpha:1]

@interface ViewController ()<JDragonTypeButtonActionDelegate>

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    // Do any additional setup after loading the view, typically from a nib.

    JDragonTypeButtonView  *typeBtnView = [[JDragonTypeButtonView  alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 44)];
    [typeBtnView setTypeButtonTitles:@[@"第一个",@"第二个",@"第三个"] withDownLableHeight:2 andDeleagte:self];
    [typeBtnView setTypeButtonNormalColor:RGBCOLOR(0x656565) andSelectColor:RGBCOLOR(0xde2418)];
    typeBtnView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:typeBtnView];
}
//实现代理
-(void)didClickTypeButtonAction:(UIButton*)button withIndex:(NSInteger)index
{
    NSLog(@"现在点击的是%ld个",index);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
