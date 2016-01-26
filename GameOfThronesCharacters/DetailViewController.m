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

@interface DetailViewController () <UITextFieldDelegate>
@property Characters *myCharacter;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myCharacter = [Characters new];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
//    [self.characterDictionary setObject:textField.text forKey: textField.restorationIdentifier];
    if ([textField.restorationIdentifier isEqualToString:@"characterTextField"]){
        self.myCharacter.character = textField.text;
    } else if ([textField.restorationIdentifier isEqualToString:@"houseTextField"]){
        self.myCharacter.house = textField.text;
    } else if ([textField.restorationIdentifier isEqualToString:@"genderTextField"]){
        self.myCharacter.gender = textField.text;
    } else if ([textField.restorationIdentifier isEqualToString:@"ageTextField"]){
        self.myCharacter.age = [NSNumber numberWithInt:[textField.text intValue]];
    } else if ([textField.restorationIdentifier isEqualToString:@"actorTextField"]){
        NSLog(@"terdFinding");
        self.myCharacter.actor = textField.text;
        NSLog(@"%@", self.myCharacter.actor); 
    }
    
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)onAddMeTouched:(id)sender {
    NSLog(@"\n\n%@", self.myCharacter.actor); 
//    [self.delegate saveToCore:self.myCharacter];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//
//}


@end
