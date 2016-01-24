//
//  TSServices.m
//  TopSportNews
//
//  Created by George Gameal on 24/01/16.
//  Copyright © 2016 George Gameal. All rights reserved.
//

#import "TSServices.h"
#import "AFBridge.h"

@implementation TSServices


+ (TSServices*) sharedInstance
{
    
    static TSServices* me = nil;
    if( me == nil ) {
        //    [AFBridge testPUT];
        me = [[TSServices alloc] init];
       
    }
    
    return me;
}

- (id)init
{
    self = [super init];
    if (self) {
         
        NSString * pathString = [[NSBundle mainBundle] pathForResource:@"NYTimes" ofType:@"plist"];
        
        self.urlDictionary = [NSDictionary dictionaryWithContentsOfFile:pathString];
        NSDictionary * itemDictionary =[self.urlDictionary objectForKey:@"Set User Status"];
        self.host = [itemDictionary objectForKey:@"host"];
        self.APIKey = [itemDictionary objectForKey:@"api-key"];
        self.version=[itemDictionary objectForKey:@"version"];
        self.days=[itemDictionary objectForKey:@"days"];
        self.section=[itemDictionary objectForKey:@"section"];
        
    }
    
    return self;
    
}


-(void)executeAPI:(NSString*)urlString withPath:(NSString*)path withParameters: (NSMutableDictionary*) parameters withMethod:(NSString*)method withSuccess:(void (^)(id json))success
      withFailure:(void (^)(NSInteger statusCode))failure
{
    
    
    [AFBridge executeRequest:urlString withMothod:method withParameters:parameters  withSuccess:^(id JSON) {
        
                     if(success)
                         success(JSON);
        
        
    } withFailure:^(NSInteger statusCode) {
        if(failure)
            failure(statusCode);
        
    } ];

    
}

-(void) loadArticles:(NSString*)category withOffset:(NSInteger)offset withSuccess:(void (^)(id json))success
             withFailure:(void (^)(NSInteger statusCode))failure
{
   
    
    
    NSDictionary * itemDictionary =[self.urlDictionary objectForKey:@"load-articles"];
    NSString * link = [itemDictionary objectForKey:@"link"];
    NSString * method = [itemDictionary objectForKey:@"type"];
    
    //====================
    NSString * fullLink = [NSString stringWithFormat:@"%@%@/%@/%@/%@/%@/?offset=%ld&&api-key=%@",self.host,link,self.version,self.section,category,self.days,(long)offset,self.APIKey];
    
    
    [self executeAPI:fullLink withPath:link withParameters:nil withMethod:method withSuccess:success withFailure:failure];
}







@end