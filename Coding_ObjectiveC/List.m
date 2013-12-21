//
//  List.m
//  Coding_ObjectiveC
//
//  Created by Alexander Kobylinskyy on 12/21/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "List.h"
#import "Node.h"

@implementation List

#pragma mark - Initialization

- (id)initWithHead:(Node *)head {
	self = [super init];
	if (self) {
		[self insertNode:head];
	}
	return self;
}

#pragma mark - ListProtocol

- (void)insertNode:(Node *)node {
	if (!_head) {
		_head = node;
		_tail = _head;
	}
	else {
		_tail.next = node;
		_tail = _tail.next; // node
	}
}

- (void)removeNode:(Node *)node {
}

- (void)insertNodeWithData:(NSInteger)data {
	Node *node = [[Node alloc] initWithData:data];
	[self insertNode:node];
}

- (void)removeNodeWithData:(NSInteger)data {
}

- (Node *)findNodeWithData:(NSInteger)data {
	Node *resultNode = nil;
	for (Node *node = _head; node != nil; node = node.next) {
		if (node.data == data) {
			resultNode = node;
			break;
		}
	}
	return resultNode;
}

- (Node *)findBeforeNodeWithData:(NSInteger)data {
	Node *resultNode = nil;
	for (Node *node = _head; node != nil; node = node.next) {
		if (node.next.data == data) {
			resultNode = node;
			break;
		}
	}
	return resultNode;
}

#pragma mark - Description

- (NSString *)description {
	NSMutableString *description = [NSMutableString string];
	Node *node = _head;
    while (node) {
		[description appendFormat:@"%@ ", node.description];
        node = node.next;
    }
	return [description copy];
}

@end