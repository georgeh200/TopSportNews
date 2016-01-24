//
//  VAricleRow.h
//  TopSportNews
//
//  Created by George Gameal on 24/01/16.
//  Copyright © 2016 George Gameal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSArticle.h"

@class ViewController;
@interface VArticleRow : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *txtAbstract;
@property(strong,nonatomic) ViewController* controller;
@property(strong,nonatomic) TSArticle* article;


-(void) start:(TSArticle*)article withController:(ViewController*)controller;

@end
