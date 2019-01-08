//
//  CustomTableViewCell.m
//  virtusa_app
//
//  Created by Bharath Kumar Reddy  Vasipalli Venkata on 07/01/19.
//  Copyright © 2019 IMI. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell
@synthesize nameLbl;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
