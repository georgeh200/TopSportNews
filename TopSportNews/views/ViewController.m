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
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveNotification:)
                                                 name:@"RefreshArticles"
                                               object:nil];
    
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


- (void) receiveNotification:(NSNotification *) notification
{
    // [notification name] should always be @"TestNotification"
    // unless you use this method for observation of other notifications
    // as well.
    
    if (![[notification name] isEqualToString:@"RefreshArticles"]||![notification.userInfo[@"category"] isEqualToString:CATEGORY])
        return;
    NSLog(@"RefreshArticlesRefreshArticlesRefreshArticles");
    
}





@end
