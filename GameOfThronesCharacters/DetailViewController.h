//
//  DetailViewController.h
//  GameOfThronesCharacters
//
//  Created by Andrew Miller on 1/26/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Characters.h"
@protocol DetailViewDelegate <NSObject>

@required

@optional
-(void)saveToCore;

@end


@interface DetailViewController : UIViewController
@property (nonatomic, assign) id <DetailViewDelegate> delegate; 

@end
