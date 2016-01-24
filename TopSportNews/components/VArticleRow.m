//
//  VAricleRow.m
//  TopSportNews
//
//  Created by George Gameal on 24/01/16.
//  Copyright © 2016 George Gameal. All rights reserved.
//

#import "VArticleRow.h"
#import "ViewController.h"
@implementation VArticleRow

-(void) start:(TSArticle*)article withController:(ViewController*)controller
{
    self.txtAbstract.text=self.article.abstract;
}
@end
