//
//  ViewController.m
//  JZProgressView
//
//  Created by wanhongios on 17/2/23.
//  Copyright © 2017年 wanhongios. All rights reserved.
//

#import "ViewController.h"
#import "JZProgressView.h"
@interface ViewController ()

@end

@implementation ViewController{
    JZProgressView *progressView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    progressView = [[JZProgressView alloc]initWithFrame:CGRectMake(40,80, 100, 100)];
    progressView.layer.backgroundColor = [UIColor greenColor].CGColor;
    
    progressView.progressColor = [UIColor redColor];
    progressView.progressStrokeWidth = 5.f;
    progressView.progressTrackColor = [UIColor blackColor];
    
    [self.view addSubview:progressView];
    
    UILabel * testLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    testLabel.text = @"50%";
    testLabel.font = [UIFont systemFontOfSize:16];
    testLabel.textColor = [UIColor blackColor];
    testLabel.textAlignment = NSTextAlignmentCenter;
    progressView.centerView = testLabel;
    
    
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(changeProgressValue) userInfo:nil repeats:YES];
}

- (void)changeProgressValue
{
    progressView.progressValue += 0.1;
    if (progressView.progressValue>=1.f) {
        progressView.progressValue = 0.1f;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
