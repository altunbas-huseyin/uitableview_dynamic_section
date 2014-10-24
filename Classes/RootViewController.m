//  RootViewController.m
//  TableView
//  Created by Deepak Kumar on 03/08/09.
//  Copyright Rose India 2009. All rights reserved.

#import "RootViewController.h"
#import "TableViewAppDelegate.h"
#import "DetailViewController.h"

@implementation RootViewController

- (void)viewDidLoad 
{
    [super viewDidLoad];
	
	//Initialize the array.
    Items = [[NSMutableArray alloc] init];
	

    
    
    for(int i = 0; i < 107; i++) {
        
        NSString *sc=  [NSString stringWithFormat:@"%d",i];
        NSArray *ulkeler = [NSArray arrayWithObjects:@"İstanbul", @"Ankara", @"İzmir", nil];
        NSArray *my_section = [NSArray arrayWithObjects:sc, nil];
        
        //NSMutableDictionary *mydict = [NSDictionary dictionaryWithObject:ulkeler forKey:@"key_ulkeler"];
        
        NSMutableDictionary *mydict =  [[NSMutableDictionary alloc] init];
        [mydict setObject: ulkeler forKey: @"key_ulkeler"];
        [mydict setObject: my_section forKey: @"key_section"];
        [mydict setObject: sc forKey: @"key_section1"];
        
        
        [Items addObject:mydict];
    }
    
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
 {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

- (void)didReceiveMemoryWarning 
{
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload 
{
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return [Items count];
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    //Number of rows it should expect should be based on the section
	
	NSDictionary *dictionary = [Items objectAtIndex:section];
    NSArray *array = [dictionary objectForKey:@"key_ulkeler"];
	return [array count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section 
{
    NSDictionary *dictionary = [Items objectAtIndex:section];
    NSString *array = [dictionary objectForKey:@"key_section1"];
    //NSString *cellValue = [array objectAtIndex:0];
    
    return array;
    /*
     if(section == 0)
     return @" Countries to visit ";
     else
     return @" Countries visited ";
     */
    
}

// Customize the appearance of table view cells.
    -(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
	{
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
	
	//First get the dictionary object
	NSDictionary *dictionary = [Items objectAtIndex:indexPath.section];
	NSArray *array = [dictionary objectForKey:@"key_ulkeler"];
	NSString *cellValue = [array objectAtIndex:indexPath.row];
	cell.textLabel.text = cellValue;
    return cell;
	
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	//Get the selected country
	
	NSDictionary *dictionary = [Items objectAtIndex:indexPath.section];
	NSArray *array = [dictionary objectForKey:@"key_ulkeler"];
	NSString *selectedCountry = [array objectAtIndex:indexPath.row];
	
	//Initialize the detail view controller and display it.
	DetailViewController *dvController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:[NSBundle mainBundle]];
	dvController.selectedCountry = selectedCountry;
	[self.navigationController pushViewController:dvController animated:YES];
	[dvController release];
	dvController = nil;
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath 
{
		return UITableViewCellAccessoryDisclosureIndicator;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath 
{
	[self tableView:tableView didSelectRowAtIndexPath:indexPath];
}

/*
// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    // Navigation logic may go here -- for example, create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController animated:YES];
	// [anotherViewController release];
}
*/


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
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
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


- (void)dealloc 
{
	[Items release];
    [super dealloc];
}
@end

