//
//  DetailViewController.m
//  GameOfThronesCharacters
//
//  Created by Andrew Miller on 1/26/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "DetailViewController.h"
#import "GotTableViewController.h"
#import "Characters.h"
#import "AppDelegate.h"

@interface DetailViewController () <UITextFieldDelegate>
@property NSManagedObjectContext *moc;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.moc = appDelegate.managedObjectContext;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    return [textField resignFirstResponder];
}

- (IBAction)onAddMeTouched:(id)sender {
    Characters *myCharacter = [NSEntityDescription insertNewObjectForEntityForName:@"Characters" inManagedObjectContext:self.moc];
    for (UIStackView *stackView in self.view.subviews) {
        for (UITextField *textField in stackView.subviews) {
            if ([textField.restorationIdentifier isEqualToString:@"charTextField"]){
                myCharacter.character = textField.text;
            } else if ([textField.restorationIdentifier isEqualToString:@"houseTextField"]){
                myCharacter.house = textField.text;
            } else if ([textField.restorationIdentifier isEqualToString:@"genderTextField"]){
                myCharacter.gender = textField.text;
            } else if ([textField.restorationIdentifier isEqualToString:@"ageTextField"]){
                myCharacter.age = [NSNumber numberWithInt:[textField.text intValue]];
            } else if ([textField.restorationIdentifier isEqualToString:@"actorTextField"]){
                myCharacter.actor = textField.text;
            }
        }
    }
    
    // load image
    NSData *imageData = UIImagePNGRepresentation([UIImage imageNamed:@"1"]);
    myCharacter.picture = imageData;
    
    NSError *error;
    [self.moc save:&error];
    [self.delegate saveToCore];
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//
//}


@end
