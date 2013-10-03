class Submission < ActiveRecord::Base
	#attr_accessible :name,:email,:size,:dueMonth,:dueDay,:dueYear,:gName,:gRelationship,:gEmail
def self.to_csv
	CSV.generate do |csv|
		csv << column_names
		all.each do |sub|
			csv << sub.attributes.values
		end
	end
end


end
