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
    
    
      JDragonTypeButtonView  *typeBtnView2 = [[JDragonTypeButtonView  alloc]initWithFrame:CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width, 44)];
    [typeBtnView2 setTypeButtonAutoTitles:@[@"第一个a",@"第二个",@"第三",@"第四个啊啊"] withDownLableHeight:3 withPaddingWeight:10  andDeleagte:self];
    [typeBtnView2 setTypeButtonNormalColor:RGBCOLOR(0x656565) andSelectColor:RGBCOLOR(0xde2418)];
    typeBtnView2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:typeBtnView2];
    
    
    
    
    
    JDragonTypeButtonView  *typeBtnView3 = [[JDragonTypeButtonView  alloc]initWithFrame:CGRectMake(0, 300, [UIScreen mainScreen].bounds.size.width, 44)];
    [typeBtnView3 setTypeButtonAutoTitles:@[@"动态",@"圈子"] withDownLableHeight:3 withPaddingWeight:60  andDeleagte:self];
    [typeBtnView3 setTypeButtonNormalColor:RGBCOLOR(0x656565) andSelectColor:RGBCOLOR(0xde2418)];
    typeBtnView3.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:typeBtnView3];
    
    
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
