//
//  Characters+CoreDataProperties.h
//  GameOfThronesCharacters
//
//  Created by Julian Lee on 1/26/16.
//  Copyright © 2016 admin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Characters.h"

NS_ASSUME_NONNULL_BEGIN

@interface Characters (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *character;
@property (nullable, nonatomic, retain) NSString *house;
@property (nullable, nonatomic, retain) NSString *gender;
@property (nullable, nonatomic, retain) NSNumber *age;
@property (nullable, nonatomic, retain) NSString *actor;

@end

NS_ASSUME_NONNULL_END
