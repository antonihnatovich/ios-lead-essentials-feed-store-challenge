//
//  ManagedCache.swift
//  FeedStoreChallenge
//
//  Created by Антон on 5.09.21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import CoreData

@objc(ManagedCache)
internal class ManagedCache: NSManagedObject {
	@NSManaged internal var timestamp: Date
	@NSManaged internal var feed: NSOrderedSet

	internal var localFeed: [LocalFeedImage] {
		return feed.compactMap { ($0 as? ManagedFeedImage)?.local }
	}
}

extension ManagedCache {
	internal static func find(in context: NSManagedObjectContext) throws -> ManagedCache? {
		let request = NSFetchRequest<ManagedCache>(entityName: entity().name!)
		request.returnsObjectsAsFaults = false
		return try context.fetch(request).first
	}
}
