//
//  ViewController.m
//  JailBreakChecker
//
//  Created by Leo on 9/28/15.
//  Copyright © 2015 Perfectidea Inc. All rights reserved.
//

#import "ViewController.h"
#import "JailBreakChecker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    BOOL isJailBreak = [JailBreakChecker isJailBroken];
    NSLog(@"%@", isJailBreak ? @"您越獄惹" : @"沒越獄");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
