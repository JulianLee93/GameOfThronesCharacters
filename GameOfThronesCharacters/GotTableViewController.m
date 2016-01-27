//
//  GotTableViewController.m
//  GameOfThronesCharacters
//
//  Created by Julian Lee on 1/26/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "GotTableViewController.h"
#import "AppDelegate.h"
#import "Characters.h"
#import "DetailViewController.h"

@interface GotTableViewController () <DetailViewDelegate>

@property NSManagedObjectContext *moc;
@property NSArray *coreCharacterData;

@end

@implementation GotTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.moc = appDelegate.managedObjectContext;
    self.coreCharacterData = [NSArray new];
    
    NSArray *loadFromPlist = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gameofthrones" ofType:@"plist"]];
    
    
    
    //load initial characters for first instantiation of app
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (![userDefaults boolForKey:@"firstLaunch"]) {
        [userDefaults setBool:YES forKey:@"firstLaunch"];
        for (NSDictionary *tempDict in loadFromPlist) {
            Characters *character = [NSEntityDescription insertNewObjectForEntityForName:@"Characters" inManagedObjectContext:self.moc];
            character.character = [tempDict objectForKey:@"character"];
            character.actor = [tempDict objectForKey:@"actor"];
        }
    }
    NSError *error;
    [self.moc save:&error];
    [self loadCoreCharacterData];
}

-(void)saveToCore {
    [self loadCoreCharacterData];
}

- (void) loadCoreCharacterData {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Characters"];
    NSError *error;
    self.coreCharacterData = [[self.moc executeFetchRequest:request error:&error] mutableCopy];
    
    if (error == nil) {
        [self.tableView reloadData];
    } else {
        NSLog(@"AN ERROR OCCURED: %@", error.localizedDescription);
    }
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.coreCharacterData.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Characters *character = [self.coreCharacterData objectAtIndex:indexPath.row];
    cell.textLabel.text = character.character;
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


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailViewController *destination = segue.destinationViewController;
    destination.delegate = self;
}


@end
