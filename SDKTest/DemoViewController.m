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
    
<<<<<<< HEAD
    //[[TestSDKAPI sharedClient] authorizeWithScopes:[NSArray arrayWithObjects:@"relationships", nil]];
=======
    //[[TestSDKAPI sharedClient] authorizeWithScopes:[NSArray arrayWithObjects: @"basic", @"relationships", @"comments", nil]];
>>>>>>> origin/master
    
    //TEST BY COMMENT-UNCOMMENT THE FOLLOWING LINES
    
    //[[TestSDKAPI sharedClient] getFollowedByWithUserId:@"self" AndWithDelegate:self];
    
   // [[TestSDKAPI sharedClient] getFollowsWithUserId:@"self" AndWithDelegate:self];
    
    
    //[[TestSDKAPI sharedClient] getUserInfoWithUserID:@"self" AndWithDelegate:self];
    
   // [[TestSDKAPI sharedClient] postRelationshipWithAction:@"follow" UserId:@"224680885" AndWithDelegate:self];
    
<<<<<<< HEAD
  //  NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"2",@"count", nil];
    
    //[[TestSDKAPI sharedClient] getAuthenticatedUserFeedWithParameters:params AndWithDelegate:self];
    
   // [[TestSDKAPI sharedClient] getUserMediaWithUserID:@"self" Parameters:params AndWithDelegate:self];
=======
    //NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"4",@"count", nil];
    
    //[[TestSDKAPI sharedClient] getAuthenticatedUserFeedWithParameters:params AndWithDelegate:self];
    
    //[[TestSDKAPI sharedClient] getUserMediaWithUserID:@"31628480" Parameters:params AndWithDelegate:self];
>>>>>>> origin/master
    
    //[[TestSDKAPI sharedClient] getAuthenticatedUserLikedMediaWithParameters:params AndWithDelegate:self];
    
  //  [[TestSDKAPI sharedClient] searchUserWithQuery:@"Red Bull" AndWithDelegate:self];

  /* NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"48.858844", @"lat", @"2.294351", @"lng", @"5000", @"distance",nil];
    
    [[TestSDKAPI sharedClient] getMediaSearchWithParams:params AndWithDelegate:self];*/
    
  //  [[TestSDKAPI sharedClient] getMediaWithMediaID:@"392743925499176680_38736160" AndWithDelegate:self];
    
   // [[TestSDKAPI sharedClient] getLikesOfMediaId:@"392743925499176680_38736160" AndWithDelegate:self];
   
   // [[TestSDKAPI sharedClient] authorizeWithScopes:[NSArray arrayWithObjects:@"likes", nil]];
     
   // [[TestSDKAPI sharedClient] postLikeOnMediaWithMediaId:@"392743925499176680_38736160" AndWithDelegate:self];
    
   // [[TestSDKAPI sharedClient] removeLikeOnMediaWithMediaId:@"392743925499176680_38736160" AndWithDelegate:self];
    
   // [[TestSDKAPI sharedClient] getTagInfoWithTagName:@"boring" AndWithDelegate:self];
    
    //[[TestSDKAPI sharedClient] getSearchTagsWithTagName:@"snowy" AndWithDelegate:self];
    
  //  [[TestSDKAPI sharedClient] getRecentTags:@"snowly" WithParams:nil AndWithDelegate:self];
    
    //[[TestSDKAPI sharedClient] getPopularMediaWithDelegate:self];
    
    //[[TestSDKAPI sharedClient] getRequestedByWithDelegate:self];
    
    //[[TestSDKAPI sharedClient] getRelationshipWithUserID:@"38736160" AndWithDelegate:self];
    
    //[[TestSDKAPI sharedClient] postCommentWithMediaID:@"392743925499176680_38736160" Text:@"hola" AndWithDelegate:self];
    
    //[[TestSDKAPI sharedClient] getCommentsWithMediaID:@"392743925499176680_38736160" AndWithDelegate:self];
    
    //[[TestSDKAPI sharedClient] deleteCommentWithCommentID:@"" MediaID:@"392743925499176680_38736160" AndWithDelegate:self];
    
    
    // [[TestSDKAPI sharedClient] getLocationInfoWithLocationID:@"52029886" AndWithDelegate:self];
    
    // [[TestSDKAPI sharedClient] getLocationRecentMediaWithLocationID:@"52029886" Parameters:nil AndWithDelegate:self];
    
    
   // NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"-34.56809528990158", @"lat", @"-58.44405770301819", @"lng", nil];
   // [[TestSDKAPI sharedClient] searchLocationWithParameters:params AndWithDelegate:self];
    
    
    
    
    
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
