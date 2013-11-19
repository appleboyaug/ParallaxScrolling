//
//  ViewController.m
//  ScrollDemo
//
//  Created by fengjia on 13-11-19.
//  Copyright (c) 2013年 fengjia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate> {
    UIScrollView *scrollViewBackground;
    UIScrollView *scrollViewForeground;
}

@end

@implementation ViewController

- (void)dealloc {
    [scrollViewForeground release];
    [scrollViewBackground release];
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;
    //实现背景图片的滚动效果 scrollview
    scrollViewBackground = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    scrollViewBackground.pagingEnabled = YES;
    scrollViewBackground.delegate = self;
    scrollViewBackground.backgroundColor = [UIColor clearColor];
    scrollViewBackground.contentSize = CGSizeMake(width * 3, height);
    [self.view addSubview:scrollViewBackground];
    
    UIImageView *backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 3 * width, height)];
    backImageView.image = [UIImage imageNamed:@"backgroundtest1"];
    [scrollViewBackground addSubview:backImageView];
    [backImageView release];
    
    //实现前景图片的滚动效果 scrollview
    scrollViewForeground = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    scrollViewForeground.pagingEnabled = YES;
    scrollViewForeground.userInteractionEnabled = NO;
    scrollViewForeground.backgroundColor = [UIColor clearColor];
    scrollViewForeground.contentSize = CGSizeMake(width * 3, height);
    [self.view addSubview:scrollViewForeground];
    
    UIImageView *foreImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 3 * width * 1.5, height)];
    foreImageView.image = [UIImage imageNamed:@"foregroundtest1"];
    [scrollViewForeground addSubview:foreImageView];
    [foreImageView release];
    
    //增加跳入 app 首页的按钮事件
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(width * 2 + width/2 - 50, height - 200, 100, 40);
    [btn setTitle:@"启动新鲜体验" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(startUp) forControlEvents:UIControlEventTouchUpInside];
    [scrollViewBackground addSubview:btn];
  
}
- (void)startUp {
    NSLog(@"start up app");
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x <= 0) {
        scrollView.contentOffset = CGPointMake(0, 0);
        return;
    }
    if (scrollView.contentOffset.x + scrollView.frame.size.width >= scrollView.contentSize.width) {
        scrollView.contentOffset = CGPointMake(scrollView.contentSize.width - scrollView.frame.size.width, 0);
        return;
    }
    //定义前景滚动的速度.
    scrollViewForeground.contentOffset = CGPointMake(scrollViewBackground.contentOffset.x * 1.5, scrollViewBackground.contentOffset.y);
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
