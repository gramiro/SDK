//
//  DemoViewController.m
//  SDKTest
//
//  Created by Ramiro Guerrero on 20/03/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import "DemoViewController.h"
#import "TestSDKAPI.h"
@interface DemoViewController ()

@property (nonatomic, retain) NSArray *followedByArray;

@end

@implementation DemoViewController
@synthesize followedByArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   // [[TestSDKAPI sharedClient] authorizeWithScopes:[NSArray arrayWithObjects:@"relationships", nil]];
    
    //TEST BY COMMENT-UNCOMMENT THE FOLLOWING LINES
    
    //[[TestSDKAPI sharedClient] getFollowedByWithUserId:@"self" Delegate:self];
    
   // [[TestSDKAPI sharedClient] getFollowsWithUserId:@"self" Delegate:self];
    
    
    //[[TestSDKAPI sharedClient] getUserInfoWithUserID:@"self" AndWithDelegate:self];
    
   // [[TestSDKAPI sharedClient] postRelationship:@"follow" WithUserId:@"224680885" Delegate:self];
    
    //NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"2",@"count", nil];
    
    //[[TestSDKAPI sharedClient] getAuthenticatedUserFeedWithParameters:params AndWithDelegate:self];
    
    //[[TestSDKAPI sharedClient] getUserMediaWithUserID:@"1026092" Parameters:params AndWithDelegate:self];
    
    //[[TestSDKAPI sharedClient] getAuthenticatedUserLikedMediaWithParameters:params AndWithDelegate:self];
    
  //  [[TestSDKAPI sharedClient] searchUserWithQuery:@"Red Bull" AndWithDelegate:self];

    
    //[[TestSDKAPI sharedClient] getRequestedByWithDelegate:self];
    
    //[[TestSDKAPI sharedClient] getRelationshipWithUserID:@"38736160" AndWithDelegate:self];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleBordered target:self action:@selector(performLogout)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(followedByArray.count > 0)
      return [followedByArray count];
    else
        return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
    }
    if (followedByArray.count > 0) {
        cell.textLabel.text = [[self.followedByArray objectAtIndex:indexPath.row] objectForKey:@"username"];
    } else
    {
        cell.textLabel.text = @"You don't have followers";
    }
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(void)performLogout{
    [[TestSDKAPI sharedClient] logout];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - InstagramRequestsDelegate

-(void)loadFollowedByWithArray:(NSArray *)array {
    self.followedByArray = array;
    NSLog(@"Array!: %@", self.followedByArray);
    [self.tableView reloadData];

}

-(void)loadFollowsWithArray:(NSArray *)array{
    
}
@end
