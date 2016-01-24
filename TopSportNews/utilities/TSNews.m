//
//  TSNews.m
//  TopSportNews
//
//  Created by George Gameal on 24/01/16.
//  Copyright © 2016 George Gameal. All rights reserved.
//

#import "TSNews.h"
#import "TSServices.h"
#import "TSArticle.h"

@implementation TSNews

+ (TSNews *)sharedInstance {
    static TSNews *sharedInstance;
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [[TSNews alloc] init];
        }
    }
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.arrArticles=[[NSMutableArray alloc]init];
       
        
        
    }
    
    return self;
    
}

- (void) refreshNew:(NSString*)category
{
    [[TSServices sharedInstance]loadArticles:category withOffset:self.arrArticles.count withSuccess:^(id json) {
        
        if([json[@"status"] isEqualToString:@"OK"])
        {
            [self parseArticles:json[@"results"]];
            NSDictionary* userInfo = @{@"category": category};

            [[NSNotificationCenter defaultCenter]
             postNotificationName:@"RefreshArticles"
             object:self  userInfo:userInfo];
        }
        
    } withFailure:^(NSInteger statusCode) {
        
    }];
}

-(void)parseArticles:(NSArray*)articles
{
    TSArticle* article=nil;
   
    for(NSDictionary* element in articles)
    {
        article=[[TSArticle alloc]init];
        article.ID= [element[@"id"] longValue];
        article.title=element[@"title"];
        article.abstract=element[@"abstract"];
        article.url=element[@"url"];
        
        // we should make sure that those elements existing and array have lenghts and so on before gettting thumbnail
        // but let's trust nytimes for now :)
        //parse thumbnail
        article.thumbURL=element[@"media"][0][@"media-metadata"][0][@"url"];
        
        
        
        
        [self addArticle:article];
           
    }
}
-(void) addArticle:(TSArticle*) article
{
    int j=0;
    for(TSArticle* ar in self.arrArticles)
    {
        if(ar.ID==article.ID)
        {
            [self.arrArticles replaceObjectAtIndex:j withObject:article];
            return ;
        }
        j++;
    }
    [self.arrArticles addObject:article];
    
}

- (void) getMoreArticles:(NSString*)category
{
    
}


@end
