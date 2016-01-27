//
//  DetailTableViewCell.h
//  GameOfThronesCharacters
//
//  Created by Julian Lee on 1/26/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *mainImage;

@property (weak, nonatomic) IBOutlet UILabel *characterLabel;
@property (weak, nonatomic) IBOutlet UIImageView *houseImage;
@property (weak, nonatomic) IBOutlet UILabel *actorLabel;

@end
