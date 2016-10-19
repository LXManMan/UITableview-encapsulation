//
//  TableViewCell.h
//  UITableview-encapsulation
//
//  Created by chuanglong02 on 16/10/19.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXModel.h"
@interface TableViewCell : UITableViewCell
+(UINib *)nib;
-(void)configureForModel:(LXModel *)model;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@end
