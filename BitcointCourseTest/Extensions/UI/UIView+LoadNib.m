//
//  UIView+LoadNib.m
//  BitcointCourseTest
//
//  Created by Asan on 28.02.2018.
//  Copyright © 2018 AsanAmetov. All rights reserved.
//

#import "UIView+LoadNib.h"

@implementation UIView (LoadNib)

- (void)loadNib {
    
    NSArray *nibViews = [[NSBundle mainBundle]
                         loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    UIView *view = [nibViews objectAtIndex:0];
    
    self.bounds = view.bounds;
    self.frame = view.frame;
    self.backgroundColor = view.backgroundColor;
    
    [self addSubview:view];
    
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addConstraint:[self pin:view attribute:NSLayoutAttributeTop]];
    [self addConstraint:[self pin:view attribute:NSLayoutAttributeLeft]];
    [self addConstraint:[self pin:view attribute:NSLayoutAttributeBottom]];
    [self addConstraint:[self pin:view attribute:NSLayoutAttributeRight]];
    
    if ([(UIView<UIViewLoadNib> *)self respondsToSelector:@selector(commonInit)])
        [(UIView<UIViewLoadNib> *)self commonInit];
}

- (NSLayoutConstraint *)pin:(id)item attribute:(NSLayoutAttribute)attribute {
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:attribute
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:item
                                        attribute:attribute
                                       multiplier:1.0
                                         constant:0.0];
}

@end
