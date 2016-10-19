//
//  TableViewCell.m
//  UITableview-encapsulation
//
//  Created by chuanglong02 on 16/10/19.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell
+(UINib *)nib
{
    NSString *nibName = NSStringFromClass(self);
    return [UINib nibWithNibName:nibName bundle:nil];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)configureForModel:(LXModel *)model
{
    self.titleLabel.text = model.title;
    self.bodyLabel.text = model.body;
}
@end
