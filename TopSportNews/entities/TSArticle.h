//
//  TSArticle.h
//  TopSportNews
//
//  Created by George Gameal on 24/01/16.
//  Copyright © 2016 George Gameal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSArticle : UITableViewCell

@property(nonatomic,copy) NSString* ID;
@property(nonatomic,copy) NSString* category;  // sports
@property(nonatomic,copy) NSString* url;
@property(nonatomic,copy) NSString* thumbURL;
@property(nonatomic,copy) NSString* title;
@property(nonatomic,copy) NSString* abstract;

@end
