//
//  ViewController.m
//  TopSportNews
//
//  Created by George Gameal on 24/01/16.
//  Copyright © 2016 George Gameal. All rights reserved.
//

#import "ViewController.h"
#import "TSNews.h"

static NSString* CATEGORY=@"sports";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.vProgress startAnimating];
    [[TSNews sharedInstance]refreshNew:CATEGORY];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)articlesAvailable:(NSString*) category
{
    
}





@end
