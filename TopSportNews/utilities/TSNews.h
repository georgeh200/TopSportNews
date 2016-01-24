//
//  TSNews.h
//  TopSportNews
//
//  Created by George Gameal on 24/01/16.
//  Copyright © 2016 George Gameal. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TSNews : NSObject
@property(strong,nonatomic) NSMutableArray* arrArticles;

+ (TSNews*)sharedInstance;
- (TSNews*)init;

- (void) refreshNew:(NSString*)category;
- (void) getMoreArticles:(NSString*)category;




@end
