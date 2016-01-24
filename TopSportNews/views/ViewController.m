//
//  ViewController.m
//  TopSportNews
//
//  Created by George Gameal on 24/01/16.
//  Copyright © 2016 George Gameal. All rights reserved.
//

#import "ViewController.h"
#import "TSNews.h"
#import "TSArticle.h"
#import "VArticleRow.h"

static NSString* CATEGORY=@"sports";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tblArticles.dataSource=self;
    self.tblArticles.delegate=self;
    self.arrArticles=[[NSMutableArray alloc]init];
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

-(void)articlesAvailable
{
   // [self.vProgress stopAnimating];
    self.vProgress.hidden=YES;
    
    [self.arrArticles removeAllObjects];
    //TSArticle* article=nil;
    for(TSArticle* ar in [TSNews sharedInstance].arrArticles)
    {
        if([ar.category isEqualToString:CATEGORY])
           [self.arrArticles addObject:ar];
    }
    [self.tblArticles reloadData];
    NSLog(@"george");
}


- (void) receiveNotification:(NSNotification *) notification
{
    
    
    if ([[notification name] isEqualToString:@"RefreshArticles"]&&[notification.userInfo[@"category"] isEqualToString:CATEGORY])
        [self articlesAvailable];
   
    
    
    
}
-(void) removeObsever
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - UITableView Delegate and DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrArticles.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TSArticle * article = self.arrArticles[indexPath.row];
    NSString * cellIdentifier = @"cellIdentifier" ;
    //   NSString * cellIdentifier =fight.fightID;
    
    VArticleRow * rowCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (rowCell == nil)
    {
        rowCell = (VArticleRow *) [[[NSBundle mainBundle]  loadNibNamed:@"articleRow" owner:nil options:nil] objectAtIndex:0];
       
        
    }
    
        
    [rowCell start:article withController:self];
    
    
    return rowCell;
}






@end
