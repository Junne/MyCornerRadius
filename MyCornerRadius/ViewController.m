//
//  ViewController.m
//  MyCornerRadius
//
//  Created by baijf on 3/28/16.
//  Copyright © 2016 Junne. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+CornerRadius.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *myDogImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myDogImageView.image = [UIImage imageNamed:@"smileDog"];
    [self.myDogImageView bf_addCornerRadius:50];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
