//
//  VAricleRow.m
//  TopSportNews
//
//  Created by George Gameal on 24/01/16.
//  Copyright © 2016 George Gameal. All rights reserved.
//

#import "VArticleRow.h"
#import "ViewController.h"
#import "UIImageView+AFNetworking.h"
@implementation VArticleRow

-(void) start:(TSArticle*)article withController:(ViewController*)controller
{
    self.controller=controller;
    self.article=article;
    self.txtAbstract.text=self.article.abstract;
    self.txtTitle.text=self.article.title;
    
    [self performSelectorInBackground:@selector(loadImages) withObject:nil];
}

-(void)loadImages
{
    [self.imgThumb setImageWithURL:[NSURL URLWithString:self.article.thumbURL ]];
}
@end
