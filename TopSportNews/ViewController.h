//
//  ViewController.h
//  TopSportNews
//
//  Created by George Gameal on 24/01/16.
//  Copyright © 2016 George Gameal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSObserver.h"
#import "TSNews.h"

@interface ViewController : UIViewController<TSObserver>
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *vProgress;

@property(nonatomic,weak)NSMutableArray* arrArticles;
@end

