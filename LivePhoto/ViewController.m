//
//  ViewController.m
//  LivePhoto
//
//  Created by jam on 15/11/27.
//  Copyright © 2015年 jam.chenjun. All rights reserved.
//

#import "ViewController.h"
#import <PhotosUI/PhotosUI.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController ()
<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) UIButton *actionButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.actionButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 100, 50)];
    [self.actionButton setTitle:@"button" forState:(UIControlStateNormal)];
    [self.actionButton addTarget:self action:@selector(actionButtonPressed) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.actionButton];
}

- (void)actionButtonPressed
{
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.allowsEditing = NO;
    picker.delegate = self;
    
    NSArray *mediaTypes = @[(NSString *)kUTTypeImage, (NSString *)kUTTypeLivePhoto];
    picker.mediaTypes = mediaTypes;
    
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    PHLivePhoto *photo = [info objectForKey:UIImagePickerControllerLivePhoto];
    if (!photo) {
        return;
    }
    // create a Live Photo View
    PHLivePhotoView *photoView = [[PHLivePhotoView alloc] initWithFrame:CGRectMake(0, 100, 320, 200)];
    photoView.livePhoto = photo;
    [self.view addSubview:photoView];
    
    [self dismissViewControllerAnimated:picker completion:^{
        
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
