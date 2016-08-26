//
//  TopTableViewCell.m
//  FoldCells
//
//  Created by Yesi on 16/8/26.
//  Copyright © 2016年 Yesi. All rights reserved.
//

#import "TopTableViewCell.h"
@interface TopTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *desLabel;
@property (weak, nonatomic) IBOutlet UIImageView *showImageView;
/** arrowImageView */
@property (nonatomic, weak) UIImageView *arrowView;
@property (weak, nonatomic) IBOutlet UIButton *moreButton;

@end
@implementation TopTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UIImageView *arrowView = [[UIImageView alloc]init];
    arrowView.image = [UIImage imageNamed:@"展开"];
    arrowView.frame = self.moreButton.bounds;
    arrowView.contentMode = UIViewContentModeScaleAspectFit;
    [self.moreButton addSubview:arrowView];
    self.arrowView = arrowView;
    
    
}
- (IBAction)buttonClick:(id)sender {
//    [UIView animateWithDuration:2 animations:^{
//        if (self.model.isFold) {
//            self.arrowView.transform = CGAffineTransformIdentity;
//        }else{
//            self.arrowView.transform = CGAffineTransformMakeRotation(M_PI);
//        }
//    }];
//    __weak __typeof(self)weakSelf = self;
    
    if (self.buttonClickBlock) {
        self.buttonClickBlock(self.arrowView);
    }
    
}

- (void)setModel:(DataModel *)model{
    _model = model;
    self.nameLabel.text = model.name;
    self.timeLabel.text = model.time;
    self.desLabel.text = model.des;
    self.showImageView.image = [UIImage imageNamed:model.image];
    
}
@end
