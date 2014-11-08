class ProposalAdministrator

	attr_reader :proposals

	def initialize()
		@proposals = []
	end

	def add_proposal(a_proposal)
		@proposals << verify_title(a_proposal)
	end

	def verify_title(a_proposal)
		@proposals.each do |proposal|
			if proposal.same_title? a_proposal
				a_proposal.append_author_to_title				
			end
		end
		a_proposal
	end
end