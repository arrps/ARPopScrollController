# ARPopScrollController

[![CI Status](http://img.shields.io/travis/Puru Shukla/ARPopScrollController.svg?style=flat)](https://travis-ci.org/Puru Shukla/ARPopScrollController)
[![Version](https://img.shields.io/cocoapods/v/ARPopScrollController.svg?style=flat)](http://cocoadocs.org/docsets/ARPopScrollController)
[![License](https://img.shields.io/cocoapods/l/ARPopScrollController.svg?style=flat)](http://cocoadocs.org/docsets/ARPopScrollController)
[![Platform](https://img.shields.io/cocoapods/p/ARPopScrollController.svg?style=flat)](http://cocoadocs.org/docsets/ARPopScrollController)


## Requirements

ARPopScrollController supports iOS > 7.0

## Installation

ARPopScrollController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod 'ARPopScrollController', '~> 1.0.1'

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage

The easiest way to use ARPopScrollController is to derive your UIViewController class from ARPopScrollViewController and
then implement following ARPopScrollViewDataSource/ARPopScrollViewDelegate Methods:

##ARPopScrollViewDataSource
-(NSUInteger)numberOfItemsInPopScrollView:(ARPopScrollView*)popScrollView
-(UIView*)popScroll:(ARPopScrollView*)popScrollView viewForItemAtIndex:(NSUInteger)itemIndex

##ARPopScrollViewDelegate
-(void)popScrollView:(ARPopScrollView*)popScrollView didSelectView:(UIView*)view itemAtIndex:(NSUInteger)itemIndex

## Author

Puru Shukla, puru.raj20@gmail.com

## License

ARPopScrollController is available under the MIT license.

Copyright (c) 2014 Puru Shukla <puru.raj20@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

