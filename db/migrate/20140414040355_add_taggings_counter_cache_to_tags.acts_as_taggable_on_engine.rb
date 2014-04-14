# This migration comes from acts_as_taggable_on_engine (originally 3)
class AddTaggingsCounterCacheToTags < ActiveRecord::Migration
	
	def change
		add_column :tags, :taggings_count, :integer, default: 0
	end


end
