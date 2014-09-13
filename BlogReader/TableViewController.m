//
//  TableViewController.m
//  BlogReader
//
//  Created by Kar Roderick Sze Hsing on 9/13/14.
//  Copyright (c) 2014 Cloudyun. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURL *blogURL = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary/"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];

    NSError *error = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    NSLog(@"%@", dataDictionary);
    
    self.blogPosts = [dataDictionary objectForKey:@"posts"];
    
    
//    NSDictionary *blogPost1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"The Missing Widget in Android" , @"title", @"Ben Jakuben", @"author", nil];
//    NSDictionary *blogPost2 = [NSDictionary dictionaryWithObjectsAndKeys:@"Getting started with iOS Development", @"title", @"Amit Bijlani", @"author", nil];
//    NSDictionary *blogPost3 = [NSDictionary dictionaryWithObjectsAndKeys:@"An Interview with Shay Howe", @"title", @"Joe Villanueva", @"author", nil];
//
//    
//    self.blogPosts = [NSArray arrayWithObjects:blogPost1, blogPost2, blogPost3 ,nil];
    
//    self.titles =[NSArray arrayWithObjects:
//                  @"Getting started with WordPress",
//                  @"Whitespace in Web Design: What It Is and Why You Should Use It",
//                  @"Adaptive Images and Responsive SVGs - Treehous Show Episode 15",
//                  @"Productivity is About Constraints and Concentration",
//                  @"A Guide to Becoming the Smartest Developer on the Planet",
//                  @"Teacher Spotlight: Zac Gordon",
//                  @"Do You Love What You Do?",
//                  @"Applying Normalize.css Reset - Quick Tip",
//                  @"How I Wrote a Book in 3 Days",
//                  @"Responsive Techniques, JavaScript MVC Frameworks, FIrefox 16 | Treehouse Show Episode 14",
//                  nil];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
//    return [self.titles count]; // or self.titles.count

    return [self.blogPosts count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSDictionary *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    cell.textLabel.text = [blogPost valueForKey:@"title"];
    cell.detailTextLabel.text = [blogPost valueForKey:@"author"];
    
//    cell.textLabel.text = [self.titles objectAtIndex:indexPath.row];
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
